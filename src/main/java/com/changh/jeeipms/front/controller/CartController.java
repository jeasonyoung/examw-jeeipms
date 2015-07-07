package com.changh.jeeipms.front.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.service.agency.CourseServiceI;
import com.changh.jeeipms.common.util.CookieUtils;

@Controller
@RequestMapping("/cartController")
public class CartController {
	@Autowired
	private CourseServiceI courseService;
	@Autowired
	private SystemService systemService;
	
	
	/**
	 * 获取购物车列表
	 * @param courseId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "cartList")
	public ModelAndView getCartList(String courseId,HttpServletRequest request,HttpServletResponse response){
		List<CourseEntity> list = new ArrayList<CourseEntity>();
		String courseStr =CookieUtils.getCookie(request, Globals.COURSE);
		if(!StringUtil.isEmpty(courseId)){
			if(courseStr!=null&&courseStr.indexOf(courseId)==-1){
				courseStr = courseStr==null?"":courseStr+courseId+",";
				CookieUtils.setCookie(response, Globals.COURSE, courseStr);
			}else if(StringUtil.isEmpty(courseStr)){
				CookieUtils.setCookie(response, Globals.COURSE, courseId+",");
				courseStr =courseId+",";
			}
		}
		//获得cookie里面的课程
		if(!StringUtil.isEmpty(courseStr)){
			String[] c = courseStr.split(",");
			for(String s:c){
				CourseEntity cookieCourse = courseService.getEntity(CourseEntity.class, s);
				if(StringUtil.isNotEmpty(cookieCourse)){
					list.add(cookieCourse);
				}
			}
		}
		//用map来存储机构和课程的关系
		Map<AgencyEntity, List<CourseEntity>> map = new HashMap<AgencyEntity,List<CourseEntity>>();
		String s = "";
		for(CourseEntity c:list){
			if(s.indexOf(c.getAgency().getId())!=-1){
				List<CourseEntity> list1 = map.get(c.getAgency());
				list1.add(c);
				map.put(c.getAgency(), list1);
			}else{
				List<CourseEntity> list1 = new ArrayList<CourseEntity>();
				list1.add(c);
				s+=c.getAgency().getId();
				map.put(c.getAgency(), list1);
			}
			
		}
		request.setAttribute("cart", map);
		return new ModelAndView("front/cart/cart");
	}
}
