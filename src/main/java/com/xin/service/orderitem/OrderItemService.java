package com.xin.service.orderitem;

import java.util.List;

import com.xin.model.OrderItem;

public interface OrderItemService {

	List<OrderItem> findOrderItem(Integer oid);

	void insert(OrderItem orderItem);

}
