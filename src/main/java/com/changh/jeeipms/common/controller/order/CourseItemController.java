package com.changh.jeeipms.common.controller.order;
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
import com.changh.jeeipms.common.entity.order.CourseItemEntity;
import com.changh.jeeipms.common.service.order.CourseItemServiceI;

/**   
 * @Title: Controller
 * @Description: 订单详细
 * @author failymiss
 * @date 2013-10-07 14:19:11
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/courseItemController")
public class CourseItemController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CourseItemController.class);

	@Autowired
	private CourseItemServiceI courseItemService;
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
	 * 订单详细列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "courseItem")
	public ModelAndView courseItem(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/order/courseItemList");
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
	public void datagrid(CourseItemEntity courseItem,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CourseItemEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, courseItem);
		this.courseItemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除订单详细
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CourseItemEntity courseItem, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		courseItem = systemService.getEntity(CourseItemEntity.class, courseItem.getId());
		message = "删除成功";
		courseItemService.delete(courseItem);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加订单详细
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CourseItemEntity courseItem, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(courseItem.getId())) {
			message = "更新成功";
			CourseItemEntity t = courseItemService.get(CourseItemEntity.class, courseItem.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(courseItem, t);
				courseItemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			courseItemService.save(courseItem);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 订单详细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CourseItemEntity courseItem, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(courseItem.getId())) {
			courseItem = courseItemService.getEntity(CourseItemEntity.class, courseItem.getId());
			req.setAttribute("courseItemPage", courseItem);
		}
		return new ModelAndView("com/changh/jeeipms/common/order/courseItem");
	}
}
