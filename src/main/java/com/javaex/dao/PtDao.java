package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PtVo;

@Repository
public class PtDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<PtVo> selectTraineeList(int userNo) {
		System.out.println("dao 트레이니 리스트");
		System.out.println(userNo);
		
		List<PtVo> ptList = sqlSession.selectList("pt.selectTraineeList", userNo);
		
		return ptList;
	}
	
	
	
}
