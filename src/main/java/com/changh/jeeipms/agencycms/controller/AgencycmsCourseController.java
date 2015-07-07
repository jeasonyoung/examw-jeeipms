package com.changh.jeeipms.agencycms.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.agencycms.entity.VideoList;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.CoursePackageEntity;
import com.changh.jeeipms.common.entity.agency.VideoEntity;
import com.changh.jeeipms.common.entity.area.CityEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;
import com.changh.jeeipms.common.service.agency.CourseServiceI;
import com.changh.jeeipms.common.util.StringUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

@Controller
@RequestMapping("/agencycmscourse")
public class AgencycmsCourseController extends BaseController{
	@Autowired
	private CourseServiceI  courseService;
	
	/**
	 * 机构面授课程列表页面跳转
	 * @param course
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(params = "facelist")
	public String facelist( CourseEntity course, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CourseEntity> page = courseService.find(new Page<CourseEntity>(request, response), course,Globals.FACE_COURSE);	
        model.addAttribute("course", course);
        model.addAttribute("page", page);
		return "agency/cms/faceCourseList";
	}
	
	@RequestMapping(params = "videoList")
	public String videoList(String courseId, HttpServletRequest request, HttpServletResponse response,Model model) {
		List<VideoEntity> list = courseService.findHql("from VideoEntity v where v.course.id=? order by v.videoorder asc", courseId);
		model.addAttribute("list",list);
		model.addAttribute("courseId", courseId);
		return "agency/cms/videoList";
	}
	
	@RequestMapping(params = "batchAdd")
	public String batchAdd(VideoList list, HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes) {
		String courseId = list.getCourseId();
		for(VideoEntity v:list.getList()){
			v.getCourse().setId(courseId);
		}
		courseService.deleteAllEntitie(courseService.findHql("from VideoEntity v where v.course.id=? order by v.videoorder asc", courseId));
		courseService.batchSave(list.getList());
		addMessage(redirectAttributes, "保存成功");
		return "redirect:/agencycmscourse.do?videoList&courseId="+courseId;
	}
	@RequestMapping(params = "deleteVideo")
	public String deleteVideo(String id, HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes) {
		VideoEntity v = courseService.get(VideoEntity.class, id);
		courseService.delete(v);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:/agencycmscourse.do?videoList&courseId="+v.getCourse().getId();
	}
	
	/**
	 * 机构在线课程列表页面跳转
	 * @param course
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(params = "onlinelist")
	public String onlinelist( CourseEntity course, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CourseEntity> page = courseService.find(new Page<CourseEntity>(request, response), course,Globals.ONLINE_COURSE);	
        model.addAttribute("course", course);
        model.addAttribute("page", page);
		return "agency/cms/onlineCourseList";
	}
	
	/**
	 * 机构面授课程列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CourseEntity course, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(course.getId())) {
			course = courseService.getEntity(CourseEntity.class, course.getId());
			req.setAttribute("course", course);
		}
		return new ModelAndView("agency/cms/faceCourse");
	}
	
	
	
	/**
	 * 机构网络课程列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdateonline")
	public ModelAndView addorupdateonline(CourseEntity course, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(course.getId())) {
			course = courseService.getEntity(CourseEntity.class, course.getId());
			req.setAttribute("course", course);
		}
		return new ModelAndView("agency/cms/onlineCourse");
	}
	
	/**
	 * 添加或者修改在线课程
	 * 
	 * @return
	 */
	@RequestMapping(params = "saveonline")
	public ModelAndView addorupdateonline(CourseEntity course, HttpServletRequest req,RedirectAttributes redirectAttributes) {
		if (StringUtil.isNotEmpty(course.getId())) {
			CourseEntity c = courseService.getEntity(CourseEntity.class, course.getId());
			try {
				c.setDescription(req.getParameter("myeditor"));
				MyBeanUtils.copyBeanNotNull2Bean(course, c);
				c.setCity(null);
				c.setUpdatetime(new Date()); 
				//设置状态未审核，需要重新审核
				c.setStatus(Globals.AGENCY_COURSE_UNTREATED);
				if(StringUtil.isEmpty(course.getProvince().getId())){
					c.setProvince(null);
				}
				courseService.saveOrUpdate(c);	
				addMessage(redirectAttributes, "修改课程'" + StringUtils.abbr(c.getCoursename(),18) + "'成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
			req.setAttribute("coursePage", course);
		}else{
			if(StringUtil.isEmpty(course.getProvince().getId())){
				course.setProvince(null);
			}
			course.setDescription(req.getParameter("myeditor"));
			course.setAddtime(new Date());
			course.setCity(null);
			course.setAgency(ResourceUtil.getAgency());
			course.setStatus(Globals.AGENCY_COURSE_UNTREATED);
			course.setCoursetype(Globals.ONLINE_COURSE);
			course.setContent("审核中....");
			course.setBuycount(0);
			course.setCommentcount(0);
			courseService.save(course);
			addMessage(redirectAttributes, "添加课程'" + StringUtils.abbr(course.getCoursename(),18) + "'成功");
		}
		return new ModelAndView("redirect:/agencycmscourse.do?onlinelist&repage");
	}
		@RequestMapping(params = "save")
		public ModelAndView addorupdate(CourseEntity course, HttpServletRequest req,RedirectAttributes redirectAttributes) {
			CityEntity city = (CityEntity) ContextHolderUtils.getSession().getAttribute("city");
			ProvinceEntity province = (ProvinceEntity)ContextHolderUtils.getSession().getAttribute("province");
			if (StringUtil.isNotEmpty(course.getId())) {
				CourseEntity c = courseService.getEntity(CourseEntity.class, course.getId());
				course.setCity(city);
				course.setProvince(province);
				try {
					MyBeanUtils.copyBeanNotNull2Bean(course, c);
					c.setDescription(req.getParameter("myeditor"));
					c.setUpdatetime(new Date());
					c.setStatus(Globals.AGENCY_COURSE_UNTREATED);
					courseService.saveOrUpdate(c);
					addMessage(redirectAttributes, "修改课程'" + StringUtils.abbr(c.getCoursename(),18) + "'成功");
				} catch (Exception e) {
					e.printStackTrace();
				}
				req.setAttribute("coursePage", course);
			}else{
				course.setProvince(province);
				course.setCity(city);
				course.setDescription(req.getParameter("myeditor"));
				course.setAddtime(new Date());
				course.setAgency(ResourceUtil.getAgency());
				course.setCity(ResourceUtil.getAgency().getCity());
				course.setIsfree(Globals.NO_FREE);
				course.setStatus(Globals.AGENCY_COURSE_UNTREATED);
				course.setCoursetype(Globals.FACE_COURSE);
				course.setContent("审核中....");
				course.setBuycount(0);
				course.setCommentcount(0);
				courseService.save(course);
				addMessage(redirectAttributes, "添加课程'" + StringUtils.abbr(course.getCoursename(),18) + "'成功");
			}
		
		return new ModelAndView("redirect:/agencycmscourse.do?facelist&repage");
	}
	
	
	/**
	 * 删除机构在线课程
	 * 
	 * @return
	 */
	@RequestMapping(params = "delonline")
	public String delonline( String courseId,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		CourseEntity course = courseService.getEntity(CourseEntity.class, courseId);
		courseService.delete(course);
		addMessage(redirectAttributes, "删除课程'" + StringUtils.abbr(course.getCoursename(),18) + "'成功");
		return "redirect:/agencycmscourse.do?onlinelist&repage";
	}
	
	/**
	 * 删除机构面授课程
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	public String delface( String courseId,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		CourseEntity course = courseService.getEntity(CourseEntity.class, courseId);
		courseService.delete(course);
		addMessage(redirectAttributes, "删除课程'" + StringUtils.abbr(course.getCoursename(),18) + "'成功");
		return "redirect:/agencycmscourse.do?facelist&repage";
	}
	
	@ResponseBody
	@RequestMapping(params = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<ProvinceEntity> list = courseService.findHql("from ProvinceEntity");
		for (int i=0; i<list.size(); i++){
			ProvinceEntity c = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", c.getId());
			map.put("pId", 0);
			map.put("name", c.getProvince());
			mapList.add(map);
		}
		return mapList;
	}
	
}
