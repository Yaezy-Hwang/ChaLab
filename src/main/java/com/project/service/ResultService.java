package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDao;
import com.project.dao.ResultDao;
import com.project.vo.HeartRateVo;
import com.project.vo.LactateVo;
import com.project.vo.UserVo;

@Service
public class ResultService {
	
	@Autowired
	private ResultDao resultDao;
	
	@Autowired
	private AdminDao adminDao;

	public Map<String, Object> getResult(int userNo){
		
		List<LactateVo> dateList = resultDao.selectTestDate(userNo);
		
		LactateVo firstLac = resultDao.selectFirstLac(userNo);
		HeartRateVo firstHR = resultDao.selectFirstHR(userNo);
		LactateVo recentLac = resultDao.selectRecentLac(userNo);
		HeartRateVo recentHR = resultDao.selectRecentHR(userNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("athInfo", adminDao.selectAthInfo(userNo));
		map.put("dateList", dateList);
		map.put("firstLac", firstLac);
		map.put("firstHR", firstHR);
		if(dateList.size() != 0) {
			if( !firstLac.getMeasureDate().equals(recentLac.getMeasureDate()) ) {
				map.put("recentLac", recentLac);
				map.put("recentHR", recentHR);
			}
		}
	
		return map;
	}
	
	public UserVo athInfo(int userNo){
		return adminDao.selectAthInfo(userNo);
	}
	
	public boolean recording(LactateVo lVo, HeartRateVo hVo) {
		int resultNo = resultDao.selectKey();
		lVo.setResultNo(resultNo);
		hVo.setResultNo(resultNo);
		
		boolean resultL = resultDao.insertLactate(lVo);
		boolean resultH = resultDao.insertHeartRate(hVo);
		
		if( resultL && resultH ) {
			return true;
		}else {
			return false;
		}
	}
}
