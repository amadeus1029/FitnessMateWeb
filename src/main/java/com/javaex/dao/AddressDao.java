package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.AddressVo;

@Repository
public class AddressDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<AddressVo> addList() {
		System.out.println("AddressDao:address list");
		
		return sqlSession.selectList("search.address");
	}

}
