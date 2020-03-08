package com.xin.dao;

import java.util.List;

import com.xin.model.Category;
import com.xin.model.CategorySecond;
import com.xin.model.Flower;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer cid);

    void insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

	List<Category> findAll();

	List<CategorySecond> findSecondByCid(int cid);

	List<Flower> findFlowerByCid(int cid);

	List<Category> findAll2();
}