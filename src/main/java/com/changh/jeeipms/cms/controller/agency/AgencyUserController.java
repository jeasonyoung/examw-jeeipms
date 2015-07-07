package com.changh.jeeipms.cms.controller.agency;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.tag.vo.easyui.Autocomplete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.agency.AgencyUserServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;

/**   
 * @Title: Controller
 * @Description: 机构用户
 * @author failymiss
 * @date 2013-07-25 17:32:51
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysagencyUserController")
public class AgencyUserController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AgencyUserController.class);

	@Autowired
	private AgencyUserServiceI agencyUserService;
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
	 * 按查找指定公司的管理员
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "agencyUser")
	public ModelAndView agencyUser(HttpServletRequest request) {		
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyUserList");
	}
	
	/**
	 * 自动完成请求返回数据
	 * 
	 * @param request
	 * @param responss
	 */
	@RequestMapping(params = "getAutoList")
	public void getAutoList(HttpServletRequest request, HttpServletResponse response, Autocomplete autocomplete) {
		String jsonp = request.getParameter("jsonpcallback");
		String trem = StringUtil.getEncodePra(request.getParameter("trem"));// 重新解析参数
		autocomplete.setTrem(trem);
		List autoList = systemService.getAutoList(autocomplete);
		String labelFields = autocomplete.getLabelField();
		String[] fieldArr = labelFields.split(",");
		String valueField = autocomplete.getValueField();
		String[] allFieldArr = null;
		if (StringUtil.isNotEmpty(valueField)) {
			allFieldArr = new String[fieldArr.length+1];
			for (int i=0; i<fieldArr.length; i++) {
				allFieldArr[i] = fieldArr[i];
			}
			allFieldArr[fieldArr.length] = valueField;
		}
		
		try {
			String str = TagUtil.getAutoList(autocomplete, autoList);
			str = "(" + str + ")";
			response.setContentType("application/json;charset=UTF-8");
			response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.getWriter().write(JSONHelper.listtojson(allFieldArr,allFieldArr.length,autoList));
            response.getWriter().flush();
            response.getWriter().close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}
	/**
	 * 机构用户列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "agencyId")
	public ModelAndView agencyName(HttpServletRequest req) {
		String apeid = oConvertUtils.getString(req.getParameter("ape_id"));
		if(!StringUtil.isEmpty(apeid)){
			req.getSession().setAttribute("ape_id", apeid);
		}
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyUserList");
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
	public void datagrid(AgencyUserEntity agencyUser,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(AgencyUserEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, agencyUser);
		//查询条件公司名称
		String apename = oConvertUtils.getString(request.getParameter("ape_name"));
		HttpSession  session = request.getSession();
		String apeid = (String) session.getAttribute("ape_id");
		if(!StringUtil.isEmpty(apeid)){
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("ape");
			dcpr.add(Restrictions.eq("id", apeid));//
			//session.removeAttribute("ape_id");  2014.03.26 修改
		}
		if (!StringUtil.isEmpty(apename)) {
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("ape");
			//dcDepart.add(Restrictions.like("departname", "%" + departname + "%"));// 部门名
			dcpr.add(Restrictions.like("name", "%" +apename+ "%"));// 部门ID
		}
		this.agencyUserService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构用户
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(AgencyUserEntity agencyUser, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		agencyUser = systemService.getEntity(AgencyUserEntity.class, agencyUser.getId());
		message = "删除成功";
		agencyUserService.delete(agencyUser);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构用户
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(AgencyUserEntity agencyUser, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(agencyUser.getId())) {
			message = "更新成功";
			AgencyUserEntity t = agencyUserService.get(AgencyUserEntity.class, agencyUser.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agencyUser, t);
				agencyUserService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			agencyUserService.save(agencyUser);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		return j;
	}

	/**
	 * 机构用户列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(AgencyUserEntity agencyUser, HttpServletRequest req) {
		List<AgencyEntity> agencyList = systemService.getList(AgencyEntity.class);
		req.setAttribute("agencyList", agencyList);
		if (StringUtil.isNotEmpty(agencyUser.getId())) {
			agencyUser = agencyUserService.getEntity(AgencyUserEntity.class, agencyUser.getId());
			req.setAttribute("agencyUserPage", agencyUser);
		}
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyUser");
	}
}
