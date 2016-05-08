package com.emp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.emp.db.entity.EmpHour;
import com.emp.db.service.EmpHourService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.common.util.StringUtil;
import com.sys.db.DBConstants;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 *EmpHourController.java
 */
@Controller
@RequestMapping("/empHour")
public class EmpHourController extends BaseController {

	@Resource
	EmpHourService empHourService;
	@Resource
	UserService userService;
	
	
	@RequestMapping("/hoursCheck")
	public @ResponseBody User hoursCheck(String id,Integer checkFlag,HttpSession session) throws AppExpection{
		if(StringUtil.isNotNull(id)){
			String errorMsg="";
			String empNo="";
			for (String empId : id.split(",")) {
				
				try {
					int empHourId = Integer.valueOf(empId);
					EmpHour empHour = empHourService.findById(empHourId);
					
					User emp = userService.queryByEmpNo(empHour.getEmpno());
					empNo = emp.getEmpno();
					
					empHour.setStatus(checkFlag);
					
					empHourService.updateEntity(empHour);
					
				} catch (Exception e) {
					errorMsg=errorMsg+empNo+",";
					LogUtil.error(getClass(), e.getMessage(), e);;
				}
			}
			if(StringUtil.isNotNull(errorMsg)){
				throw new AppExpection(
						"EmpHourController.hoursCheck"
						+ "(String, Integer, HttpSession)", 
						"����Ա������ʧ�ܣ�"+errorMsg);
			}
		}
		return SessionUtil.sysUser(session);
	}
	/**
	 * Ա����ʱ��ҳ
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "empHourPage")
	public @ResponseBody
	PageResult<EmpHour> empHourListPage(QueryParam<EmpHour> params, Model m, EmpHour empHour) {
		params.setParam(empHour);
		params.setOrderFiled("workdate");
		params.setOrderType(DBConstants.DML_ORDER_DESC);
		PageResult<EmpHour> result = empHourService.pageQuery(params);
		return result;
	}
	/**
	 * Ա����ʱ����
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "empHourForm")
	public String empHourForm(Integer id, Model m) {
		if(id!=null){
			EmpHour empHour = empHourService.findById(id);
			m.addAttribute("empHour", empHour);
		}
		
		return "form/empHourForm";
	}
	/**
	 * Ա����ʱ�޸�
	 * 
	 * @param empHour
	 * @return
	 */
	@RequestMapping(value = "empHourModify")
	public @ResponseBody EmpHour empHourModify(EmpHour empHour, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			empHour.setEmpdep(sysUser.getDep());
			empHour.setEmpname(sysUser.getName());
			if(empHour!=null&&empHour.getId()!=null){
				empHourService.updateEntity(empHour);
				LogUtil.info(getClass(),"EmpHourController.empHourModify(EmpHour)", "Ա����ʱ�޸�");
			}else{
				empHourService.saveEntity(empHour, sysUser);
				LogUtil.info(getClass(),"EmpHourController.empHourModify(EmpHour)", "Ա����ʱ����");
			}
			
			
		} catch (AppExpection e) {
			LogUtil.error(getClass(), e);;
		}

		return empHour;
	}

	/**
	 * Ա����ʱɾ��
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "empHourDelete")
	public @ResponseBody EmpHour empHourDelete(Integer id) {
		EmpHour empHour = empHourService.findById(id);
		empHourService.deleteEntity(empHour);
		return empHour;
	}


}
