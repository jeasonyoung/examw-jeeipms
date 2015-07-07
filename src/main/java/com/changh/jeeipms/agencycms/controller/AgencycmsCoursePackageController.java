package com.changh.jeeipms.agencycms.controller;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.CoursePackageEntity;
import com.changh.jeeipms.common.entity.agency.PackageCourseEntity;
import com.changh.jeeipms.common.service.agency.CoursePackageServiceI;
import com.changh.jeeipms.common.util.StringUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**   
 * @Title: Controller
 * @Description: 课程套餐
 * @author failymiss
 * @date 2014-02-25 16:34:23
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/agencycmscoursePackageController")
public class AgencycmsCoursePackageController extends BaseController {
	@Autowired
	private CoursePackageServiceI coursePackageService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 套餐列表显示
	 * @param course
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(params = "packageList")
	public String onlinelist( CoursePackageEntity coursePackage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CoursePackageEntity> page = coursePackageService.find(new Page<CoursePackageEntity>(request, response), coursePackage);	
        model.addAttribute("coursePackage", coursePackage);
        model.addAttribute("page", page);
		return "agency/cms/packageList";
	}
	
	/********************************
	 * 套餐处理
	 ********************************/
	/**
	 * 套餐页面跳转
	 * @param course
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdateP(CoursePackageEntity coursePackage, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(coursePackage.getId())) {
			coursePackage = coursePackageService.getEntity(CoursePackageEntity.class, coursePackage.getId());
			req.setAttribute("coursePackage", coursePackage);
		}
		return new ModelAndView("agency/cms/package");
	}

	/**
	 * 删除课程套餐
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CoursePackageEntity coursePackage, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		coursePackage = coursePackageService.getEntity(CoursePackageEntity.class, coursePackage.getId());
		message = "删除成功";
		coursePackageService.delete(coursePackage);
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加课程套餐
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public ModelAndView save(CoursePackageEntity coursePackage, HttpServletRequest request,RedirectAttributes redirectAttributes) {
		HttpSession session = ContextHolderUtils.getSession();
		AgencyUserEntity user = (AgencyUserEntity) session.getAttribute(Globals.AGENCY_USER_SESSION);
		if (StringUtil.isNotEmpty(coursePackage.getId())) {
			coursePackage.setUpdatetime(new Date());
			coursePackage.setPkgDescri( request.getParameter("myeditor"));
			coursePackage.setUpdateby(user.getUsername());
			coursePackage.setStatus(Globals.AGENCY_COURSE_UNTREATED);
			message = "更新成功";
			CoursePackageEntity t = coursePackageService.get(CoursePackageEntity.class, coursePackage.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(coursePackage, t);
				coursePackageService.saveOrUpdate(t);
				addMessage(redirectAttributes, "修改套餐'" + StringUtils.abbr(coursePackage.getPkgName(),18) + "'成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String courseIds = request.getParameter("courseIds");
			coursePackage.setPkgDescri( request.getParameter("myeditor"));
			coursePackage.setAddby(user.getUsername());
			coursePackage.setAddtime(new Date());
			coursePackage.setAgency(ResourceUtil.getAgency());
			coursePackage.setCourseIds(courseIds);
			coursePackage.setStatus(Globals.AGENCY_COURSE_UNTREATED);
			message = "添加成功";
			coursePackageService.save(coursePackage);
			saveRoleUser(coursePackage, courseIds);
			addMessage(redirectAttributes, "添加套餐'" + StringUtils.abbr(coursePackage.getPkgName(),18) + "'成功");
		}	
		return new ModelAndView("redirect:/agencycmscoursePackageController.do?packageList&repage");
	}
	
	/**
	 * 删除套餐
	 * 
	 * @return
	 */
	@RequestMapping(params = "delete")
	public String delonline( String id,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		CoursePackageEntity course = coursePackageService.getEntity(CoursePackageEntity.class, id);
		deleteCourse(id);
		coursePackageService.delete(course);
		addMessage(redirectAttributes, "删除套餐'" + StringUtils.abbr(course.getPkgName(),18) + "'成功");
		return "redirect:/agencycmscoursePackageController.do?packageList&repage";
	}
	
	
	protected void saveRoleUser(CoursePackageEntity coursePackage, String courseId) {
		String[] courseIds = courseId.split(",");
		for (int i = 0; i < courseIds.length; i++) {
			PackageCourseEntity pc = new PackageCourseEntity();
			CourseEntity c= coursePackageService.getEntity(CourseEntity.class, courseIds[i]);
			pc.setCourse(c);
			pc.setCoursePackage(coursePackage);
			coursePackageService.save(pc);
		}
	}
	
	protected void deleteCourse(String id) {
		coursePackageService.deleteAllEntitie(coursePackageService.findByProperty(PackageCourseEntity.class, "coursePackage.id", id));
	}
	
	
	

	/**
	 * 课程树形结构
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		HttpSession session =  ContextHolderUtils.getSession();
		String  agencyId = (String) session.getAttribute("agengcyid");
		List<CourseEntity> list = coursePackageService.findHql("from CourseEntity c where c.agency.id='"+agencyId+"' order by c.addtime desc");
		for (int i=0; i<list.size(); i++){
			CourseEntity c = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", c.getId());
			map.put("pId", 0);
			map.put("name", c.getCoursename()); 
			mapList.add(map);
		}
		return mapList;
	}
}
