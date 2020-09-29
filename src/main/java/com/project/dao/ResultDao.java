package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.HeartRateVo;
import com.project.vo.LactateVo;

@Repository
public class ResultDao {

	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertLactate(LactateVo lVo) {
		return sqlSession.insert("result.insertLactate", lVo) == 1;
	}
	
	public boolean insertHeartRate(HeartRateVo hVo) {
		return sqlSession.insert("result.insertHeartRate", hVo) == 1;
	}
	
	public int selectKey() {
		return sqlSession.selectOne("result.selectKey");
	}
	
	public List<LactateVo> selectTestDate(int userNo) {
		return sqlSession.selectList("result.selectTestDate", userNo);
	}
	
	public LactateVo selectRecentLac(int userNo) {
		return sqlSession.selectOne("result.selectRecentLac", userNo);
	}
	
	public HeartRateVo selectRecentHR(int userNo) {
		return sqlSession.selectOne("result.selectRecentHR", userNo);
	}

	public LactateVo selectFirstLac(int userNo) {
		return sqlSession.selectOne("result.selectFirstLac", userNo);
	}

	public HeartRateVo selectFirstHR(int userNo) {
		return sqlSession.selectOne("result.selectFirstHR", userNo);
	}
}
