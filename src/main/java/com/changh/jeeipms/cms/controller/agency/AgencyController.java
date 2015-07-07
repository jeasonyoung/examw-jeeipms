package com.changh.jeeipms.cms.controller.agency;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.agency.AgencyParameterServiceI;
import com.changh.jeeipms.cms.service.agency.AgencyServiceI;
import com.changh.jeeipms.cms.service.agency.AgencyUserServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;

/**   
 * @Title: Controller
 * @Description: 机构管理
 * @author failymiss
 * @date 2013-07-23 10:53:37
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysagencyController")
public class AgencyController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AgencyController.class);

	@Autowired
	private AgencyServiceI agencyService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private AgencyParameterServiceI agencyParameterService;
	@Autowired
	private AgencyUserServiceI agencyUserService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 机构管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "agency")
	public ModelAndView agency(HttpServletRequest request) {
		//为省份下拉框准备数据
		String province = "";
		List<ProvinceEntity> provinceList = systemService.getList(ProvinceEntity.class);
		for (ProvinceEntity p : provinceList) {
			if (province.length() > 0) {
				province += ",";
			}
			province += p.getProvince() + "_" + p.getId();
		}
		request.setAttribute("province", province);
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyList");
	}

	/**
	 * easyui AJAX请求数据
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(AgencyParameterEntity agency,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("createTime");
		}
		CriteriaQuery cq = new CriteriaQuery(AgencyParameterEntity.class, dataGrid);
		
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, agency);
		// 追加地区条件查询 (如果是input型，传的是部门名；如果是combo型，传的是部门ID)
		String provincename = oConvertUtils.getString(request.getParameter("province_province"));
		if (!StringUtil.isEmpty(provincename)) {
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("province");
			//dcDepart.add(Restrictions.like("departname", "%" + departname + "%"));// 部门名
			dcpr.add(Restrictions.eq("id", provincename));// 部门ID
		}
		//最近注册日程查询
		String ctBegin = request.getParameter("createTime_begin");
		String ctEnd = request.getParameter("createTime_end");
		if(StringUtil.isNotEmpty(ctBegin)&& StringUtil.isNotEmpty(ctEnd)){
			try {
				cq.ge("createTime", new SimpleDateFormat("yyyy-MM-dd").parse(ctBegin));
				cq.le("createTime", new SimpleDateFormat("yyyy-MM-dd").parse(ctEnd));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cq.add();
		}
		this.agencyService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(AgencyParameterEntity agency, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		agency = systemService.getEntity(AgencyParameterEntity.class, agency.getId());
		//级联删除该机构的关联员
		List<AgencyUserEntity> list = agencyUserService.findByProperty(AgencyUserEntity.class, "ape.id", agency.getId());
		if(list!=null&&list.size()!=0){
			agencyUserService.deleteAllEntitie(list);
		}
		message ="培训机构："+ agency.getName()+"删除成功";
		agencyService.delete(agency);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}

	/**
	 * 审核机构
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "saveAgency")
	@ResponseBody
	public AjaxJson saveAuthor(AgencyParameterEntity agency, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(agency.getId())) {
			message = "培训机构："+ agency.getName()+"用户申请成功";
			AgencyParameterEntity t =agencyService.get(AgencyParameterEntity.class, agency.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agency, t);
				t.setStatus("1");
				agencyService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return j;
	}
	
	/**
	 * 设置签名跳转页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "doCheck")
	public ModelAndView doCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		if (StringUtil.isNotEmpty(id)) {
			AgencyParameterEntity agency = agencyService.getEntity(AgencyParameterEntity.class,id);
			request.setAttribute("agency", agency);
		}
		return new ModelAndView("com/changh/jeeipms/cms/agency/agency-check");
	}

	/**
	 * 添加机构管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(AgencyParameterEntity agency,AgencyUserEntity user, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(agency.getId())) {
			message = "培训机构："+ agency.getName()+"更新成功";
			AgencyParameterEntity t = agencyService.get(AgencyParameterEntity.class, agency.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agency, t);
				agencyService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "培训机构："+ agency.getName()+"添加成功";
			agency.setCreateTime(new Date());
			agency.setStatus("0");
			agency.setVip("0");
			agency.setExpirationdate(new Date(agency.getCreateTime().getTime()+((long)365 * 24 * 60 * 60 * 1000)));
			agency.setScore("0");
			agency.setLiveness("0");
			agency.setGrade("0");
			agency.setPageview("0");
			agency.setRecommend(Integer.MAX_VALUE);
			agency.setCurrency("0");
			agencyService.save(agency);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(AgencyParameterEntity agency, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(agency.getId())) {
			agency = agencyService.getEntity(AgencyParameterEntity.class, agency.getId());
			req.setAttribute("agencyPage", agency);
		}
		return new ModelAndView("com/changh/jeeipms/cms/agency/agency");
	}
	@RequestMapping(params = "agencyUser")
	public ModelAndView agencyUser(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyUserList");
	}
	
	/**2014.03.26 验证二级域名的唯一性*/
	//数据返回格式{ "info":"验证通过！", "status":"y" }
	@RequestMapping(params = "checkSecondDomain")
	@ResponseBody
	public Map<String,String> checkSecondDomain(AgencyParameterEntity agency,AgencyUserEntity user, HttpServletRequest request) {
		Map<String,String> data = new HashMap<String,String>();
		String value = request.getParameter("param");
		String oldvalue = request.getParameter("value");//老域名
		if(value.equals(oldvalue))	//没有做修改
		{
			data.put("status","y");
			data.put("info", "验证通过");
			return data;
		}
		agency = agencyService.findUniqueByProperty(AgencyParameterEntity.class, "secondDomain", value);
		if(agency == null)
		{
			data.put("status","y");
			data.put("info", "验证通过");
		}else
		{
			data.put("status","n");
			data.put("info", "域名有重复");
		}
		return data;
	}
}
