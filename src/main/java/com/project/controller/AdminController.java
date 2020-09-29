package com.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.AdminService;
import com.project.vo.UserVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@RequestMapping("/manageUser")
	public String manageUser(Model model) {
		System.out.println("/manageUser");
		
		Map<String, Object> map = adminService.getAthList();
		model.addAttribute("athleteMap", map);
		
		return "admin/manageUser";
	}
	
	@RequestMapping("/addUser")
	public String addUser(Model model) {
		System.out.println("/addUser");
		
		List<UserVo> adminList = adminService.getAdminList();
		model.addAttribute("adminList", adminList);
		
		return "admin/addUser";
	}
	
	
	//API
	@ResponseBody
	@RequestMapping("/getAthlInfo")
	public UserVo getAthInfo(int userNo) {
		System.out.println("/getAthInfo");
		
		return adminService.getAthInfo(userNo);
	}
	
	@ResponseBody
	@RequestMapping("/modifyAthInfo")
	public boolean modifyAthInfo(UserVo userVo) {
		System.out.println("/modifyAthInfo");
		
		return adminService.modifyAthInfo(userVo);
	}
	
}
