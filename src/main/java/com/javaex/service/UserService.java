package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public int idCheck(String id) {
		System.out.println("userService.idCheck");
		
		return userDao.selectSameId(id);
	}
	
	public UserVo signUp(UserVo vo) {
		System.out.println("userService.signUp");

		/*
		String saveDir = "C:\\javaStudy\\upload_file";
		String saveName = "";
		
		if(profileImg.getOriginalFilename() != "") {
			// 확장자
			String exName = profileImg.getOriginalFilename().substring(profileImg.getOriginalFilename().lastIndexOf("."));
			
			// 저장 파일 이름
			saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			
			// 파일 경로
			String filePath = saveDir + "\\" + saveName;
			
			// 파일을 서버에 복사
			try {
				byte[] fileData = profileImg.getBytes();
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bout = new BufferedOutputStream(out);
				
				bout.write(fileData);
				bout.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// vo에 저장
		vo.setProfileImg(saveName);
		*/
		
		return userDao.insertUser(vo);
	}

	public List<String> getAddress() {
		System.out.println("userService.주소가져오기");
		
		return userDao.selectAddress();
	}

	public List<String> getCityList(String thisProvince) {
		System.out.println("userService.도시가져오기");
		
		return userDao.selectCity(thisProvince);
	}

	public List<String> getRegionList(String thisCity) {
		System.out.println("userService.동네가져오기");
		
		return userDao.selectRegion(thisCity);
	}

	public List<InterestVo> getInterestList() {
		System.out.println("userService.관심분야가져오기");
		
		return userDao.selectInterestAll();
	}

	public void signUpTrainer(UserVo vo, AddressVo addressVo, List<Integer> fieldList, List<String> careerList) {
		System.out.println("userService.트레이너 회원가입");
		
		String address = addressVo.getProvince()+" "+addressVo.getCity()+" "+addressVo.getRegion();
		vo.setLocation(address);
		
		userDao.updateTrainerInfo(vo);
		
		Map<String, Integer> interestMap = new HashMap<>();
		interestMap.put("userNo", vo.getUserNo());

		for(int fieldNo : fieldList) {
			interestMap.put("fieldNo", fieldNo);
			userDao.insertInterest(interestMap);
		}
		
		Map<String, Object> careerMap = new HashMap<>();
		careerMap.put("userNo", vo.getUserNo());
		
		for(String career : careerList) {
			careerMap.put("career", career);
			userDao.insertInterest(interestMap);
		}
	}
}
