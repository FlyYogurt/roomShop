package com.xin.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xin.model.Cart;
import com.xin.model.CartItem;
import com.xin.model.Order;
import com.xin.model.OrderItem;
import com.xin.model.OrderSet;
import com.xin.model.User;
import com.xin.service.order.OrderService;
import com.xin.service.orderitem.OrderItemService;
import com.xin.utils.PageBean;
import com.xin.utils.PaymentUtil;

@Controller
@RequestMapping("/orderController")
public class OrderController {
	
	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private OrderItemService orderItemService;
	
	/**
	 * 提交订单
	 * @param request
	  * @return
	 */
	@RequestMapping("/saveOrder")
	private String saveOrder(Order order,HttpServletRequest request){	
		         
		//1.判断购物车是否为空
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart==null){
			request.setAttribute("msg", "亲!您还没有购物!购物车为空");
			return "msg";
		}
		//随机数生成1-10000
		Random random = new Random(System.currentTimeMillis());
		int iRandom = random.nextInt(10000)+1;
		order.setOid(iRandom);
		order.setTotal(cart.getTotal());
		order.setState(1);
		order.setOrdertime(new Date());
		//2.设置订单关联用户		
		User existUser = (User) request.getSession().getAttribute("existUser");
		if(existUser==null){
			request.setAttribute("msg", "亲!您还没有登录");
			return "msg";
		}
		order.setUid(existUser.getUid());
		order.setUser(existUser);
		//3.设置订单项集合		
		for(CartItem cartItem : cart.getCartItems()){
			//订单项的信息是从购物车中获得的
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setOrder(order);
			
			order.getOrderItems().add(orderItem);
		}
		
		//4.执行数据库的插入操作
		orderService.save(order);
		
		for(CartItem cartItem : cart.getCartItems()){
			//订单项的信息是从购物车中获得的
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());			
			//插入数据到orderItem中
			orderItem.setOid(order.getOid());
			orderItem.setPid(cartItem.getProduct().getPid());
			orderItemService.insert(orderItem);
			
		}			
		//5. 清空购物车:
		cart.clearCart();		
		//6.页面需要回显到页面
		request.setAttribute("order", order);
		System.out.println("**************************");
		System.out.println(order.getOid());
		System.out.println(order.getTotal());
		System.out.println(order.getState());
		System.out.println("**************************");
		return "order";
	}
	
		
		
		/**
		 * 为订单付款:
		 * @param order
		 * @return
		 * @throws IOException
		 */
		@RequestMapping("/payOrder")
		public String payOrder(Order order,HttpServletRequest request,HttpServletResponse response) throws IOException {
			// 1.修改数据:
			Order currOrder = orderService.findByOid(order.getOid());
			currOrder.setAddr(order.getAddr());
			currOrder.setName(order.getName());
			currOrder.setPhone(order.getPhone());
			// 修改订单
			orderService.update(currOrder);
			
			// 重定向
			//response.sendRedirect("http://localhost/FlowerShop/orderController/callBack.action");
			return "redirect:/orderController/callBack.action?oid="+order.getOid();
		}
		
		
		/**
		 *  付款成功后跳转回来的路径:
		 * @return
		 */
		@RequestMapping("/callBack")
		public String callBack(Order order,HttpServletRequest request){
			// 修改订单的状态:
			
			//String r6_Order = request.getParameter("r6_Order");
			//String r3_Amt = request.getParameter("r3_Amt");
			String oid = request.getParameter("oid");
			Order currOrder = orderService.findByOid(Integer.parseInt(oid));
			System.out.println(currOrder.toString());
			// 修改订单状态为2:已经付款:
			currOrder.setState(2);
			orderService.update(currOrder);
			request.setAttribute("msg", "支付成功!");
			return "redirect:/orderController/findByUid.action?page=1";
		}
		
		
		// 根据订单id查询订单:
		@RequestMapping("/findByOid")
		public String findByOid(Order order,HttpServletRequest request,Model model) {
			//1.设置订单关联用户		
			User existUser = (User) request.getSession().getAttribute("existUser");
			if(existUser==null){
				request.setAttribute("msg", "亲!您还没有登录");
				return "msg";
			}
			order.setUid(existUser.getUid());
			order.setUser(existUser);
			
			List<OrderSet> orderList = orderService.findByOrderid(order.getOid());
			//2.根据订单项去查询该订单对应的商品信息
			model.addAttribute("orderList", orderList);
			
			return "order2";
		}

		
		/**
		 * 查询我的订单:
		 * @param request
		 * @return
		 */
		@RequestMapping("/findByUid")
		public String findByUid(HttpServletRequest request,int page) {
			// 从session中获取登陆的用户
			User existUser = (User) request.getSession().getAttribute("existUser");
			// 获得登陆用户的id
			Integer uid = existUser.getUid();
			if(uid==null){
				request.setAttribute("msg", "亲!请您重新登录");
				return "msg";
			}
			// 根据登陆用户的id分页查询订单:		
			PageBean<Order> pagebean = orderService.findByUid(uid,page);			
			request.setAttribute("pagebean", pagebean);
			return "orderList";
		}
		
		
		/**
		 *  后台管理员修改订单的状态:   --》确认收货
		 * @return
		 */
		@RequestMapping("/updateState")
		public String updateState(Order order){
			Order currOrder = orderService.findByOid(order.getOid());
			currOrder.setState(4);
			orderService.update(currOrder);
			return "redirect:/orderController/findByUid?page=1";
		}
}
