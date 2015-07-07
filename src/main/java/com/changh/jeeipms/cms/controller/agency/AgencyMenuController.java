package com.changh.jeeipms.cms.controller.agency;
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
import com.changh.jeeipms.common.entity.agency.AgencyMenuEntity;
import com.changh.jeeipms.common.service.agency.AgencyMenuServiceI;

/**   
 * @Title: Controller
 * @Description: 机构菜单
 * @author failymiss
 * @date 2013-09-12 11:55:49
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysagencyMenuController")
public class AgencyMenuController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AgencyMenuController.class);

	@Autowired
	private AgencyMenuServiceI agencyMenuService;
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
	 * 机构菜单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "agencyMenu")
	public ModelAndView agencyMenu(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/agencyMenuList");
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
	public void datagrid(AgencyMenuEntity agencyMenu,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(AgencyMenuEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, agencyMenu);
		this.agencyMenuService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构菜单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(AgencyMenuEntity agencyMenu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		agencyMenu = systemService.getEntity(AgencyMenuEntity.class, agencyMenu.getId());
		message = "删除成功";
		agencyMenuService.delete(agencyMenu);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构菜单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(AgencyMenuEntity agencyMenu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(agencyMenu.getId())) {
			message = "更新成功";
			AgencyMenuEntity t = agencyMenuService.get(AgencyMenuEntity.class, agencyMenu.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agencyMenu, t);
				agencyMenuService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			agencyMenuService.save(agencyMenu);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构菜单列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(AgencyMenuEntity agencyMenu, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(agencyMenu.getId())) {
			agencyMenu = agencyMenuService.getEntity(AgencyMenuEntity.class, agencyMenu.getId());
			req.setAttribute("agencyMenuPage", agencyMenu);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/agencyMenu");
	}
}
