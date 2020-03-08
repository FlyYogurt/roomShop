package com.xin.service.order;

import java.util.List;

import com.xin.model.Order;
import com.xin.model.OrderItem;
import com.xin.model.OrderSet;
import com.xin.utils.PageBean;

public interface OrderService {

	void save(Order order);

	PageBean<Order> findByUid(Integer uid,Integer page);
	
	List<OrderSet> findByOrderid(Integer oid);

	Order findByOid(Integer oid);

	void update(Order currOrder);

	List<Order> findAll();

	List<OrderItem> findOrderItem(Integer oid);

	PageBean<Order> findAllSecond(int page);

}
