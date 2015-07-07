package com.changh.jeeipms.cms.controller.order;
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

import com.changh.jeeipms.cms.entity.order.SchoolEntity;
import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.order.SchoolServiceI;

/**   
 * @Title: Controller
 * @Description: 合作网校
 * @author failymiss
 * @date 2013-12-23 14:14:25
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysschoolController")
public class SchoolController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SchoolController.class);

	@Autowired
	private SchoolServiceI schoolService;
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
	 * 合作网校列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "school")
	public ModelAndView school(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/cms/order/schoolList");
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
	public void datagrid(SchoolEntity school,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SchoolEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, school);
		this.schoolService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合作网校
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(SchoolEntity school, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		school = systemService.getEntity(SchoolEntity.class, school.getId());
		message = "删除成功";
		schoolService.delete(school);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合作网校
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(SchoolEntity school, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(school.getId())) {
			message = "更新成功";
			SchoolEntity t = schoolService.get(SchoolEntity.class, school.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(school, t);
				schoolService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			schoolService.save(school);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合作网校列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(SchoolEntity school, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(school.getId())) {
			school = schoolService.getEntity(SchoolEntity.class, school.getId());
			req.setAttribute("schoolPage", school);
		}
		return new ModelAndView("com/changh/jeeipms/cms/order/school");
	}
}
