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
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.agency.RecourseEntity;
import com.changh.jeeipms.common.service.agency.RecourseServiceI;

/**   
 * @Title: Controller
 * @Description: 机构资源
 * @author failymiss
 * @date 2013-12-03 17:01:12
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysrecourseController")
public class RecourseController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RecourseController.class);

	@Autowired
	private RecourseServiceI recourseService;
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
	 * 机构资源列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "recourse")
	public ModelAndView recourse(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/recourseList");
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
	public void datagrid(RecourseEntity recourse,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(RecourseEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, recourse);
		this.recourseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构资源
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(RecourseEntity recourse, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		recourse = systemService.getEntity(RecourseEntity.class, recourse.getId());
		message = "删除成功";
		recourseService.delete(recourse);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构资源
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(RecourseEntity recourse, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(recourse.getId())) {
			message = "更新成功";
			RecourseEntity t = recourseService.get(RecourseEntity.class, recourse.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(recourse, t);
				recourseService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			recourseService.save(recourse);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构资源列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(RecourseEntity recourse, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(recourse.getId())) {
			recourse = recourseService.getEntity(RecourseEntity.class, recourse.getId());
			req.setAttribute("recoursePage", recourse);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/recourse");
	}
	
	/**
	 * 设置签名跳转页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "doCheck")
	public ModelAndView doCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		if (StringUtil.isNotEmpty(id)) {
			RecourseEntity recourse = recourseService.getEntity(RecourseEntity.class,id);
			request.setAttribute("recourse", recourse);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/recourse_check");
	}
}
