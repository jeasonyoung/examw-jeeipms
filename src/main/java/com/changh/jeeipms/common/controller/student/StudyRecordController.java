package com.changh.jeeipms.common.controller.student;
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
import com.changh.jeeipms.common.entity.student.StudyRecordEntity;
import com.changh.jeeipms.common.service.student.StudyRecordServiceI;

/**   
 * @Title: Controller
 * @Description: 学习记录
 * @author failymiss
 * @date 2013-10-10 14:30:46
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/studyRecordController")
public class StudyRecordController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(StudyRecordController.class);

	@Autowired
	private StudyRecordServiceI studyRecordService;
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
	 * 学习记录列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "studyRecord")
	public ModelAndView studyRecord(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/student/studyRecordList");
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
	public void datagrid(StudyRecordEntity studyRecord,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(StudyRecordEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, studyRecord);
		this.studyRecordService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除学习记录
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(StudyRecordEntity studyRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		studyRecord = systemService.getEntity(StudyRecordEntity.class, studyRecord.getId());
		message = "删除成功";
		studyRecordService.delete(studyRecord);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加学习记录
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(StudyRecordEntity studyRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(studyRecord.getId())) {
			message = "更新成功";
			StudyRecordEntity t = studyRecordService.get(StudyRecordEntity.class, studyRecord.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(studyRecord, t);
				studyRecordService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			studyRecordService.save(studyRecord);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 学习记录列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(StudyRecordEntity studyRecord, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(studyRecord.getId())) {
			studyRecord = studyRecordService.getEntity(StudyRecordEntity.class, studyRecord.getId());
			req.setAttribute("studyRecordPage", studyRecord);
		}
		return new ModelAndView("com/changh/jeeipms/common/student/studyRecord");
	}
}
