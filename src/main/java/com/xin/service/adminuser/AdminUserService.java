package com.xin.service.adminuser;

import java.util.List;

import com.xin.model.AdminUser;
import com.xin.utils.PageBean;

public interface AdminUserService {

	AdminUser adminLogin(AdminUser adminUser);

	void add(AdminUser adminUser);

	void delete(int uid);

	void edit(AdminUser adminUser);

	List<AdminUser> findAll();

	AdminUser findByUid(int uid);

	PageBean<AdminUser> pageAdminUser(int page);

}
