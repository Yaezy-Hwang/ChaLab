package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ResultDao;
import com.project.vo.UserVo;

@Service
public class ResultService {
	
	@Autowired
	private ResultDao resultDao;

	public UserVo showUserInfo(int userNo) {
		System.out.println("service.정보 가져오기");
		
		return resultDao.selectUserInfo(userNo);
	}
	
	
}
