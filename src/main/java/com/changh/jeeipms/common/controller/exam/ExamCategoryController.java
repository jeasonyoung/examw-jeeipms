package com.changh.jeeipms.common.controller.exam;
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
import com.changh.jeeipms.common.entity.exam.ExamCategoryEntity;
import com.changh.jeeipms.common.service.exam.ExamCategoryServiceI;

/**   
 * @Title: Controller
 * @Description: 考试类别
 * @author failymiss
 * @date 2013-12-31 11:16:36
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysexamCategoryController")
public class ExamCategoryController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ExamCategoryController.class);

	@Autowired
	private ExamCategoryServiceI examCategoryService;
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
	 * 考试类别列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "examCategory")
	public ModelAndView examCategory(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/exam/examCategoryList");
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
	public void datagrid(ExamCategoryEntity examCategory,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ExamCategoryEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, examCategory);
		this.examCategoryService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除考试类别
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(ExamCategoryEntity examCategory, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		examCategory = systemService.getEntity(ExamCategoryEntity.class, examCategory.getId());
		message = "删除成功";
		examCategoryService.delete(examCategory);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加考试类别
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(ExamCategoryEntity examCategory, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(examCategory.getId())) {
			message = "更新成功";
			ExamCategoryEntity t = examCategoryService.get(ExamCategoryEntity.class, examCategory.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(examCategory, t);
				examCategoryService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			examCategoryService.save(examCategory);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 考试类别列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(ExamCategoryEntity examCategory, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(examCategory.getId())) {
			examCategory = examCategoryService.getEntity(ExamCategoryEntity.class, examCategory.getId());
			req.setAttribute("examCategoryPage", examCategory);
		}
		return new ModelAndView("com/changh/jeeipms/common/exam/examCategory");
	}
}
