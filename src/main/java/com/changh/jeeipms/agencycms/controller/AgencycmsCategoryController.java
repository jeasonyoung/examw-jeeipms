package com.changh.jeeipms.agencycms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.ComboTree;
import org.jeecgframework.core.common.model.json.TreeGrid;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.vo.datatable.SortDirection;
import org.jeecgframework.tag.vo.easyui.TreeGridModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.service.agency.CourseCategoryServiceI;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**   
 * @Title: Controller
 * @Description: 课程类别
 * @author failymiss
 * @date 2013-08-19 11:52:17
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/agencycmscourseCategory")
public class AgencycmsCategoryController extends BaseController {
	
	@Autowired
	private CourseCategoryServiceI courseCategoryService;
	@Autowired
	private SystemService systemService;
	
	
	@ResponseBody
	@RequestMapping(params = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		AgencyEntity agency =  ResourceUtil.getAgency();
		String[] courseId = agency.getCategory().split(",");
		List<CourseCategoryEntity> list = new ArrayList<CourseCategoryEntity>();
		if(courseId!=null&&courseId.length!=0){
			for(String c:courseId){
				List<CourseCategoryEntity> list1 = courseCategoryService.findByQueryString("from CourseCategoryEntity c where c.id= '"+c+"' or c.parentcategoryids like '%"+c+",%'");
				list.addAll(list1);
			}
		}
		for (int i=0; i<list.size(); i++){
			CourseCategoryEntity c = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", c.getId());
			map.put("pId", c.getCategory()!=null?c.getCategory().getId():0);
			map.put("name", c.getCategoryname());
			mapList.add(map);
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(params = "treeMain")
	public List<Map<String, Object>> treeMain(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<CourseCategoryEntity> list = courseCategoryService.findByQueryString("from CourseCategoryEntity c where c.category is null order by c.categoryorder asc");
		for (int i=0; i<list.size(); i++){
			CourseCategoryEntity c = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", c.getId());
			map.put("pId", c.getCategory()!=null?c.getCategory().getId():0);
			map.put("name", c.getCategoryname());
			mapList.add(map);
		}
		return mapList;
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
		//----------------------------------------------------------------
		//update-begin--Author:yeshuai  Date:20130412 for：增加部门名称搜寻框
		if(null != category.getCategoryname()){
			org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq,category);
		}
		//update-end--Author:yeshuai  Date:20130412 for：增加部门名称搜寻框
		//----------------------------------------------------------------
		if (treegrid.getId() != null) {
			cq.eq("category.id", treegrid.getId());
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
		// update-end--Author:sun  Date:20130510 for：[089]解决部门名称查询异常 
		List<TreeGrid> treeGrids = new ArrayList<TreeGrid>();
		TreeGridModel treeGridModel = new TreeGridModel();
		treeGridModel.setTextField("categoryname");
		treeGridModel.setParentText("category_categoryname");
		treeGridModel.setParentId("category_id");
		treeGridModel.setSrc("content");
		treeGridModel.setIdField("id");
		treeGridModel.setChildList("childcategory");
		treeGridModel.setOrder("categoryorder");
		treeGrids = systemService.treegrid(categoryList, treeGridModel);
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
		if (StringUtil.isEmpty(comboTree.getId())) {
			cq.isNull("category.id");
		}
		cq.add();
		List<CourseCategoryEntity> courseCategoryList = systemService.getListByCriteriaQuery(cq, false);
		List<ComboTree> comboTrees = new ArrayList<ComboTree>();
		comboTrees = systemService.courseCategoryTree(courseCategoryList, comboTree);
		return comboTrees;

	}
}
