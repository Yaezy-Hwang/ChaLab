package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.UserVo;

@Repository
public class AdminDao {

	@Autowired
	private SqlSession sqlSession;

	public List<UserVo> selectAthList() {
		return sqlSession.selectList("user.selectAthList");
	}

	public UserVo selectAthInfo(int userNo) {
		return sqlSession.selectOne("user.selectAthInfo", userNo);
	}

	public List<UserVo> selectAdminList() {
		return sqlSession.selectList("user.selectAdminList");
	}

	public boolean updateAthInfo(UserVo userVo) {
		System.out.println(userVo);
		
		return sqlSession.update("user.updateAthInfo", userVo) == 1;
	}
	
	
}
