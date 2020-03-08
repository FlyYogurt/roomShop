package com.xin.dao;

import java.util.List;

import com.xin.model.CategorySecond;
import com.xin.model.Flower;

public interface CategorySecondMapper {
    int deleteByPrimaryKey(Integer csid);

    int insert(CategorySecond record);

    int insertSelective(CategorySecond record);

    CategorySecond selectByPrimaryKey(Integer csid);

    int updateByPrimaryKeySelective(CategorySecond record);

    int updateByPrimaryKey(CategorySecond record);

	List<Flower> findProductByCsid(int csid);

	List<CategorySecond> findAllSecond(int begin, int size);

	int findCount();

	List<CategorySecond> findAll();
}