package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDao;
import com.project.vo.UserVo;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	public Map<String, Object> getAthList() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("athList", adminDao.selectAthList());
		map.put("adminList", getAdminList());
		
		return map;
	}

	public UserVo getAthInfo(int userNo) {
		
		return adminDao.selectAthInfo(userNo);
	}
	
	public List<UserVo> getAdminList(){
		return adminDao.selectAdminList();
	}

	public boolean modifyAthInfo(UserVo userVo) {
		return adminDao.updateAthInfo(userVo);
	}
	

}
