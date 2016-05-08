package com.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.emp.EmpConstants;
import com.sys.base.BaseController;

/**
 * HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController extends BaseController {

	/**
	 * @return
	 * 
	 */
	@RequestMapping({ "", "/mypage" })
	public String homePage(String view) {
		if (EmpConstants.MENU_USERLIST.equalsIgnoreCase(view)) {

			return EmpConstants.VIEW_CONTENT + EmpConstants.MENU_USERLIST;

		} else if (EmpConstants.MENU_CONFIGLIST.equalsIgnoreCase(view)) {

			return EmpConstants.VIEW_CONTENT + EmpConstants.MENU_CONFIGLIST;

		} else if (EmpConstants.HOURSCHECK.equalsIgnoreCase(view)) {
			
			return EmpConstants.VIEW_CONTENT + EmpConstants.HOURSCHECK;
			
		}else if (EmpConstants.HOURSLIST.equalsIgnoreCase(view)) {
			
			return EmpConstants.VIEW_CONTENT + EmpConstants.HOURSLIST;
			
		} else if (EmpConstants.DEPUSERS.equalsIgnoreCase(view)) {
			
			return EmpConstants.VIEW_CONTENT + EmpConstants.DEPUSERS;
			
		} else if (EmpConstants.MYHOURS.equalsIgnoreCase(view)) {
			
			return EmpConstants.VIEW_CONTENT + EmpConstants.MYHOURS;
			
		}else if (EmpConstants.DEPHOURSLIST.equalsIgnoreCase(view)) {
			
			return EmpConstants.VIEW_CONTENT + EmpConstants.DEPHOURSLIST;
			
		}else {

			return EmpConstants.VIEW_HOME;

		}

	}

}
