package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.ResultService;
import com.project.vo.HeartRateVo;
import com.project.vo.LactateVo;

@Controller
@RequestMapping("/result")
public class ResultController {
	
	@Autowired
	ResultService resultService;
	
	@RequestMapping("/resultPage/{userNo}")
	public String showResult(@PathVariable int userNo, Model model) {
		System.out.println("/showResult");
		
		model.addAttribute("resultMap", resultService.getResult(userNo));
		
		return "admin/result";
	}
	
	@RequestMapping("/recordPage/{userNo}")
	public String recordPage(@PathVariable int userNo, Model model) {
		System.out.println("/recordPage");
		
		model.addAttribute("athInfo", resultService.athInfo(userNo));
		
		return "admin/recordPage";
	}
	
	@RequestMapping("/recording/{userNo}")
	public String recording(@ModelAttribute LactateVo lVo, @ModelAttribute HeartRateVo hVo) {
		System.out.println("/recording");
		
		if(resultService.recording(lVo, hVo)) {
			return "redirect:/result/resultpage"+lVo.getUserNo();
		}else {
			return "error";
		}
	}
	
}
