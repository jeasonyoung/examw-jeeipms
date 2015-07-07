package com.changh.jeeipms.cms.controller.order;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.common.SessionInfo;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.IPUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.entity.order.ItemEntity;
import com.changh.jeeipms.cms.entity.order.OrderEntity;
import com.changh.jeeipms.cms.entity.order.TradeEntity;
import com.changh.jeeipms.cms.page.order.OrderPage;
import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.order.OrderServiceI;
import com.changh.jeeipms.common.entity.student.StudentEntity;
/**   
 * @Title: Controller
 * @Description: 订单主数据
 * @author failymiss
 * @date 2013-10-30 15:38:54
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysorderController")
public class SysOrderController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SysOrderController.class);

	@Autowired
	private OrderServiceI orderService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 订单主数据列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "sysorder")
	public ModelAndView order(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/cms/order/orderList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(OrderEntity order,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("orderAddtime");
		}
		CriteriaQuery cq = new CriteriaQuery(OrderEntity.class, dataGrid);
		//查询条件组装器
		String name = oConvertUtils.getString(request.getParameter("student_username"));
		if (!StringUtil.isEmpty(name)) {
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("student");
			//dcDepart.add(Restrictions.like("departname", "%" + departname + "%"));// 部门名
			dcpr.add(Restrictions.like("username", "%" +name+ "%"));// 部门ID
		}
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, order);
		String ctBegin = request.getParameter("orderAddtime_begin");
		String ctEnd = request.getParameter("orderAddtime_end");
		if(StringUtil.isNotEmpty(ctBegin)&& StringUtil.isNotEmpty(ctEnd)){
			try {
				cq.ge("orderAddtime", new SimpleDateFormat("yyyy-MM-dd").parse(ctBegin));
				cq.le("orderAddtime", new SimpleDateFormat("yyyy-MM-dd").parse(ctEnd));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cq.add();
		}
		this.orderService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除订单主数据
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(OrderEntity order, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		order = systemService.getEntity(OrderEntity.class, order.getId());
		message = "删除成功";
		orderService.delete(order);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}
	/**
	 * 添加订单主数据
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(OrderEntity order,OrderPage orderPage, HttpServletRequest request) {
		List<ItemEntity> itemList =  orderPage.getItemList();
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(order.getId())) {
			message = "更新成功";
			orderService.updateMain(order, itemList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} else {
			message = "添加成功";
			orderService.addMain(order, itemList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
	
	@RequestMapping(params = "update")
	@ResponseBody
	public AjaxJson update(OrderEntity order, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(order.getId())) {
			OrderEntity order1 = orderService.getEntity(OrderEntity.class, order.getId());
			HttpSession session = ContextHolderUtils.getSession();
			SessionInfo sessioninfo = (SessionInfo) session.getAttribute(Globals.USER_SESSION);
			order1.setReturnPrice(order.getReturnPrice());
			order1.setModifierName(sessioninfo.getUser().getUserName());
			orderService.saveOrUpdate(order1);
			message = "修改成功";
		} else {
			j.setSuccess(false);
			message = "修改失败";
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 订单主数据列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(OrderEntity order, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(order.getId())) {
			order = orderService.getEntity(OrderEntity.class, order.getId());
			req.setAttribute("orderPage", order);
		}
		return new ModelAndView("com/changh/jeeipms/cms/order/order");
	}
	
	/**
	 * 开通订单
	 * 
	 * @return
	 */
	@RequestMapping(params = "openOrder")
	@ResponseBody
	public AjaxJson openOrder(String orderId, HttpServletRequest req) {
		AjaxJson j = new AjaxJson();
		OrderEntity	order = orderService.getEntity(OrderEntity.class, orderId);
		StudentEntity stu = order.getStudent();
		double ordermoney = (order.getTotalPrice().add(order.getReturnPrice() == null ? new BigDecimal(0).negate() : order.getReturnPrice().negate())).doubleValue()
				;
		BigDecimal cash = null == stu.getCash() ? new BigDecimal(0) : stu.getCash();
		BigDecimal studyCard = null == stu.getStudycard() ? new BigDecimal(0) : stu.getStudycard();
		BigDecimal stumoney = cash.add(studyCard);
		//
		BigDecimal orderMoneyBd = new BigDecimal(ordermoney);
		//
		if(ordermoney>stumoney.doubleValue()){
			j.setMsg("余额不足");
			j.setSuccess(false);
			return j;
		}else{
			if(ordermoney<=studyCard.doubleValue()){
				saveTrade(stu, ordermoney, Globals.TRADECARD,cash, studyCard.add(orderMoneyBd.negate()), req);
				stu.setStudycard(studyCard.add(orderMoneyBd.negate()));
				order.setOrderCashmoney(new BigDecimal(0));
				order.setOrderCards(orderMoneyBd);
				order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
				order.setOrderPaytime(new Date());
				orderService.saveOrUpdate(order);
				orderService.saveOrUpdate(stu);
			}else{
				saveTrade(stu, ordermoney, Globals.TRADECARD,cash, new BigDecimal(0), req);
				saveTrade(stu, ordermoney, Globals.TRADECARD,stumoney.add(orderMoneyBd.negate()), new BigDecimal(0), req);
				stu.setStudycard(new BigDecimal(0));
				stu.setCash(stumoney.add(orderMoneyBd.negate()));
				order.setOrderCashmoney(stumoney.add(orderMoneyBd.negate()));
				order.setOrderPaytime(new Date());
				order.setOrderCards(studyCard);
				order.setOrderStatus(Globals.ORDER_PAY_SUCCESS);
				orderService.saveOrUpdate(order);
				orderService.saveOrUpdate(stu);
			}
			j.setMsg("开通成功");
			return j;
		}		
		
	}
	
	public void saveTrade(StudentEntity stu, double outlay,int tradeCurrency,BigDecimal cashBalance,BigDecimal cardBalance,HttpServletRequest req ){
		HttpSession session = ContextHolderUtils.getSession();
		SessionInfo sessioninfo = (SessionInfo) session.getAttribute(Globals.USER_SESSION);
		TradeEntity trade = new TradeEntity();
		trade.setTradeTime(new Date());
		trade.setTradeIp(IPUtil.getIpAddr(req));
		trade.setTradeContent("购买课程==>操作者："+sessioninfo.getUser().getUserName());
		trade.setCardBalance(cardBalance);
		trade.setCashBalance(cashBalance);
		trade.setOutlay(new BigDecimal(outlay));
		trade.setStudent(stu);
		trade.setTradeCurrency(tradeCurrency);
		orderService.save(trade);
	}
	
	
	/**
	 * 加载明细列表[订单明细]
	 * 
	 * @return
	 */
	@RequestMapping(params = "itemList")
	public ModelAndView itemList(OrderEntity order, HttpServletRequest req) {
		//===================================================================================
		//获取参数
		Object id0 = order.getId();
		//===================================================================================
		//删除-订单明细
	    String hql0 = "from ItemEntity where 1 = 1 AND orderId = ? ";
	    List<ItemEntity> itemEntityList = systemService.findHql(hql0,id0);
		req.setAttribute("itemList", itemEntityList);
		return new ModelAndView("com/changh/jeeipms/cms/order/itemList");
	}
	
	@RequestMapping(params = "orderDetail")
	public ModelAndView orderDetail(OrderEntity order, HttpServletRequest req){
		if (StringUtil.isNotEmpty(order.getId())) {
			order = orderService.getEntity(OrderEntity.class, order.getId());
			req.setAttribute("order", order);
			String hql0 = "from ItemEntity where 1 = 1 AND orderId = ? ";
			List<ItemEntity> itemEntityList = systemService.findHql(hql0,order.getId());
			req.setAttribute("itemList", itemEntityList);
		}
		return new ModelAndView("com/changh/jeeipms/cms/order/detail");
	}
	
	@RequestMapping(params = "updateMoney")
	public ModelAndView updateMoney(String  id, HttpServletRequest req){
		if (StringUtil.isNotEmpty(id)) {
			StudentEntity stu = orderService.getEntity(StudentEntity.class,id);
			req.setAttribute("stu", stu);
		}
		return new ModelAndView("com/changh/jeeipms/cms/order/modifyCash");
	}
	
	@RequestMapping(params = "updatePrice")
	public ModelAndView updatePrice(String  id, HttpServletRequest req){
		if (StringUtil.isNotEmpty(id)) {
			OrderEntity order = orderService.getEntity(OrderEntity.class,id);
			req.setAttribute("order", order);
		}
		return new ModelAndView("com/changh/jeeipms/cms/order/modifyPrice");
	}
	
	
}
