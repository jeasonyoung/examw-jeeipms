package com.changh.jeeipms.cms.controller.agency;
import java.util.List;

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
import com.changh.jeeipms.cms.service.agency.AgencyUserServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;

/**   
 * @Title: Controller
 * @Description: 机构统计
 * @author failymiss
 * @date 2013-07-25 10:23:07
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysagencyParameterController")
public class AgencyParameterController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AgencyParameterController.class);

	@Autowired
	private AgencyParameterServiceI agencyParameterService;
	@Autowired
	private SystemService systemService;
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
	 * 机构统计列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "agencyParameter")
	public ModelAndView agencyParameter(HttpServletRequest request) {
		String province = "";
		List<ProvinceEntity> provinceList = systemService.getList(ProvinceEntity.class);
		for (ProvinceEntity p : provinceList) {
			if (province.length() > 0) {
				province += ",";
			}
			province += p.getProvince() + "_" + p.getId();
		}
		request.setAttribute("province", province);
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyParameterList");
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
	public void datagrid(AgencyParameterEntity agencyParameter,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("createTime");
		}
		CriteriaQuery cq = new CriteriaQuery(AgencyParameterEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, agencyParameter);
		// 追加地区条件查询 (如果是input型，传的是部门名；如果是combo型，传的是部门ID)
		String provincename = oConvertUtils.getString(request.getParameter("province_province"));
		if (!StringUtil.isEmpty(provincename)) {
			DetachedCriteria dc = cq.getDetachedCriteria();
			DetachedCriteria dcpr = dc.createCriteria("province");
			//dcDepart.add(Restrictions.like("departname", "%" + departname + "%"));// 部门名
			dcpr.add(Restrictions.eq("id", provincename));// 部门ID
		}
		this.agencyParameterService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构统计
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(AgencyParameterEntity agencyParameter, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		agencyParameter = systemService.getEntity(AgencyParameterEntity.class, agencyParameter.getId());
		//级联删除该机构的关联员
		List<AgencyUserEntity> list = agencyUserService.findByProperty(AgencyUserEntity.class, "ape.id", agencyParameter.getId());
		if(list!=null&&list.size()!=0){
			agencyUserService.deleteAllEntitie(list);
		}
		message ="培训机构："+ agencyParameter.getName()+ "删除成功";
		agencyParameterService.delete(agencyParameter);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构统计
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(AgencyParameterEntity agencyParameter, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(agencyParameter.getId())) {
			message = "培训机构："+ agencyParameter.getName()+"更新成功";
			AgencyParameterEntity t = agencyParameterService.get(AgencyParameterEntity.class, agencyParameter.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agencyParameter, t);
				agencyParameterService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "培训机构："+ agencyParameter.getName()+"添加成功";
			agencyParameterService.save(agencyParameter);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构统计列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(AgencyParameterEntity agencyParameter, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(agencyParameter.getId())) {
			agencyParameter = agencyParameterService.getEntity(AgencyParameterEntity.class, agencyParameter.getId());
			req.setAttribute("agencyParameterPage", agencyParameter);
		}
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyParameter");
	}
}
