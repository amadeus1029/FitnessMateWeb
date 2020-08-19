package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int selectSameId(String id) {
		System.out.println("userDao.insertUser");
		
		return sqlSession.selectOne("user.selectSameId", id);
	}

}
