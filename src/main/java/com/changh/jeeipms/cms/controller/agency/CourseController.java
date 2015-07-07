package com.changh.jeeipms.cms.controller.agency;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.ComboTree;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.tag.vo.easyui.ComboTreeModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.service.agency.CourseServiceI;

/**   
 * @Title: Controller
 * @Description: 机构课程
 * @author failymiss
 * @date 2013-08-20 15:23:46
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/syscourseController")
public class CourseController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CourseController.class);

	@Autowired
	private CourseServiceI courseService;
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
	 * 机构课程列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "course")
	public ModelAndView course(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/courseIframe");
	}
	 
	@RequestMapping(params = "list")
	public ModelAndView course2(HttpServletRequest request) {
		request.setAttribute("agencyId", request.getParameter("agencyId"));
		return new ModelAndView("com/changh/jeeipms/common/agency/courseList");
	}
	/**
	 * 父级DEMO下拉菜单
	 */
	@RequestMapping(params = "pDemoList")
	@ResponseBody
	public List<ComboTree> pDemoList(HttpServletRequest request, ComboTree comboTree) {
		List<AgencyEntity> demoList = systemService.getList(AgencyEntity.class);
		List<ComboTree> comboTrees = new ArrayList<ComboTree>();
		for(AgencyEntity a:demoList){
			ComboTree c = new ComboTree();
			c.setId(a.getId());
			c.setText(a.getName());
			comboTrees.add(c);
		}
		
		return comboTrees;
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
	public void datagrid(CourseEntity course,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("addtime");
		}
		CriteriaQuery cq = new CriteriaQuery(CourseEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, course);
		//String name = oConvertUtils.getString(request.getParameter("agency_name"));
		String agencyId = (String) request.getParameter("agencyId");
		if (!StringUtil.isEmpty(agencyId)) {
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("agency");
			//dcDepart.add(Restrictions.like("departname", "%" + departname + "%"));// 部门名
			dcpr.add(Restrictions.eq("id", agencyId));// 部门ID
		}
		this.courseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构课程
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CourseEntity course, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		course = systemService.getEntity(CourseEntity.class, course.getId());
		message = "删除成功";
		courseService.delete(course);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构课程
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CourseEntity course, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(course.getId())) {
			message = "更新成功";
			CourseEntity t = courseService.get(CourseEntity.class, course.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(course, t);
				courseService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			courseService.save(course);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构课程列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CourseEntity course, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(course.getId())) {
			course = courseService.getEntity(CourseEntity.class, course.getId());
			req.setAttribute("coursePage", course);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/course");
	}
	
	/**
	 * 审核跳转
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "doCheck")
	public ModelAndView doCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		if (StringUtil.isNotEmpty(id)) {
			CourseEntity course = courseService.getEntity(CourseEntity.class,id);
			request.setAttribute("course", course);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/course-check");
	}

}
