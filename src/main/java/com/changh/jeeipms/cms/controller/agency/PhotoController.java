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
import com.changh.jeeipms.common.entity.agency.PhotoEntity;
import com.changh.jeeipms.common.service.agency.PhotoServiceI;

/**   
 * @Title: Controller
 * @Description: 机构相册
 * @author failymiss
 * @date 2013-12-03 11:30:19
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysphotoController")
public class PhotoController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PhotoController.class);

	@Autowired
	private PhotoServiceI photoService;
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
	 * 机构相册列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "photo")
	public ModelAndView photo(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/agency/photoList");
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
	public void datagrid(PhotoEntity photo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(PhotoEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, photo);
		this.photoService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构相册
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(PhotoEntity photo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		photo = systemService.getEntity(PhotoEntity.class, photo.getId());
		message = "删除成功";
		photoService.delete(photo);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构相册
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(PhotoEntity photo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(photo.getId())) {
			message = "更新成功";
			PhotoEntity t = photoService.get(PhotoEntity.class, photo.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(photo, t);
				photoService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			photoService.save(photo);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构相册列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(PhotoEntity photo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(photo.getId())) {
			photo = photoService.getEntity(PhotoEntity.class, photo.getId());
			req.setAttribute("photoPage", photo);
		}
		return new ModelAndView("com/changh/jeeipms/common/agency/photo");
	}
}
