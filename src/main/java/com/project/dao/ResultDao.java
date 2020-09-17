package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.UserVo;

@Repository
public class ResultDao {

	@Autowired
	private SqlSession sqlSession;
	
	public UserVo selectUserInfo(int userNo) {
		System.out.println("userDao.selectUser");
		
		return sqlSession.selectOne("result.selectUserInfo", userNo);
	}
}
