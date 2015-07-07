package com.changh.jeeipms.cms.controller.agency;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.CoursePackageEntity;
import com.changh.jeeipms.common.service.agency.CoursePackageServiceI;

/**   
 * @Title: Controller
 * @Description: 套餐管理
 * @author failymiss
 * @date 2014-03-05 13:43:16
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/syscoursePackageController")
public class CoursePackageController extends BaseController {

	@Autowired
	private CoursePackageServiceI coursePackageService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 套餐管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "coursePackage")
	public ModelAndView coursePackage(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/packageIframe");
	}
	
	@RequestMapping(params = "list")
	public ModelAndView course2(HttpServletRequest request) {
		request.setAttribute("agencyId", request.getParameter("agencyId"));
		return new ModelAndView("com/changh/jeeipms/common/agency/coursePackageList");
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
	public void datagrid(CoursePackageEntity coursePackage,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CoursePackageEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, coursePackage);
		String agencyId = (String) request.getParameter("agencyId");
		if (!StringUtil.isEmpty(agencyId)) {
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("agency");
			//dcDepart.add(Restrictions.like("departname", "%" + departname + "%"));// 部门名
			dcpr.add(Restrictions.eq("id", agencyId));// 部门ID
		}
		this.coursePackageService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除套餐管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CoursePackageEntity coursePackage, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		coursePackage = coursePackageService.getEntity(CoursePackageEntity.class, coursePackage.getId());
		message = "删除成功";
		coursePackageService.delete(coursePackage);
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加套餐管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CoursePackageEntity coursePackage, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(coursePackage.getId())) {
			message = "更新成功";
			CoursePackageEntity t = coursePackageService.get(CoursePackageEntity.class, coursePackage.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(coursePackage, t);
				coursePackageService.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			coursePackageService.save(coursePackage);
		}
		
		return j;
	}

	/**
	 * 套餐管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CoursePackageEntity coursePackage, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(coursePackage.getId())) {
			coursePackage = coursePackageService.getEntity(CoursePackageEntity.class, coursePackage.getId());
			req.setAttribute("coursePackagePage", coursePackage);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/coursePackage");
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
			CoursePackageEntity course = coursePackageService.getEntity(CoursePackageEntity.class,id);
			request.setAttribute("coursePackage", course);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/coursePackage-check");
	}

}
