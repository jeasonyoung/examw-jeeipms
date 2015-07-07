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
import com.changh.jeeipms.common.entity.student.NoteEntity;
import com.changh.jeeipms.common.service.student.NoteServiceI;

/**   
 * @Title: Controller
 * @Description: 学员笔记
 * @author failymiss
 * @date 2013-10-21 14:18:42
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysnoteController")
public class NoteController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(NoteController.class);

	@Autowired
	private NoteServiceI noteService;
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
	 * 学员笔记列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "note")
	public ModelAndView note(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/student/noteList");
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
	public void datagrid(NoteEntity note,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(NoteEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, note);
		this.noteService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除学员笔记
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(NoteEntity note, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		note = systemService.getEntity(NoteEntity.class, note.getId());
		message = "删除成功";
		noteService.delete(note);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加学员笔记
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(NoteEntity note, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(note.getId())) {
			message = "更新成功";
			NoteEntity t = noteService.get(NoteEntity.class, note.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(note, t);
				noteService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";	
			noteService.save(note);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 学员笔记列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(NoteEntity note, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(note.getId())) {
			note = noteService.getEntity(NoteEntity.class, note.getId());
			req.setAttribute("notePage", note);
		}
		return new ModelAndView("com/changh/jeeipms/common/student/note");
	}
}
