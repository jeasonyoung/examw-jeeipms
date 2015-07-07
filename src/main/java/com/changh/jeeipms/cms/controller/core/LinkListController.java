package com.changh.jeeipms.cms.controller.core;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.entity.core.LinkListEntity;
import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.core.LinkListServiceI;
import com.changh.jeeipms.common.entity.content.FrontMenuEntity;

/**   
 * @Title: Controller
 * @Description: 友情链接
 * @author failymiss
 * @date 2013-12-09 11:19:39
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/syslinkListController")
public class LinkListController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(LinkListController.class);

	@Autowired
	private LinkListServiceI linkListService;
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
	 * 友情链接列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "linkList")
	public ModelAndView linkList(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/cms/core/linkListList");
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
	public void datagrid(LinkListEntity linkList,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(LinkListEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, linkList);
		this.linkListService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除友情链接
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(LinkListEntity linkList, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		linkList = systemService.getEntity(LinkListEntity.class, linkList.getId());
		message = "删除成功";
		linkListService.delete(linkList);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加友情链接
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(LinkListEntity linkList, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(linkList.getId())) {
			message = "更新成功";
			LinkListEntity t = linkListService.get(LinkListEntity.class, linkList.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(linkList, t);
				linkListService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			linkList.setAddtime(new Date());
			linkList.setEditor(ResourceUtil.getSessionUserName().getUserName());
			linkListService.save(linkList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 友情链接列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(LinkListEntity linkList, HttpServletRequest req) {
		List<FrontMenuEntity> menuList = linkListService.getList(FrontMenuEntity.class);
		req.setAttribute("menuList", menuList);
		if (StringUtil.isNotEmpty(linkList.getId())) {
			linkList = linkListService.getEntity(LinkListEntity.class, linkList.getId());
			req.setAttribute("linkListPage", linkList);
		}
		return new ModelAndView("com/changh/jeeipms/cms/core/linkList");
	}
}
