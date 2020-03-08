package com.xin.dao;

import java.util.List;
import java.util.Map;

import com.xin.model.Order;
import com.xin.model.OrderItem;
import com.xin.model.OrderSet;
public interface OrderMapper {
    int deleteByPrimaryKey(Integer oid);

    int insert(Order order);

    int insertSelective(Order order);

    Order selectByPrimaryKey(Integer oid);

    int updateByPrimaryKeySelective(Order order);

    int updateByPrimaryKey(Order order);

	List<Order> findByUid(Map<String, Object> map);
	
	List<OrderSet> findByOrderid(Integer oid);

	Order findByOid(Integer oid);

	List<Order> findAll();

	List<OrderItem> findOrderItem(Integer oid);

	int findCount(Integer uid);

	
	//后台分页查询
	int adminCount();

	List<Order> findAllSecond(int begin, int size);
}