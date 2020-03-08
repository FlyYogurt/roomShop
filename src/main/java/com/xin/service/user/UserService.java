package com.xin.service.user;

import java.util.List;

import com.xin.model.User;
import com.xin.utils.PageBean;

public interface UserService {

	User login(User user);

	void regist(User user);

	void add(User user);

	void delete(int uid);

	User findByUid(int uid);

	void edit(User user);

	List<User> findAll();

	PageBean<User> pageAdminUser(int page);

	User findByUsername(String username);//根据用户名查询用户

	

}
