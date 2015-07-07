package com.changh.jeeipms.cms.controller.content;
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
import com.changh.jeeipms.common.entity.agency.MenuEntity;
import com.changh.jeeipms.common.service.agency.MenuServiceI;

/**   
 * @Title: Controller
 * @Description: 机构菜单
 * @author failymiss
 * @date 2013-09-02 14:38:12
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysmenuController")
public class MenuController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MenuController.class);

	@Autowired
	private MenuServiceI menuService;
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
	@RequestMapping(params = "menu")
	public ModelAndView menu(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/menuList");
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
	public void datagrid(MenuEntity menu,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(MenuEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, menu);
		this.menuService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构菜单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(MenuEntity menu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		menu = systemService.getEntity(MenuEntity.class, menu.getId());
		message = "删除成功";
		menuService.delete(menu);
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
	public AjaxJson save(MenuEntity menu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(menu.getId())) {
			message = "更新成功";
			MenuEntity t = menuService.get(MenuEntity.class, menu.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(menu, t);
				menuService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			menuService.save(menu);
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
	public ModelAndView addorupdate(MenuEntity menu, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(menu.getId())) {
			menu = menuService.getEntity(MenuEntity.class, menu.getId());
			req.setAttribute("menuPage", menu);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/menu");
	}
}
