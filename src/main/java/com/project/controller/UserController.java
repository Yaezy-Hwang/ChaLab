package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
			return "redirect:/admin/manageUser";
			
		} else{ //로그인 실패 시
			System.out.println("실패");
			
			return "redirect:/main?login=fail";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("/user/logout");
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@RequestMapping("/signUp")
	public String signUp(@ModelAttribute UserVo vo) {
		System.out.println("/signUp");
		
		boolean result = userService.signUp(vo);
		
		if(result) {
			return "redirect:/admin/manageUser";
		}else {
			return "redirect:/error";
		}
	}
	
	  //API controller
    @ResponseBody
    @RequestMapping("/idCheck")
    public boolean idCheck(String newId) {
    	System.out.println("/idCheck");
    	
    	int sameId = userService.idCheck(newId);
		boolean result = false;
		
		if(sameId == 0) {
			result = true;
		}
		
		return result;
    }
	
	
}
