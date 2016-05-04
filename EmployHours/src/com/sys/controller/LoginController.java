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
 * ��¼
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
					"�û���������Ϊ�գ�"), LOGINPAGE);
		}
		userName = userName.trim();
		password = password.trim();
		User loginUser = userService.userVerify(new User(userName, password));
		if (loginUser == null) {
			return forwordExpPage(m, new AppExpection(
					"LoginController.verifyLogin(User, Model, HttpSession)",
					"�û�������������δע�ᣡ"), LOGINPAGE);
		}

		// ��¼��֤
		session.setAttribute(SysConstants.SYSUSER, loginUser);
		return TO_INDEX;
	}


	@RequestMapping(value = "regist")
	public String registUser(User user, Model m, String code,
			HttpSession session) {
		
		if (user == null ||StringUtil.isNull(user.getEmpno())|| StringUtil.isNull(user.getPassword())) {
			return forwordExpPage(m,
					new AppExpection("LoginController.registUser(User,Model)",
							"ע���û�����Ϊ�գ��������룡"), LOGINPAGE);
		}
		user.setUserName(user.getEmpno());
		boolean result = userService.userRegist(user) != null;
		if (!result) {
			return forwordExpPage(m, new AppExpection(
					"LoginController.registUser(User,Model)",
					"ע�����û������쳣������ϵ����Ա��"), LOGINPAGE);
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
							"�û�����Ϊ�գ��������룡");
		}
		String newPwd = user.getPassword();
		user.setPassword("");
		User query = new User();
		query.setEmpno(user.getEmpno());
		User dbUser = userService.findEntity(query);
		String errorMsg="";
		if(!user.getName().equalsIgnoreCase(dbUser.getName())){
			errorMsg = "Ա��������ƥ�䣡";
		}else if(!user.getEmpno().equalsIgnoreCase(dbUser.getEmpno())){
			errorMsg = "Ա�����Ų�ƥ�䣡";
		}else if(!user.getTel().equalsIgnoreCase(dbUser.getTel())){
			errorMsg = "Ա���绰��ƥ�䣡";
		}else if(!user.getIdno().equalsIgnoreCase(dbUser.getIdno())){
			errorMsg = "���֤��Ϣ��ƥ�䣡";
		}else if(!user.getBirth().equalsIgnoreCase(dbUser.getBirth())){
			errorMsg = "�������ڲ�ƥ�䣡";
		}else if(!user.getDep().equalsIgnoreCase(dbUser.getDep())){
			errorMsg = "���Ų�ƥ�䣡";
		}
		if(StringUtil.isNotNull(errorMsg)){
			throw new AppExpection("LoginController.findPassword(User,Model)", "��������ʧ�ܣ�ԭ��"+errorMsg);
		}
		dbUser.setPassword(newPwd);
		user= userService.userUpdate(dbUser);
		if (user==null) {
			throw new AppExpection(
					"LoginController.findPassword(User,Model)",
					"�����һس����쳣������ϵ����Ա��");
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
