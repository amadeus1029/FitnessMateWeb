package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CareerVo;
import com.javaex.vo.InterestVo;
import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int selectSameId(String id) {
		
		return sqlSession.selectOne("user.selectSameId", id);
	}

	public UserVo insertUser(UserVo vo) {
		
		sqlSession.insert("user.insertUser", vo);
	
		return vo;
	}

	public List<String> selectAddress() {
		
		return sqlSession.selectList("user.selectAddress");
	}

	public List<String> selectCity(String thisProvince) {
		
		return sqlSession.selectList("user.selectCity", thisProvince);
	}

	public List<String> selectRegion(String thisCity) {
		
		return sqlSession.selectList("user.selectRegion", thisCity);
	}

	public List<InterestVo> selectInterestAll() {
		
		return sqlSession.selectList("user.selectInterestAll");
	}

	public void updateTrainerInfo(UserVo vo) {

		
		sqlSession.update("user.updateTrainerInfo", vo);
	}

	public void insertInterest(Map<String, Object> interestMap) {
		
		sqlSession.insert("user.insertInterest", interestMap);
	}

	public void insertCareer(Map<String, Object> careerMap) {

		sqlSession.insert("user.insertCareer", careerMap);
		
	}

	public UserVo selectUser(UserVo userVo) {

		
		return sqlSession.selectOne("user.selectUser", userVo);
	}

	public UserVo selectProfile(int userNo) {

		
		return sqlSession.selectOne("user.selectProfile", userNo);
	}

	public List<String> selectUserInterest(int userNo) {


		return sqlSession.selectList("user.selectUserInterest", userNo);
	}

	public List<CareerVo> selectCareerList(int userNo) {


		return sqlSession.selectList("user.selectCareerList", userNo);
	}

	public void deleteInterest(int userNo) {

		sqlSession.delete("user.deleteInterest", userNo);
	}
	

	public void deleteCareer(int careerNo) {

		sqlSession.delete("user.deleteCareer", careerNo);
	}

	public void updateUserInfo(UserVo vo) {
		
		sqlSession.update("user.updateUserInfo", vo);
	}

	
}
