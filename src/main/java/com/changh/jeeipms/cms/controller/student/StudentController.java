package com.changh.jeeipms.cms.controller.student;
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
import com.changh.jeeipms.common.entity.student.StudentEntity;
import com.changh.jeeipms.common.service.student.StudentServiceI;

/**   
 * @Title: Controller
 * @Description: 学员管理
 * @author failymiss
 * @date 2013-09-22 09:23:58
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysstudentController")
public class StudentController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(StudentController.class);

	@Autowired
	private StudentServiceI studentService;
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
	 * 学员管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "student")
	public ModelAndView student(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/student/studentList");
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
	public void datagrid(StudentEntity student,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("addtime");
		}
		CriteriaQuery cq = new CriteriaQuery(StudentEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, student);
		this.studentService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除学员管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(StudentEntity student, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		student = systemService.getEntity(StudentEntity.class, student.getId());
		message = "删除成功";
		studentService.delete(student);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加学员管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(StudentEntity student, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(student.getId())) {
			message = "更新成功";
			StudentEntity t = studentService.get(StudentEntity.class, student.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(student, t);
				studentService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			studentService.save(student);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 学员管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(StudentEntity student, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(student.getId())) {
			student = studentService.getEntity(StudentEntity.class, student.getId());
			req.setAttribute("studentPage", student);
		}
		return new ModelAndView("com/changh/jeeipms/common/student/student");
	}
}
