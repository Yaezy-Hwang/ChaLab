package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public UserVo selectUser(UserVo userVo) {
		System.out.println("userDao.selectUser");
		
		UserVo authUser = sqlSession.selectOne("user.selectUser", userVo);
		System.out.println(authUser);
		
		return authUser;
	}

}
