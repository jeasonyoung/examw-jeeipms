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
import com.changh.jeeipms.common.entity.content.FrontMenuEntity;
import com.changh.jeeipms.common.service.content.FrontMenuServiceI;

/**   
 * @Title: Controller
 * @Description: 导航菜单
 * @author failymiss
 * @date 2013-09-10 09:34:32
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysfrontMenuController")
public class FrontMenuController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FrontMenuController.class);

	@Autowired
	private FrontMenuServiceI frontMenuService;
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
	 * 导航菜单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "frontMenu")
	public ModelAndView frontMenu(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/content/frontMenuList");
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
	public void datagrid(FrontMenuEntity frontMenu,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(FrontMenuEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, frontMenu);
		this.frontMenuService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除导航菜单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(FrontMenuEntity frontMenu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		frontMenu = systemService.getEntity(FrontMenuEntity.class, frontMenu.getId());
		message = "删除成功";
		frontMenuService.delete(frontMenu);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加导航菜单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(FrontMenuEntity frontMenu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(frontMenu.getId())) {
			message = "更新成功";
			FrontMenuEntity t = frontMenuService.get(FrontMenuEntity.class, frontMenu.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(frontMenu, t);
				frontMenuService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			frontMenuService.save(frontMenu);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 导航菜单列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(FrontMenuEntity frontMenu, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(frontMenu.getId())) {
			frontMenu = frontMenuService.getEntity(FrontMenuEntity.class, frontMenu.getId());
			req.setAttribute("frontMenuPage", frontMenu);
		}
		return new ModelAndView("com/changh/jeeipms/common/content/frontMenu");
	}
}
