package com.codingdojo.bookclub.service;

import org.springframework.validation.BindingResult;

import com.codingdojo.bookclub.entity.User;
import com.codingdojo.bookclub.entity.request.LoginUser;

public interface IUserService {
	public abstract User register(User newUser, BindingResult result);
	public abstract User login (LoginUser newLogin, BindingResult result);
}
