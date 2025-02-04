package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.UserDao;
import com.project.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public UserVo login(UserVo userVo) {
		System.out.println("userService:login");
		
		return userDao.selectUser(userVo);
	}
	
	public int idCheck(String id) {
		System.out.println("userService.idCheck");
		
		return userDao.selectSameId(id);
	}

	public boolean signUp(UserVo vo) {
		System.out.println("userService.signUp");
		
		return userDao.insertUser(vo);
	}

}
