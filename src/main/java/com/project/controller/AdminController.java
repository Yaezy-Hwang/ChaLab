package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/admin-main")
	public String adminMain() {
		System.out.println("/admin-main");
		
		return "admin/admin-main";
	}
	
	@RequestMapping("/result")
	public String result() {
		System.out.println("/result");
		
		return "admin/result";
	}
}
