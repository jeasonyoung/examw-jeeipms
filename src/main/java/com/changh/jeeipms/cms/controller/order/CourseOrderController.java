package com.changh.jeeipms.cms.controller.order;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.order.CourseOrderEntity;
import com.changh.jeeipms.common.service.order.CourseOrderServiceI;

/**   
 * @Title: Controller
 * @Description: 订单列表
 * @author failymiss
 * @date 2013-09-29 13:54:00
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/courseOrderController")
public class CourseOrderController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CourseOrderController.class);

	@Autowired
	private CourseOrderServiceI courseOrderService;
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
	 * 订单列表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "courseOrder")
	public ModelAndView courseOrder(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/order/courseOrderList");
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
	public void datagrid(CourseOrderEntity courseOrder,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CourseOrderEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, courseOrder);
		this.courseOrderService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除订单列表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CourseOrderEntity courseOrder, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		courseOrder = systemService.getEntity(CourseOrderEntity.class, courseOrder.getId());
		message = "删除成功";
		courseOrderService.delete(courseOrder);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加订单列表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CourseOrderEntity courseOrder, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(courseOrder.getId())) {
			message = "更新成功";
			CourseOrderEntity t = courseOrderService.get(CourseOrderEntity.class, courseOrder.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(courseOrder, t);
				courseOrderService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			courseOrderService.save(courseOrder);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 订单列表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CourseOrderEntity courseOrder, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(courseOrder.getId())) {
			courseOrder = courseOrderService.getEntity(CourseOrderEntity.class, courseOrder.getId());
			req.setAttribute("courseOrderPage", courseOrder);
		}
		return new ModelAndView("com/changh/jeeipms/common/order/courseOrder");
	}
}
