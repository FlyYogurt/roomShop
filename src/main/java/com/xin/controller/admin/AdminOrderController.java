package com.xin.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xin.model.Order;
import com.xin.model.OrderItem;
import com.xin.service.order.OrderService;
import com.xin.service.orderitem.OrderItemService;
import com.xin.utils.PageBean;

@Controller
@RequestMapping("/admin/adminOrderController")
public class AdminOrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemService orderItemService;
	
	/**
	 * 查询订单列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request,int page){
		PageBean<Order> pageBean = orderService.findAllSecond(page);
		request.getSession().setAttribute("pageBean", pageBean);
		//List<Order> oList = orderService.findAll();
		//request.setAttribute("oList", oList);
		return "/admin/order/list";
	}
	
	
	/** 根据订单的id查询订单项:
	 * 
	 * @return
	 */@RequestMapping("/findOrderItem")
		public String findOrderItem(HttpServletRequest request,Order order){
			// 根据订单id查询订单项:
			List<OrderItem> list = orderItemService.findOrderItem(order.getOid());
			// 显示到页面:
			
			request.setAttribute("list", list);
			// 页面跳转
			return "/admin/order/orderItem";
		}
	 
	 
	/**
	 *  修改订单状态
	 * @return
	 */
	 @RequestMapping("/updateState")
		public String updateState(Order order,HttpServletRequest request){
			// 根据id查询订单
		 	//String oid = request.getParameter("oid");
		 	Order currOrder = orderService.findByOid(order.getOid());
		 	//Order currOrder = orderService.findByOid(Integer.parseInt(oid));
			currOrder.setState(3);
			orderService.update(currOrder);
			// 页面跳转
			return "redirect:/admin/adminOrderController/list?page=1";
		}


}
