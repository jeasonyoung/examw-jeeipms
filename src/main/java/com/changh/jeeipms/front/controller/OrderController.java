package com.changh.jeeipms.front.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.IPUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.order.CourseItemEntity;
import com.changh.jeeipms.common.entity.order.CourseOrderEntity;
import com.changh.jeeipms.common.entity.student.ScStudentEntity;
import com.changh.jeeipms.common.entity.student.StudentEntity;
import com.changh.jeeipms.common.model.OrderItem;
import com.changh.jeeipms.common.service.order.CourseOrderServiceI;
import com.changh.jeeipms.common.util.CookieUtils;
import com.changh.jeeipms.common.util.HttpClientUtil;
import com.changh.jeeipms.front.pay.alipay.util.AlipayNotify;

import com.changh.jeeipms.cms.entity.order.SchoolEntity;
import com.changh.jeeipms.cms.entity.order.TradeEntity;

/**
 * @Title: Controller
 * @Description: 订单列表
 * @author failymiss
 * @date 2013-09-29 13:54:00
 * @version V1.0
 * 
 */
@Controller
@RequestMapping("/orderController")
public class OrderController extends BaseController {
	
	@Autowired
	private CourseOrderServiceI courseOrderService;

	/**
	 * 添加订单列表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "order")
	@ResponseBody
	public AjaxJson save(BigDecimal total, String ids,
			HttpServletRequest request, HttpServletResponse response) {
		CourseOrderEntity courseOrder = new CourseOrderEntity();
		/**
		 * 生成订单
		 */
		courseOrder.setTotalPrice(total);
		courseOrder.setOrderAddtime(new Date());
		courseOrder.setStudent(ResourceUtil.getStudent());
		courseOrder.setOrderStatus(0);
		courseOrder.setOrderCode(getOrderCode());
		courseOrder.setOrderCards(new BigDecimal(0));
		courseOrder.setContactName(courseOrder.getStudent().getRealname());
		courseOrder.setTelphone(courseOrder.getStudent().getPhone());
		courseOrder.setOrderCashmoney(new BigDecimal(0));
		// 订单类型（课程订单）
		courseOrder.setOrderType(Globals.ORDER_TYPE_COURSE);
		// 测试CascadeType.ALL
		String[] str = ids.split(",");
		List<CourseItemEntity> list = new ArrayList<CourseItemEntity>();
		for (String s : str) {
			CourseItemEntity item = new CourseItemEntity();
			CourseEntity course = courseOrderService.getEntity(
					CourseEntity.class, s);
			item.setCourse(course);
			item.setCourseName(course.getCoursename());
			item.setItemContent("");
			item.setItemOprice(new BigDecimal(course.getPrice()));
			item.setItemRprice(new BigDecimal(course.getFavorableprice()));
			item.setOrder(courseOrder);
			list.add(item);
		}
		HttpSession session = ContextHolderUtils.getSession();
		// session.setAttribute("item", list);
		session.setAttribute("order", courseOrder);
		// 级联添加
		courseOrder.setItem(list);
		courseOrderService.save(courseOrder);
		// 清空购物车
		CookieUtils.removeCookie(request, response, Globals.COURSE);
		return new AjaxJson();
	}

	/**
	 * 获取订单详细
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "showOrder")
	public ModelAndView getItem(HttpServletRequest request, String orderCode) {
		HttpSession session = ContextHolderUtils.getSession();
		if (StringUtil.isNotEmpty(orderCode)) {
			CourseOrderEntity order = courseOrderService.findUniqueByProperty(
					CourseOrderEntity.class, "orderCode", orderCode);
			request.setAttribute("order", order);
			// request.setAttribute("list", order.getItem());
		} else if (null != session.getAttribute("order")) {

			// List<CourseItemEntity> list = (List<CourseItemEntity>)
			// session.getAttribute("item");
			// request.setAttribute("list", list);
			request.setAttribute("order", session.getAttribute("order"));
		} else {
			return new ModelAndView("redirect:/cartController.do?cartList");
		}
		return new ModelAndView("front/cart/order");
	}

	/**
	 * 删除订单
	 * 
	 * @param orderCode
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "itemList")
	@ResponseBody
	public OrderItem itemList(String orderId, HttpServletRequest request) {
		OrderItem j = new OrderItem();
		if (StringUtil.isNotEmpty(orderId)) {
			List<CourseItemEntity> list = courseOrderService.findByProperty(
					CourseItemEntity.class, "order.id", orderId);
			CourseOrderEntity order = courseOrderService.getEntity(
					CourseOrderEntity.class, orderId);
			System.out.println(list.size());
			j.setState(order.getOrderStatus());
			j.setList(list);
			return j;
		} else {
			j.setSuccess(false);
			return null;
		}

	}

	/**
	 * 合并订单
	 * 
	 * @param orderCode
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "mergeOrder")
	@ResponseBody
	public AjaxJson mergeOrders(String orderCode, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String[] code = orderCode.split(",");
		CourseOrderEntity courseOrder = new CourseOrderEntity();
		Double d = 0.00;
		List<CourseItemEntity> list = new ArrayList<CourseItemEntity>();
		for (String c : code) {
			CourseOrderEntity order = courseOrderService.getEntity(
					CourseOrderEntity.class, c);
			for (CourseItemEntity item : order.getItem()) {
				item.setOrder(courseOrder);
				item.setId(null);
				list.add(item);
			}
			d += order.getTotalPrice().doubleValue();
			courseOrderService.deleteEntityById(CourseOrderEntity.class, c);
		}
		courseOrder.setItem(list);
		courseOrder.setTotalPrice(new BigDecimal(d));
		courseOrder.setOrderAddtime(new Date());
		courseOrder.setStudent(ResourceUtil.getStudent());
		courseOrder.setOrderStatus(0);
		courseOrder.setOrderCode(getOrderCode());
		courseOrder.setOrderCards(new BigDecimal(0));
		courseOrder.setContactName(courseOrder.getStudent().getRealname());
		courseOrder.setTelphone(courseOrder.getStudent().getPhone());
		courseOrder.setOrderCashmoney(new BigDecimal(0));
		courseOrder.setReturnPrice(new BigDecimal(0));
		courseOrderService.save(courseOrder);
		return j;
	}

	/**
	 * 删除订单
	 * 
	 * @param orderCode
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "delete")
	@ResponseBody
	public AjaxJson delete(String orderCode, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String[] code = orderCode.split(",");
		for (String s : code) {
			courseOrderService.deleteEntityById(CourseOrderEntity.class, s);
		}
		return j;
	}

	/**
	 * 修改订单
	 * 
	 * @param id
	 * @param courseid
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "update")
	@ResponseBody
	public AjaxJson update(String id, String courseid,
			HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		CourseOrderEntity order = courseOrderService.getEntity(
				CourseOrderEntity.class, id);
		if (order.getItem().size() == 1) {
			j.setMsg("如需删除全部课程，请直接取消此订单");
			j.setSuccess(false);
		} else if (StringUtil.isNotEmpty(order.getReturnPrice())) {
			j.setMsg("不能修改已使用优惠劵的订单");
			j.setSuccess(false);
		} else {
			CourseItemEntity item = courseOrderService.getEntity(
					CourseItemEntity.class, courseid);
			// 取消关联
			// item.setOrder(null);
			// item.setCourse(null);
			order.getItem().remove(item);
			order.setTotalPrice(order.getTotalPrice().subtract(
					item.getItemRprice()));
			courseOrderService.delete(item);
			courseOrderService.updateEntitie(order);
		}
		return j;
	}

	/**
	 * 依据原始文件名生成新文件名
	 * 
	 * @return
	 */
	private String getOrderCode() {
		Random random = new Random();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(new Date());
		return dateString + random.nextInt(10000); // 日期加10000的随机
	}

	/**
	 * 支付订单
	 * 
	 * @param orderId
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "payorder")
	@ResponseBody
	public AjaxJson payorder(String orderId, HttpServletRequest req) {
		AjaxJson j = new AjaxJson();
		CourseOrderEntity order = courseOrderService.getEntity(
				CourseOrderEntity.class, orderId);
		HttpSession session = ContextHolderUtils.getSession();
		StudentEntity stu = order.getStudent();
		String stuId = stu.getId();
		
		double ordermoney = (order.getTotalPrice().add(order.getReturnPrice() == null ? new BigDecimal(0).negate() : order.getReturnPrice().negate())).doubleValue()
						;
		BigDecimal cash = null == stu.getCash() ? new BigDecimal(0) : stu.getCash();
		BigDecimal studyCard = null == stu.getStudycard() ? new BigDecimal(0) : stu.getStudycard();
		BigDecimal stumoney = cash.add(studyCard);
		// 支付失败
		if (ordermoney > stumoney.doubleValue()) {
			j.setMsg("余额不足");
			j.setSuccess(false);
			return j;
			// 支付成功
		} else {
			// 注册到课程相应的网校，如果课程时在该网校该网校学习
			// 获取订单下面的全部课程
			List<CourseItemEntity> itemList = order.getItem();
			boolean issuc = true;
			for (CourseItemEntity it : itemList) {
				// 如果课程的来着的网校不为空，这需要去该网校注册
				if (StringUtil.isNotEmpty(it.getCourse().getSchool())) {
					issuc = false;
					SchoolEntity sc = it.getCourse().getSchool();
					HttpClientUtil client = new HttpClientUtil(
							sc.getScInterface());
					Map<String, String> map = new HashMap<String, String>();
					/** 传递的信息开始 */
					Object[] p = { stuId, sc.getId() };
					List<ScStudentEntity> Lscs = courseOrderService
							.findHql(
									"from ScStudentEntity scs where scs.stuId =? and scs.schId=?",
									p);
					if (StringUtil.isNotEmpty(Lscs) && Lscs.size() != 0) {
						ScStudentEntity scentity = Lscs.get(0);
						map.put("stuName", scentity.getUsername());
						map.put("stuPswd", "");
					} else {
						// 学员信息
						map.put("stuName", stu.getUsername());
						map.put("stuPswd", stu.getSpassword());
						map.put("phone",
								null == stu.getPhone() ? "暂无" : stu.getPhone());
						map.put("realname", null == stu.getRealname() ? "暂无"
								: stu.getRealname());
						map.put("email", stu.getEmail());
					}
					// 密钥
					map.put("key", sc.getScKey());
					map.put("username", sc.getUsername());
					// 课程信息信息
					map.put("courseId", it.getCourse().getCourseid());
					/** 传递的信息结束 */

					JSONObject jsonObject = JSONObject.fromObject(map);
					// 发送并返回信息
					String str = client.post(jsonObject.toString());
					JSONObject rJson = JSONObject.fromObject(str);
					issuc = rJson.getBoolean("success");
					System.out.println(rJson.getString("msg"));
					/** 处理返回信息 */
					if (!StringUtil.isNotEmpty(Lscs) || Lscs.size() == 0) {
						ScStudentEntity scs = new ScStudentEntity();
						scs.setPassword(rJson.getString("password"));
						scs.setUsername(rJson.getString("username"));
						scs.setStuId(stuId);
						scs.setSchId(sc.getId());
						courseOrderService.save(scs);
					} // 密钥和机构url
				}
			}
			BigDecimal orderMoneyBd = new BigDecimal(ordermoney);
			// System.out.println(issuc);
			if (ordermoney <= studyCard.doubleValue() && issuc) {
				saveTrade(stu, ordermoney, Globals.TRADECARD, cash, studyCard.add(orderMoneyBd.negate()), req);
				stu.setStudycard(studyCard.add(orderMoneyBd.negate()));
				order.setOrderCashmoney(new BigDecimal(0));
				order.setOrderCards(orderMoneyBd);
				order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
				order.setOrderPaytime(new Date());
				courseOrderService.saveOrUpdate(order);
				courseOrderService.saveOrUpdate(stu);
				session.setAttribute("student", stu);
			} else if (ordermoney > studyCard.doubleValue() && issuc) {
				saveTrade(stu, ordermoney, Globals.TRADECARD, cash, new BigDecimal(0), req);
				saveTrade(stu, ordermoney, Globals.TRADECARD, stumoney
						.add(orderMoneyBd.negate()), new BigDecimal(0), req);
				stu.setStudycard(new BigDecimal(0));
				stu.setCash(stumoney.add(orderMoneyBd.negate()));
				order.setOrderCashmoney(stumoney.add(orderMoneyBd.negate()));
				order.setOrderPaytime(new Date());
				order.setOrderCards(studyCard);
				order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
				courseOrderService.saveOrUpdate(order);
				session.setAttribute("student", stu);
				courseOrderService.saveOrUpdate(stu);
			} else {
				j.setSuccess(false);
				j.setMsg("支付失败");
			}
			j.setMsg(ordermoney + "");
			// 清空session里面的订单详细
			session.removeAttribute("order");

			return j;
		}
	}

	@RequestMapping(params = "chinaBank")
	public ModelAndView receiveChinabank(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		String key = Globals.getConfig("chinabank");
		String v_oid = request.getParameter("v_oid"); // 订单号
		String v_pmode = request.getParameter("v_pmode"); // 支付方式中文说明，如"中行长城信用卡"
		String v_pstatus = request.getParameter("v_pstatus"); // 支付结果，20支付完成；30支付失败；
		String v_pstring = request.getParameter("v_pstring"); // 对支付结果的说明，成功时（v_pstatus=20）为"支付成功"，支付失败时（v_pstatus=30）为"支付失败"
		String v_amount = request.getParameter("v_amount"); // 订单实际支付金额
		String v_moneytype = request.getParameter("v_moneytype"); // 币种
		String v_md5str = request.getParameter("v_md5str"); // MD5校验码
		String remark1 = request.getParameter("remark1"); // 备注1
		String remark2 = request.getParameter("remark2"); // 备注2
		String text = v_oid + v_pstatus + v_amount + v_moneytype + key;
		//MD5 md5 = new MD5();
		
		String v_md5text = DigestUtils.md5Hex(text).toUpperCase();
		//md5.getMD5ofStr(text).toUpperCase();

		if (v_md5str.equals(v_md5text)) {
			if ("30".equals(v_pstatus)) {
				j.setMsg("支付失败");
				j.setSuccess(false);
			} else if ("20".equals(v_pstatus)) {
				CourseOrderEntity order = courseOrderService
						.findUniqueByProperty(CourseOrderEntity.class,
								"orderCode", v_oid);
				StudentEntity stu = order.getStudent();
				if(order.getOrderType().equals(Globals.ORDER_TYPE_COURSE))
				{
				order.setOrderCashmoney(new BigDecimal(Double.valueOf(v_amount)));
				order.setOrderContent(v_pmode);
				order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
				order.setOrderPaytime(new Date());
				courseOrderService.saveOrUpdate(order);
				j.setMsg("支付成功");

				List<CourseItemEntity> itemList = order.getItem();
				for (CourseItemEntity it : itemList) {
					// 如果课程的来着的网校不为空，这需要去该网校注册
					if (StringUtil.isNotEmpty(it.getCourse().getSchool())) {
						SchoolEntity sc = it.getCourse().getSchool();
						HttpClientUtil client = new HttpClientUtil(
								sc.getScInterface());
						Map<String, String> map = new HashMap<String, String>();
						/** 传递的信息开始 */
						// 学员信息
						map.put("stuName", stu.getUsername());
						map.put("stuPswd", stu.getSpassword());
						map.put("phone", stu.getPhone());
						map.put("realname", stu.getRealname());
						map.put("email", stu.getEmail());
						// 密钥
						map.put("key", sc.getScKey());
						map.put("username", sc.getUsername());
						// 课程信息信息
						map.put("courseId", it.getCourse().getCourseid());
						/** 传递的信息结束 */

						JSONObject jsonObject = JSONObject.fromObject(map);
						String str = client.post(jsonObject.toString());
						// 密钥和机构url
					}
				}
				}else if(order.getOrderType().equals(Globals.ORDER_TYPE_CHARGE)){
					BigDecimal money = new BigDecimal(Double.valueOf(v_amount));
					order.setOrderCashmoney(money);
					order.setOrderContent(stu.getUsername() + "通过网银充值" + money.setScale(2, BigDecimal.ROUND_HALF_UP));
					order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
					order.setOrderPaytime(new Date());
					order.setOrderPayment("网银充值");
					courseOrderService.saveOrUpdate(order);
					stu.setCash(stu.getCash()==null?money:stu.getCash().add(money));
					// 充入学员的账户
					//String sql = "update f_student_account set cash = "+money.toString()+" where id = "+stu.getId();
					//courseOrderService.executeSql(sql, new Object[]{});
					courseOrderService.saveOrUpdate(stu);
					HttpSession session = ContextHolderUtils.getSession();
					System.out.println(session.getAttribute("student"));
					session.setAttribute("student", stu);
				}
			}
		} else {
			j.setMsg(text);
			j.setSuccess(false);
		}
		return new ModelAndView("redirect:/orderController.do?showOrder");
	}
	
	@RequestMapping(params = "chinaBankAuto")
	public void autoReceiveChinabank(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		String key = Globals.getConfig("chinabank"); //2dsfa9023Dfsd00vmba562
		String v_oid = request.getParameter("v_oid"); // 订单号
		String v_pmode = request.getParameter("v_pmode"); // 支付方式中文说明，如"中行长城信用卡"
		String v_pstatus = request.getParameter("v_pstatus"); // 支付结果，20支付完成；30支付失败；
		String v_pstring = request.getParameter("v_pstring"); // 对支付结果的说明，成功时（v_pstatus=20）为"支付成功"，支付失败时（v_pstatus=30）为"支付失败"
		String v_amount = request.getParameter("v_amount"); // 订单实际支付金额
		String v_moneytype = request.getParameter("v_moneytype"); // 币种
		String v_md5str = request.getParameter("v_md5str"); // MD5校验码
		String remark1 = request.getParameter("remark1"); // 备注1
		String remark2 = request.getParameter("remark2"); // 备注2
		String text = v_oid + v_pstatus + v_amount + v_moneytype + key;
		//MD5 md5 = new MD5();
		String v_md5text = DigestUtils.md5Hex(text).toUpperCase(); 
				//md5.getMD5ofStr(text).toUpperCase();
		String flag = "ok";
		if (v_md5str.equals(v_md5text)) {
			if ("30".equals(v_pstatus)) {
				j.setMsg("支付失败");
				j.setSuccess(false);
			} else if ("20".equals(v_pstatus)) {
				CourseOrderEntity order = courseOrderService
						.findUniqueByProperty(CourseOrderEntity.class,
								"orderCode", v_oid);
				StudentEntity stu = order.getStudent();
				if(order.getOrderType().equals(Globals.ORDER_TYPE_COURSE))
				{
				order.setOrderCashmoney(new BigDecimal(Double.valueOf(v_amount)));
				order.setOrderContent(v_pmode);
				order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
				order.setOrderPaytime(new Date());
				courseOrderService.saveOrUpdate(order);
				j.setMsg("支付成功");

				List<CourseItemEntity> itemList = order.getItem();
				for (CourseItemEntity it : itemList) {
					// 如果课程的来着的网校不为空，这需要去该网校注册
					if (StringUtil.isNotEmpty(it.getCourse().getSchool())) {
						SchoolEntity sc = it.getCourse().getSchool();
						HttpClientUtil client = new HttpClientUtil(
								sc.getScInterface());
						Map<String, String> map = new HashMap<String, String>();
						/** 传递的信息开始 */
						// 学员信息
						map.put("stuName", stu.getUsername());
						map.put("stuPswd", stu.getSpassword());
						map.put("phone", stu.getPhone());
						map.put("realname", stu.getRealname());
						map.put("email", stu.getEmail());
						// 密钥
						map.put("key", sc.getScKey());
						map.put("username", sc.getUsername());
						// 课程信息信息
						map.put("courseId", it.getCourse().getCourseid());
						/** 传递的信息结束 */

						JSONObject jsonObject = JSONObject.fromObject(map);
						String str = client.post(jsonObject.toString());
						// 密钥和机构url
					}
				}
				}else if(order.getOrderType().equals(Globals.ORDER_TYPE_CHARGE)){
					BigDecimal money = new BigDecimal(Double.valueOf(v_amount));
					order.setOrderCashmoney(money);
					order.setOrderContent(stu.getUsername() + "通过网银充值" + money.setScale(2, BigDecimal.ROUND_HALF_UP));
					order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
					order.setOrderPaytime(new Date());
					order.setOrderPayment("网银充值");
					courseOrderService.saveOrUpdate(order);
					stu.setCash(stu.getCash()==null?money:stu.getCash().add(money));
					// 充入学员的账户
					//String sql = "update f_student_account set cash = "+money.toString()+" where id = "+stu.getId();
					//courseOrderService.executeSql(sql, new Object[]{});
					courseOrderService.saveOrUpdate(stu);
					HttpSession session = ContextHolderUtils.getSession();
					System.out.println(session.getAttribute("student"));
					session.setAttribute("student", stu);
				}
			}
		} else {
			j.setMsg(text);
			j.setSuccess(false);
			flag = "error";
		}
		PrintWriter writer = null;
		try{
			writer =  response.getWriter();
			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=UTF-8");
			writer.write(flag);
			writer.flush();
		}catch(Exception e){}
		finally {  
			if (writer != null) {  
				writer.close();  
			}  
		}  
	}
	public void saveTrade(StudentEntity stu, double outlay, int tradeCurrency,
			BigDecimal cashBalance, BigDecimal cardBalance, HttpServletRequest req) {
		TradeEntity trade = new TradeEntity();
		trade.setTradeTime(new Date());
		trade.setTradeIp(IPUtil.getIpAddr(req));
		trade.setTradeContent("购买课程==>学员在线支付");
		trade.setCardBalance(cardBalance);
		trade.setCashBalance(cashBalance);
		trade.setOutlay(new BigDecimal(outlay));
		trade.setStudent(stu);
		trade.setTradeCurrency(tradeCurrency);
		courseOrderService.save(trade);
	}

	/**
	 * 支付宝支付
	 * 
	 * @param orderId
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "zhifubaoPre")
	public ModelAndView zhifubaoPre(String orderId, HttpServletRequest req) {
		CourseOrderEntity order = courseOrderService.get(
				CourseOrderEntity.class, orderId);
		if (order != null
				&& order.getOrderStatus().equals(Globals.ORDER_NO_PAY)) {
			StudentEntity stu = order.getStudent();
			String subject = stu.getUsername() + "共购买了 "
					+ order.getItem().size() + "个课程";
			;// 订单名称
			req.setAttribute("orderNo", order.getOrderCode()); // 订单号
			req.setAttribute("subject", subject); // 订单名称
			req.setAttribute("body", getBody(order.getItem())); // 备注内容
			req.setAttribute("tradeMoney", (order.getTotalPrice().add(order
					.getReturnPrice() == null ? new BigDecimal(0) : order
					.getReturnPrice().negate())).toString()); // 交易金额
			req.setAttribute("payment", "ZFB"); // 交易方式
		}
		return new ModelAndView("pay/alipay/alipayto");
	}

	private String getBody(List<CourseItemEntity> list) {
		StringBuffer buf = new StringBuffer();
		for (CourseItemEntity i : list) {
			buf.append(i.getCourseName());
			buf.append(";");
		}
		return buf.substring(0, buf.length() - 1);
	}

	/**
	 * 支付宝同步过来的地址处理方法
	 * 
	 * @param orderId
	 * @param req
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "alipayReturn")
	// 使用value，访问路径 /orderController/alipayReturn.do
	public ModelAndView alipayReturn(String orderId, HttpServletRequest req)
			throws UnsupportedEncodingException {
		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = req.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
			params.put(name, valueStr);
		}

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//

		String trade_no = req.getParameter("trade_no"); // 支付宝交易号
		String out_trade_no = req.getParameter("out_trade_no"); // 获取订单号
		String total_fee = req.getParameter("total_fee"); // 获取总金额
		String subject = new String(req.getParameter("subject").getBytes(
				"ISO-8859-1"), "utf-8");// 商品名称、订单名称
		String body = "";
		if (req.getParameter("body") != null) {
			body = new String(req.getParameter("body").getBytes("ISO-8859-1"),
					"utf-8");// 商品描述、订单备注、描述
		}
		String buyer_email = req.getParameter("buyer_email"); // 买家支付宝账号
		String trade_status = req.getParameter("trade_status"); // 交易状态
		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		// 计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		if (verify_result) {// 验证成功
			// ////////////////////////////////////////////////////////////////////////////////////////
			// 请在这里加上商户的业务逻辑程序代码
			// ——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			if (trade_status.equals("TRADE_FINISHED")
					|| trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理（可参考“集成教程”中“3.4返回数据处理”）
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序
				// 处理订单
				alipay(out_trade_no, total_fee, body);
				return new ModelAndView("pay/alipay/success");
			} else {
				return new ModelAndView("pay/alipay/fail");
			}
			// 该页面可做页面美工编辑
			// out.println("验证成功<br />");
			// out.println("trade_no=" + trade_no);

			// ——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			// ////////////////////////////////////////////////////////////////////////////////////////
		} else {
			// 该页面可做页面美工编辑
			// out.println("验证失败");
			return new ModelAndView("pay/alipay/fail");
		}
	}

	/**
	 * 支付宝异步过来的
	 * 
	 * @param orderId
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "alipayNotify")
	// 使用value，访问路径 /orderController/alipayReturn.do
	public ModelAndView alipayNotify(String orderId, HttpServletRequest req) {
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = req.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
			params.put(name, valueStr);
		}
		String trade_no = req.getParameter("trade_no"); // 支付宝交易号
		String order_no = req.getParameter("out_trade_no"); // 获取订单号
		String total_fee = req.getParameter("total_fee"); // 获取总金额
		String subject = req.getParameter("subject");
		String body = "";
		if (req.getParameter("body") != null) {
			body = req.getParameter("body");
		}
		String buyer_email = req.getParameter("buyer_email"); // 买家支付宝账号
		String trade_status = req.getParameter("trade_status"); // 交易状态
		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		if (AlipayNotify.verify(params)) {// 验证成功
			if (trade_status.equals("TRADE_FINISHED")
					|| trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理（可参考“集成教程”中“3.4返回数据处理”）
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序
				alipay(order_no, total_fee, body);
				// out.println("success"); //请不要修改或删除
			} else {

			}

			// ——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			// out.println("success"); //请不要修改或删除
			return new ModelAndView("pay/alipay/success"); // 必须返回success
			// ////////////////////////////////////////////////////////////////////////////////////////
		} else {// 验证失败
			return new ModelAndView("pay/alipay/fail");
		}
	}

	private void alipay(String out_trade_no, String total_fee, String body) {
		CourseOrderEntity order = courseOrderService.findUniqueByProperty(
				CourseOrderEntity.class, "orderCode", out_trade_no);
		StudentEntity stu = order.getStudent();
		BigDecimal money = new BigDecimal(Double.valueOf(total_fee));
//		if (order.getOrderType() == null)
//			order.setOrderType(Globals.ORDER_TYPE_COURSE);// 默认
		if (order.getOrderType().equals(Globals.ORDER_TYPE_COURSE)) {
			order.setOrderCashmoney(money);
			order.setOrderContent(body);
			order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
			order.setOrderPaytime(new Date());
			order.setOrderPayment("支付宝支付");
			courseOrderService.saveOrUpdate(order);
			List<CourseItemEntity> itemList = order.getItem();
			for (CourseItemEntity it : itemList) {
				// 如果课程的来着的网校不为空，这需要去该网校注册
				if (StringUtil.isNotEmpty(it.getCourse().getSchool())) {
					SchoolEntity sc = it.getCourse().getSchool();
					HttpClientUtil client = new HttpClientUtil(
							sc.getScInterface());
					Map<String, String> map = new HashMap<String, String>();
					/** 传递的信息开始 */
					// 学员信息
					map.put("stuName", stu.getUsername());
					map.put("stuPswd", stu.getSpassword());
					map.put("phone", stu.getPhone());
					map.put("realname", stu.getRealname());
					map.put("email", stu.getEmail());
					// 密钥
					map.put("key", sc.getScKey());
					map.put("username", sc.getUsername());
					// 课程信息信息
					map.put("courseId", it.getCourse().getCourseid());
					/** 传递的信息结束 */

					JSONObject jsonObject = JSONObject.fromObject(map);
					String str = client.post(jsonObject.toString());
					// 密钥和机构url
				}
			}
		} else if (order.getOrderType().equals(Globals.ORDER_TYPE_CHARGE)) // 充值
		{
			order.setOrderCashmoney(money);
			order.setOrderContent(stu.getUsername() + "通过支付宝充值" + money.setScale(2, BigDecimal.ROUND_HALF_UP));
			order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
			order.setOrderPaytime(new Date());
			order.setOrderPayment("支付宝充值");
			courseOrderService.saveOrUpdate(order);
			stu.setCash(stu.getCash()==null?money:stu.getCash().add(money));
			// 充入学员的账户
			//String sql = "update f_student_account set cash = "+money.toString()+" where id = "+stu.getId();
			//courseOrderService.executeSql(sql, new Object[]{});
			courseOrderService.saveOrUpdate(stu);
			HttpSession session = ContextHolderUtils.getSession();
			System.out.println(session.getAttribute("student"));
			session.setAttribute("student", stu);
		}
	}

	@RequestMapping(params = "cashRecharge")
	public ModelAndView cashRecharge(String money, String type,
			HttpServletRequest req) {
		try {
			double cash = Double.parseDouble(money);
			StudentEntity stu = ResourceUtil.getStudent();
			CourseOrderEntity courseOrder = null;
			if (cash > 0) {
				courseOrder = new CourseOrderEntity();
				/**
				 * 生成订单
				 */
				courseOrder.setTotalPrice(new BigDecimal(cash));
				courseOrder.setOrderAddtime(new Date());
				courseOrder.setStudent(stu);
				courseOrder.setOrderStatus(Globals.ORDER_NO_PAY);
				courseOrder.setOrderCode(getOrderCode());
				courseOrder.setOrderCards(new BigDecimal(0));
				courseOrder.setContactName(courseOrder.getStudent()
						.getRealname());
				courseOrder.setTelphone(courseOrder.getStudent().getPhone());
				courseOrder.setOrderCashmoney(new BigDecimal(0));
				// 订单类型（充值订单）
				courseOrder.setOrderType(Globals.ORDER_TYPE_CHARGE);
				courseOrderService.save(courseOrder); // 订单入库
			}
			if (type != null) {
				if ("wy".equals(type)) {
					if (courseOrder != null) {
						String subject = stu.getUsername() + "通过网银充值";
						req.setAttribute("orderNo", courseOrder.getOrderCode()); // 订单号
						req.setAttribute("remark1", subject); // 订单名称
						req.setAttribute("remark2", subject + money + "元"); // 备注内容
						req.setAttribute("email", stu.getEmail());
						req.setAttribute("v_amount", money); // 交易金额
					}
					return new ModelAndView("pay/chinabank/Send2");
				} else if ("zfb".equals(type)) {
					// 转发至支付宝
					if (courseOrder != null) {
						String subject = stu.getUsername() + "通过支付宝充值";
						;// 订单名称
						req.setAttribute("orderNo", courseOrder.getOrderCode()); // 订单号
						req.setAttribute("subject", subject); // 订单名称
						req.setAttribute("body", subject + money + "元"); // 备注内容
						req.setAttribute("tradeMoney", money); // 交易金额
						req.setAttribute("payment", "ZFB"); // 交易方式
					}
					return new ModelAndView("pay/alipay/alipayto");
				}
			}
			return new ModelAndView("pay/alipay/fail");
		} catch (Exception e) {
			return new ModelAndView("pay/alipay/fail");
		}
	}
}
