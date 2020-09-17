package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.service.ResultService;
import com.project.vo.UserVo;

@Controller
public class ResultController {
	
	@Autowired
	private ResultService resultService;
	
	@RequestMapping("/result")
	public String resultPage(Model model, @RequestParam("userNo") int userNo) {
		System.out.println("con.정보 가져오기");
		
		UserVo vo = resultService.showUserInfo(userNo);
		model.addAttribute("userInfo", vo);
		
		return "result/result";
	}

}
