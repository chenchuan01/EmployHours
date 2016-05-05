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
			
		} else {
			
			return EmpConstants.VIEW_HOME;
			
		}

	}

}
