package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.InterestVo;
import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int selectSameId(String id) {
		System.out.println("userDao.selectSameId");
		
		return sqlSession.selectOne("user.selectSameId", id);
	}

	public UserVo insertUser(UserVo vo) {
		System.out.println("userDao.insertUser");
		
		sqlSession.insert("user.insertUser", vo);
	
		return vo;
	}

	public List<String> selectAddress() {
		System.out.println("userDao.주소가져오기");
		
		return sqlSession.selectList("user.selectAddress");
	}

	public List<String> selectCity(String thisProvince) {
		System.out.println("userDao.도시가져오기");
		
		return sqlSession.selectList("user.selectCity", thisProvince);
	}

	public List<String> selectRegion(String thisCity) {
		System.out.println("userDao.동네가져오기");
		
		return sqlSession.selectList("user.selectRegion", thisCity);
	}

	public List<InterestVo> selectInterestAll() {
		System.out.println("userDao.관심분야가져오기");
		
		return sqlSession.selectList("user.selectInterestAll");
	}

	public void updateTrainerInfo(UserVo vo) {
		System.out.println("userDao.트레이너 정보 수정");
		
		sqlSession.update("user.updateTrainerInfo", vo);
	}

	public void insertInterest(Map<String, Integer> interestMap) {
		System.out.println("userDao.전문분야 insert");
		
		sqlSession.insert("user.insertInterest", interestMap);
	}

	public void insertCareer(Map<String, Object> careerMap) {
		System.out.println("userDao.경력 insert");
		System.out.println(careerMap);
		
		sqlSession.insert("user.insertCareer", careerMap);
		
	}
}