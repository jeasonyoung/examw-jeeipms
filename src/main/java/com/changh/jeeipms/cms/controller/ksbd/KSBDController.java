package com.changh.jeeipms.cms.controller.ksbd;
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
import com.changh.jeeipms.common.entity.ksbd.KSBDEntity;
import com.changh.jeeipms.common.service.ksbd.KSBDServiceI;

/**   
 * @Title: Controller
 * @Description: 考试宝典
 * @author failymiss
 * @date 2013-12-30 16:25:41
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/syskSBDController")
public class KSBDController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(KSBDController.class);

	@Autowired
	private KSBDServiceI kSBDService;
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
	 * 考试宝典列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "kSBD")
	public ModelAndView kSBD(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/ksbd/kSBDList");
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
	public void datagrid(KSBDEntity kSBD,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(KSBDEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, kSBD);
		this.kSBDService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除考试宝典
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(KSBDEntity kSBD, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		kSBD = systemService.getEntity(KSBDEntity.class, kSBD.getId());
		message = "删除成功";
		kSBDService.delete(kSBD);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加考试宝典
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(KSBDEntity kSBD, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(kSBD.getId())) {
			message = "更新成功";
			KSBDEntity t = kSBDService.get(KSBDEntity.class, kSBD.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(kSBD, t);
				kSBDService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			kSBDService.save(kSBD);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 考试宝典列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(KSBDEntity kSBD, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(kSBD.getId())) {
			kSBD = kSBDService.getEntity(KSBDEntity.class, kSBD.getId());
			req.setAttribute("kSBDPage", kSBD);
		}
		return new ModelAndView("com/changh/jeeipms/common/ksbd/kSBD");
	}
}
