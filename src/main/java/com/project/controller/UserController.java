package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.UserService;
import com.project.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("/user/login");
		
		UserVo authUser = userService.login(userVo);
		
		if(authUser != null) { //로그인 성공 시
			session.setAttribute("authUser", authUser);
			
			if("athlete".equals(authUser.getType())) {
				System.out.println("선수 로그인");
				
				return "redirect:/result?userNo="+authUser.getUserNo();
				
			} else if("admin".equals(authUser.getType())){
				System.out.println("관리자 로그인");
				
				return "redirect:/adminPage";
			}
			
		} else{ //로그인 실패 시
			System.out.println("로그인 실패");
			
			return "redirect:/main?login=fail";
		}
		
		return "redirect:/main?login=fail";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("/user/logout");
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/main";
	}
	
	/*
	@RequestMapping("/modifyForm")
	public String modifyForm() {
		System.out.println("/user/modifyForm");
		
		return "user/modifyForm";
	}
	
	@RequestMapping("/modify") 
	public String modify(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("/user/modify");
		
		userService.modify(userVo); //수정된 user
		UserVo authUser = (UserVo) session.getAttribute("authUser"); //세션에 있는 user
		
		//세션에 정보추가
		authUser.setPassword(userVo.getPassword());
		authUser.setName(userVo.getName());
		authUser.setGender(userVo.getGender());
		
		return "redirect:/main";
	}
	*/

}
