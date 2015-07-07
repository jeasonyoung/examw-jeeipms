package com.changh.jeeipms.cms.controller.agency;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.ComboTree;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.model.json.TreeGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.tag.vo.datatable.SortDirection;
import org.jeecgframework.tag.vo.easyui.TreeGridModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.service.agency.CourseCategoryServiceI;

/**   
 * @Title: Controller
 * @Description: 课程类别
 * @author failymiss
 * @date 2013-08-19 11:52:17
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/syscourseCategoryController")
public class CourseCategoryController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CourseCategoryController.class);

	@Autowired
	private CourseCategoryServiceI courseCategoryService;
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
	 * 课程类别列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "courseCategory")
	public ModelAndView courseCategory(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/courseCategoryList");
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
	public void datagrid(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CourseCategoryEntity.class, dataGrid);
		this.courseCategoryService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除课程类别
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CourseCategoryEntity courseCategory, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		courseCategory = systemService.getEntity(CourseCategoryEntity.class, courseCategory.getId());
		message = "删除成功";
		courseCategoryService.delete(courseCategory);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加课程类别
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CourseCategoryEntity courseCategory, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String pid = request.getParameter("category.id");
		if(pid==""){
			courseCategory.setCategory(null);
		}
		if (StringUtil.isNotEmpty(courseCategory.getId())) {
			message = "课程类别:"+courseCategory.getCategoryname()+"更新成功";
			CourseCategoryEntity t = courseCategoryService.get(CourseCategoryEntity.class, courseCategory.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(courseCategory, t);
				courseCategoryService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "课程类别:"+courseCategory.getCategoryname()+"添加成功";
			courseCategoryService.save(courseCategory);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 课程类别列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CourseCategoryEntity courseCategory, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(courseCategory.getId())) {
			courseCategory = courseCategoryService.getEntity(CourseCategoryEntity.class, courseCategory.getId());
			req.setAttribute("courseCategoryPage", courseCategory);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/courseCategory");
	}
	
	
	/**
	 * 课程列表，树形展示
	 * @param request
	 * @param response
	 * @param treegrid
	 * @return
	 */
	@RequestMapping(params = "coursegrid")
	@ResponseBody
	public  List<TreeGrid>  coursegrid(CourseCategoryEntity  category,HttpServletRequest request, HttpServletResponse response, TreeGrid treegrid) {
		CriteriaQuery cq = new CriteriaQuery(CourseCategoryEntity.class);
		// update-begin--Author:sun  Date:20130510 for：[089]解决部门名称查询异常 
		if("yes".equals(request.getParameter("isSearch"))){
			treegrid.setId(null);
			category.setId(null);
		} 
		if(null != category.getCategoryname()){
			org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq,category);
		}
		if (treegrid.getId() != null) {
			cq.eq("category.id", treegrid.getId());
			/*for(int j=1;j<10;j++){
				for(int i=1;i<10;i++){
					CourseCategoryEntity c = new CourseCategoryEntity();
					CourseCategoryEntity c2 = new CourseCategoryEntity();
					c2.setId(""+j);
					c.setCategory(c2);
					c.setCategoryname("测试"+j+""+i);
					c.setCategoryorder(""+i);
					c.setContent("测试"+j+""+i);
					c.setHref("http://www.examw.com/");
					*//**
					 * _blank	在新窗口中打开被链接文档。
					 * _self	默认。在相同的框架中打开被链接文档。
					 * _parent	在父框架集中打开被链接文档。
					 * _top	在整个窗口中打开被链接文档。
					 *	framename	在指定的框架中打开被链接文档。
					 *//*
					c.setTarget("_blank");
					courseCategoryService.save(c);
				}
			}*/
		}
		if (treegrid.getId() == null) {
			cq.isNull("category");
		}
		cq.addOrder("categoryorder", SortDirection.asc);
		cq.add();
		List<CourseCategoryEntity> categoryList =null;
		categoryList=systemService.getListByCriteriaQuery(cq, false);
		if(categoryList.size()==0&&category.getCategoryname()!=null){ 
			cq = new CriteriaQuery(CourseCategoryEntity.class);
			CourseCategoryEntity c = new CourseCategoryEntity();
			category.setCategory(c);
			org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, category);
			categoryList =systemService.getListByCriteriaQuery(cq, false);
		}
		List<TreeGrid> treeGrids = new ArrayList<TreeGrid>();
		TreeGridModel treeGridModel = new TreeGridModel();
		treeGridModel.setTextField("categoryname");
		treeGridModel.setParentText("category_categoryname");
		treeGridModel.setParentId("category_id");
		treeGridModel.setSrc("content");
		treeGridModel.setCode("href");
		treeGridModel.setIcon("image");
		treeGridModel.setIdField("id");
		treeGridModel.setChildList("childcategory");
		treeGridModel.setOrder("categoryorder");
		treeGrids = systemService.treegrid(categoryList, treeGridModel);
		//System.out.println(treeGrids.get(0).getCode());
		return treeGrids;
	}
	
	/***
	 * 加载上级课程
	 * @param request
	 * @param comboTree
	 * @return
	 */
	@RequestMapping(params = "setPcourse")
	@ResponseBody
	public List<ComboTree> setPFunction(HttpServletRequest request, ComboTree comboTree) {
		CriteriaQuery cq = new CriteriaQuery(CourseCategoryEntity.class);
		if (StringUtil.isNotEmpty(comboTree.getId())) {
			cq.eq("category.id", comboTree.getId());
		}
		// ----------------------------------------------------------------
		// update-begin--Author:liutao Date:20130205 for：将isNotEmpty方法改为isEmpty
		// ----------------------------------------------------------------
		if (StringUtil.isEmpty(comboTree.getId())) {
			cq.isNull("category.id");
		}
		// ----------------------------------------------------------------
		// update-begin--Author:liutao Date:20130205 for：将isNotEmpty方法改为isEmpty
		// ----------------------------------------------------------------
		cq.add();
		List<CourseCategoryEntity> courseCategoryList = systemService.getListByCriteriaQuery(cq, false);
		List<ComboTree> comboTrees = new ArrayList<ComboTree>();
		comboTrees = systemService.courseCategoryTree(courseCategoryList, comboTree);
		return comboTrees;

	}
}
