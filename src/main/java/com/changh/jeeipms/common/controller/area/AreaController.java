package com.changh.jeeipms.common.controller.area;
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
import com.changh.jeeipms.common.entity.area.AreaEntity;
import com.changh.jeeipms.common.service.area.AreaServiceI;

/**   
 * @Title: Controller
 * @Description: 地区管理
 * @author failymiss
 * @date 2013-07-23 16:36:38
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/areaController")
public class AreaController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AreaController.class);

	@Autowired
	private AreaServiceI areaService;
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
	 * 地区管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "area")
	public ModelAndView area(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/area/areaList");
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
	public void datagrid(AreaEntity area,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(AreaEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, area);
		this.areaService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除地区管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(AreaEntity area, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		area = systemService.getEntity(AreaEntity.class, area.getId());
		message = "删除成功";
		areaService.delete(area);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加地区管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(AreaEntity area, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(area.getId())) {
			message = "更新成功";
			AreaEntity t = areaService.get(AreaEntity.class, area.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(area, t);
				areaService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			areaService.save(area);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 地区管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(AreaEntity area, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(area.getId())) {
			area = areaService.getEntity(AreaEntity.class, area.getId());
			req.setAttribute("areaPage", area);
		}
		return new ModelAndView("com/changh/jeeipms/common/area/area");
	}
}
