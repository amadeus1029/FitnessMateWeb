package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public int idCheck(String id) {
		System.out.println("userService.idCheck");
		
		return userDao.selectSameId(id);
	}
	
	public void signUp(UserVo vo, MultipartFile profileImg) {
		System.out.println("userService.signUp");
		
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
		
		userDao.insertUser(vo);
	}
}
