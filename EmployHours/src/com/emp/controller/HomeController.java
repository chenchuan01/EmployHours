package com.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.base.BaseController;

/**
 *HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController extends BaseController {
	
	/**
	 * @return
	 * 
	 */
	@RequestMapping({"","/mypage"})
	public String homePage(){
		return "home";
	}
	
}
