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
import com.changh.jeeipms.common.entity.agency.TeacherEntity;
import com.changh.jeeipms.common.service.agency.TeacherServiceI;

/**   
 * @Title: Controller
 * @Description: 机构老师
 * @author failymiss
 * @date 2013-08-27 17:16:36
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/systeacherController")
public class TeacherController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TeacherController.class);

	@Autowired
	private TeacherServiceI teacherService;
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
	 * 机构老师列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "teacher")
	public ModelAndView teacher(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/teacherList");
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
	public void datagrid(TeacherEntity teacher,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("addtime");
		}
		CriteriaQuery cq = new CriteriaQuery(TeacherEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, teacher);
		this.teacherService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构老师
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TeacherEntity teacher, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		teacher = systemService.getEntity(TeacherEntity.class, teacher.getId());
		message = "删除成功";
		teacherService.delete(teacher);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构老师
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TeacherEntity teacher, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(teacher.getId())) {
			message = "更新成功";
			TeacherEntity t = teacherService.get(TeacherEntity.class, teacher.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(teacher, t);
				teacherService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			teacherService.save(teacher);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构老师列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TeacherEntity teacher, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(teacher.getId())) {
			teacher = teacherService.getEntity(TeacherEntity.class, teacher.getId());
			req.setAttribute("teacherPage", teacher);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/teacher");
	}
}
