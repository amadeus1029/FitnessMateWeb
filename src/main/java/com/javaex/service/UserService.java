package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public int idCheck(String id) {
		System.out.println("userService.idCheck");
		
		return userDao.selectSameId(id);
	}

}
