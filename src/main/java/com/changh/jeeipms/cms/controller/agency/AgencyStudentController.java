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
import com.changh.jeeipms.common.entity.agency.AgencyStudentEntity;
import com.changh.jeeipms.common.service.agency.AgencyStudentServiceI;

/**   
 * @Title: Controller
 * @Description: 咨询学员
 * @author failymiss
 * @date 2013-08-08 16:30:15
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysagencyStudentController")
public class AgencyStudentController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AgencyStudentController.class);

	@Autowired
	private AgencyStudentServiceI agencyStudentService;
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
	 * 咨询学员列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "agencyStudent")
	public ModelAndView agencyStudent(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/student/agencyStudentList");
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
	public void datagrid(AgencyStudentEntity agencyStudent,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("addtime");
		}
		CriteriaQuery cq = new CriteriaQuery(AgencyStudentEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, agencyStudent);
		this.agencyStudentService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除咨询学员
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(AgencyStudentEntity agencyStudent, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		agencyStudent = agencyStudentService.getEntity(AgencyStudentEntity.class, agencyStudent.getId());
		message = "删除成功";
		agencyStudentService.delete(agencyStudent);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加咨询学员
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(AgencyStudentEntity agencyStudent, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(agencyStudent.getId())) {
			message = "更新成功";
			AgencyStudentEntity t = agencyStudentService.get(AgencyStudentEntity.class, agencyStudent.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agencyStudent, t);
				agencyStudentService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			agencyStudentService.save(agencyStudent);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 咨询学员列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(AgencyStudentEntity agencyStudent, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(agencyStudent.getId())) {
			agencyStudent = agencyStudentService.getEntity(AgencyStudentEntity.class, agencyStudent.getId());
			req.setAttribute("agencyStudentPage", agencyStudent);
		}
		return new ModelAndView("com/changh/jeeipms/common/student/agencyStudent");
	}
}
