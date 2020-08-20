package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int selectSameId(String id) {
		System.out.println("userDao.selectSameId");
		
		return sqlSession.selectOne("user.selectSameId", id);
	}

	public void insertUser(UserVo vo) {
		System.out.println("userDao.insertUser");
		System.out.println(vo);
		
		int count = sqlSession.selectOne("user.insertUser", vo);
		
		System.out.println(count);
		System.out.println(vo);
	}
}
