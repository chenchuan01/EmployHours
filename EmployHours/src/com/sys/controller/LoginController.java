package com.sys.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mchange.v2.c3p0.stmt.GooGooStatementCache;
import com.sys.SysConstants;
import com.sys.base.BaseController;
import com.sys.common.AppExpection;
import com.sys.common.util.SessionUtil;
import com.sys.common.util.StringUtil;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 * 登录
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {
	private static final String LOGINPAGE = "login/login";
	private static final String REGISTPAGE = "login/regist";
	private static final String TO_INDEX = "redirect:/home.do";
	@Resource
	UserService userService;

	@RequestMapping(value = "")
	public String tologin(HttpSession session) throws InterruptedException {
		if (null != SessionUtil.sysUser(session)) {
			return TO_INDEX;
		}
		return LOGINPAGE;
	}


	@RequestMapping(value = "verify")
	public String verifyLogin(Model m, HttpSession session, String userName,
			String password, String code) {
		if (StringUtil.isNull(userName) || StringUtil.isNull(password)) {
			return forwordExpPage(m, new AppExpection(
					"LoginController.verifyLogin(User, Model, HttpSession)",
					"用户名或密码为空！"), LOGINPAGE);
		}
		userName = userName.trim();
		password = password.trim();
		User loginUser = userService.userVerify(new User(userName, password));
		if (loginUser == null) {
			return forwordExpPage(m, new AppExpection(
					"LoginController.verifyLogin(User, Model, HttpSession)",
					"用户名或密码错误或未注册！"), LOGINPAGE);
		}

		// 登录验证
		session.setAttribute(SysConstants.SYSUSER, loginUser);
		return TO_INDEX;
	}


	@RequestMapping(value = "regist")
	public String registUser(User user, Model m, String code,
			HttpSession session) {
		
		if (user == null ||StringUtil.isNull(user.getEmpno())|| StringUtil.isNull(user.getPassword())) {
			return forwordExpPage(m,
					new AppExpection("LoginController.registUser(User,Model)",
							"注册用户对象为空！请检查输入！"), LOGINPAGE);
		}
		user.setUserName(user.getEmpno());
		boolean result = userService.userRegist(user) != null;
		if (!result) {
			return forwordExpPage(m, new AppExpection(
					"LoginController.registUser(User,Model)",
					"注册新用户出现异常！请联系管理员！"), LOGINPAGE);
		}
		return TO_INDEX;
	}
	@RequestMapping(value = "forget")
	public @ResponseBody User findPassword(User user, Model m, String code,
			HttpSession session) throws AppExpection{
		if (user == null || StringUtil.isNull(user.getName())
				||StringUtil.isNull(user.getEmpno())
				|| StringUtil.isNull(user.getPassword())) {
				throw new AppExpection("LoginController.findPassword(User,Model)",
							"用户对象为空！请检查输入！");
		}
		String newPwd = user.getPassword();
		user.setPassword("");
		User query = new User();
		query.setEmpno(user.getEmpno());
		User dbUser = userService.findEntity(query);
		String errorMsg="";
		if(!user.getName().equalsIgnoreCase(dbUser.getName())){
			errorMsg = "员工姓名不匹配！";
		}else if(!user.getEmpno().equalsIgnoreCase(dbUser.getEmpno())){
			errorMsg = "员工工号不匹配！";
		}else if(!user.getTel().equalsIgnoreCase(dbUser.getTel())){
			errorMsg = "员工电话不匹配！";
		}else if(!user.getIdno().equalsIgnoreCase(dbUser.getIdno())){
			errorMsg = "身份证信息不匹配！";
		}else if(!user.getBirth().equalsIgnoreCase(dbUser.getBirth())){
			errorMsg = "出身日期不匹配！";
		}else if(!user.getDep().equalsIgnoreCase(dbUser.getDep())){
			errorMsg = "部门不匹配！";
		}
		if(StringUtil.isNotNull(errorMsg)){
			throw new AppExpection("LoginController.findPassword(User,Model)", "密码重置失败，原因："+errorMsg);
		}
		dbUser.setPassword(newPwd);
		user= userService.userUpdate(dbUser);
		if (user==null) {
			throw new AppExpection(
					"LoginController.findPassword(User,Model)",
					"密码找回出现异常！请联系管理员！");
		}
		return user;
	}

	@RequestMapping(value = "logout")
	public void logOut(HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		if (SessionUtil.sysUser(session) != null) {
			session.invalidate();
		}
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + request.getContextPath()
				+ "/";
		response.sendRedirect(basePath+"login.do");
	}
}
