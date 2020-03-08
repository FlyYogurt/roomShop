package com.xin.service.categorysecond;



import java.util.List;

import com.xin.model.CategorySecond;
import com.xin.model.Flower;
import com.xin.utils.PageBean;

public interface CategorySecondService {

	

	PageBean<CategorySecond> findAllSecond(int page);

	void add(CategorySecond categorySecond);

	void delete(int csid);

	CategorySecond findByCsid(int csid);

	void edit(CategorySecond categorySecond);

	List<CategorySecond> findAllSecond();

	PageBean<Flower> findFlowerByCsName(String csname,int page);
}
