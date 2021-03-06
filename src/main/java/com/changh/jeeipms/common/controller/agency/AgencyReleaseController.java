package com.changh.jeeipms.common.controller.agency;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.agency.AgencyServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.MenuEntity;
import com.changh.jeeipms.common.entity.agency.RecourseEntity;
import com.changh.jeeipms.common.entity.agency.TeacherEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;
import com.changh.jeeipms.common.service.agency.PhotoServiceI;
import com.changh.jeeipms.common.util.FreeMarkerUtil;

@Controller
@RequestMapping("/agencyRelease")
public class AgencyReleaseController {
	@Autowired
	private AgencyServiceI agencyService;
	@Autowired
	private PhotoServiceI photoService;
	
	private String message="发布成功";
	/**
	 * 根据菜单 发布机构所有
	 * @param agency
	 * @param menu
	 * @param request
	 * @return
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	@RequestMapping(params = "release")
	@ResponseBody
	public AjaxJson release(String agencyId, String menuId,HttpServletRequest request) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		AjaxJson j = new AjaxJson();
		AgencyEntity agency = agencyService.getEntity(AgencyEntity.class, agencyId);
		MenuEntity menu = agencyService.getEntity(MenuEntity.class, menuId);
		if(!agency.getStatus().equalsIgnoreCase(Globals.AGENCY__SUCCESS)){
			j.setMsg("发布失败,请先审核核");
			j.setSuccess(false);
			return j;
		}else{
			Class<?> c = this.getClass(); 
			Method m1 = c.getDeclaredMethod(menu.getEnname(),String.class,HttpServletRequest.class); 
			return (AjaxJson) m1.invoke(this, agencyId,request);		
		}	
	}
	/**
	 * 获得机构导航栏菜单
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "menu")
	public ModelAndView menuList(String id,HttpServletRequest request){
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where 1=1 order by m.menuorder asc");
		request.setAttribute("menuList", menuList);
		request.setAttribute("agencyid", id);
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyrelease");
	}
	
	/**
	 * 发布机构简介页面
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "agencyInfo")
	@ResponseBody
	public AjaxJson agencyInfo(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		AgencyUserEntity user = (AgencyUserEntity) agencyService.findUniqueByProperty(AgencyUserEntity.class, "ape.id",agencyId);
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' or m.parentmenu='' order by m.menuorder asc");
		root.put("menuList", menuList);
		//机构信息
		root.put("user", user);
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));
		//课程信息
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/agency/agencyInfo.ftl", root, genFilePath, "agencyInfo.html");
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	}
	
	/**
	 * 发布机构资源
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "recourseList")
	@ResponseBody
	public AjaxJson recourseList(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' order by m.menuorder asc");
		root.put("menuList", menuList);
		//机构信息
		root.put("agency", getAgency(agencyId));
		//课程信息
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		List<RecourseEntity> list = getRecourseList(agencyId);
		root.put("recourseList", getRecourseList(agencyId,15));
		FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/agency/recourseList.ftl", root, genFilePath, "recourseList.html");
		//移除
		root.remove("recourseList");
		if(list!=null&&list.size()!=0){
			for(RecourseEntity r:list){
				root.put("recourse", r);
				FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
						"/agency/recourse.ftl", root, genFilePath, "recourse_"+r.getId()+".html");
			}
		}
		j.setMsg(message);
		j.setSuccess(true);
		return j;
	}
	
	/**
	 * 机构相册
	 * @param agencyId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "photoAlbum")
	@ResponseBody
	public AjaxJson photoAlbum(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' order by m.menuorder asc");
		root.put("menuList", menuList);
		root.put("agency", getAgency(agencyId));
		//课程信息
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		root.put("list", photoService.findHql("from PhotoEntity p where p.agency.id=?", agencyId));
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/agency/photo.ftl", root, genFilePath, "photoAlbum.html");
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	}
	/**
	 * 联系我们
	 * @param agencyId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "contact")
	@ResponseBody
	public AjaxJson contact(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' order by m.menuorder asc");
		root.put("menuList", menuList);
		//课程信息
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		//机构信息
		root.put("agency", getAgency(agencyId));
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/agency/contact.ftl", root, genFilePath, "contact.html");
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	}
	
	
	/**
	 * 发布老师列表页面
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "teacherList")
	@ResponseBody
	public AjaxJson teacherList(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' order by m.menuorder asc");
		root.put("menuList", menuList);
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));
		//老师List
		List<TeacherEntity> teacherList = getTeacherList(agencyId, "teacherorder", "asc");
		root.put("teacherList", teacherList);
		for(TeacherEntity t:teacherList){
			Map<String, Object> teacherroot = new HashMap<String, Object>();
			teacherroot.put("agency", getAgency(agencyId));
			teacherroot.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
			teacherroot.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
			teacherroot.put("menuList", menuList);
			teacherroot.put("teacher", t);
			//机构新闻
			teacherroot.put("recourseList", getRecourseList(agencyId,6));
			teacherroot.put("hotList", getCourseList(agencyId, 12,"courseorder","asc"));
			FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
					"/agency/teacher.ftl", teacherroot, genFilePath, "teacher_"+t.getId()+".html");
		}
		root.put("agency", getAgency(agencyId));
		//课程信息
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/teacherList.ftl", root, genFilePath, "teacherList.html");
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	}
	
	
	/**
	 * 发布机构首页
	 * @param agencyId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "agencyIndex")
	@ResponseBody
	public AjaxJson index(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' order by m.menuorder asc");
		root.put("recourseList", getRecourseList(agencyId,6));
		root.put("menuList", menuList);
		//机构信息	
		root.put("agency", getAgency(agencyId));
		//课程信息
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		//推荐课程 取前四个
		root.put("hotList", getCourseList(agencyId, 4,"courseorder","asc"));
		//最新课程 前四个
		root.put("lastList", getCourseList(agencyId, 4,"addtime","desc"));
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/agency/index.ftl", root, genFilePath, "index.html");
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	}
	
	/**
	 * 面授课程页面
	 * @param agencyId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "faceList")
	@ResponseBody
	public AjaxJson faceList(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		AgencyUserEntity user = (AgencyUserEntity) agencyService.findUniqueByProperty(AgencyUserEntity.class, "ape.id",agencyId);
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		root.put("menuList",getMenuList());
		//课程分类
		String[] id = user.getApe().getCategory().split(",");
		List<CourseCategoryEntity> categoryList = getCategoryList(id,agencyId,Globals.FACE_COURSE);
		
		root.put("categoryList",categoryList);
		//机构信息
		root.put("agency", getAgency(agencyId));
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));
		//默认课程
		root.put("courseList", agencyService.findHql("from CourseEntity c where  c.agency.id='"+agencyId+"' and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+Globals.FACE_COURSE+"' order by courseorder asc", 1, 10, (Object[])null));
		
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/agency/faceList.ftl", root, genFilePath, "faceList.html");
		//发布机构的所有课程 按分类
		for(int i=0;i<categoryList.size();i++){
			 List<CourseEntity> courseList = getCourseListByCategory(agencyId,categoryList.get(i).getId(),Globals.FACE_COURSE);
			 root.put("courseList",courseList);
			 root.put("category", categoryList.get(i));
			 for(CourseEntity course:courseList){
				 Map<String, Object> courseroot = new HashMap<String, Object>();
				 courseroot.put("agency", getAgency(agencyId));
				 //导航栏菜单 
				 courseroot.put("menuList",getMenuList());
				 //推荐课程
				 courseroot.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
				 courseroot.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
				 //课程详细
				 //机构新闻
				 courseroot.put("recourseList", getRecourseList(agencyId,6));
				 courseroot.put("course", course);
				 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/faceCourse.ftl", courseroot, genFilePath, "course_"+course.getId()+".html");
			 }
			 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/faceList.ftl", root, genFilePath, "faceList_"+categoryList.get(i).getId()+".html");
			 List<CourseCategoryEntity> c = categoryList.get(i).getChildcategory();
			 if(c!=null&&c.size()!=0){
				 //循环发布子类别的所有课程
				 for(CourseCategoryEntity child:c){
					 //循环发布考试类别下面的所有课程详细介绍
					 root.put("courseList", getCourseListByCategory(agencyId,child.getId(),Globals.FACE_COURSE));
					 root.put("category", child);
					 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/faceList.ftl", root, genFilePath, "faceList_"+child.getId()+".html");
				 }
			 }
			 
		}
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	
	}
	/**
	 * 
	 * @param agencyId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "onlineList")
	@ResponseBody
	public AjaxJson onlineList(String agencyId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		AgencyUserEntity user = (AgencyUserEntity) agencyService.findUniqueByProperty(AgencyUserEntity.class, "ape.id",agencyId);
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		root.put("menuList",getMenuList());
		//课程分类
		String[] id = user.getApe().getCategory().split(",");
		List<CourseCategoryEntity> categoryList = getCategoryList(id,agencyId,Globals.ONLINE_COURSE);	
		root.put("categoryList",categoryList);
		root.put("agency", getAgency(agencyId));
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));	
		root.put("courseList", agencyService.findHql("from CourseEntity c where  c.agency.id='"+agencyId+"' and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+Globals.ONLINE_COURSE+"' order by courseorder asc", 1, 10, (Object[])null));
		List<ProvinceEntity> plist3= getProvinceList(agencyId, Globals.ONLINE_COURSE, "");
		root.put("plist", plist3);
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineList.ftl", root, genFilePath, "onlineList.html");
		if(plist3!=null){
			 for(ProvinceEntity p:plist3){
				 root.put("province", p);
				 root.put("courseList", agencyService.findHql("from CourseEntity c where  c.agency.id='"+agencyId+"'and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+Globals.ONLINE_COURSE+"' and c.province.id='"+p.getId()+"'"));
				 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineList.ftl", root, genFilePath, "onlineList_0_"+p.getId()+".html");
			 }
		}
		//发布机构的所有课程 按分类
		for(int i=0;i<categoryList.size();i++){
			 List<CourseEntity> courseList = getCourseListByCategory(agencyId,categoryList.get(i).getId(),Globals.ONLINE_COURSE);
			 root.put("courseList",courseList);
			 root.put("category", categoryList.get(i));
			 for(CourseEntity course:courseList){
				 Map<String, Object> courseroot = new HashMap<String, Object>();
				 //导航栏菜单 
				 courseroot.put("menuList",getMenuList());
				 courseroot.put("agency", getAgency(agencyId));
				 //机构新闻
				 courseroot.put("recourseList", getRecourseList(agencyId,6));
				 //推荐课程
				 courseroot.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
				 courseroot.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
				 //课程详细
				 courseroot.put("course", course);
				 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineCourse.ftl", courseroot, genFilePath, "course_"+course.getId()+".html");
			 }
			 List<ProvinceEntity> plist= getProvinceList(agencyId, Globals.ONLINE_COURSE, categoryList.get(i).getId());
			 root.put("plist", plist);
			 if(plist!=null){
				 for(ProvinceEntity p:plist){
					 root.put("province", p);
					 root.put("courseList", agencyService.findHql("from CourseEntity c where ( c.category.id='"+categoryList.get(i).getId()+"' or c.category.parentcategoryids like '%"+categoryList.get(i).getId()+",%' ) and c.agency.id='"+agencyId+"'and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+Globals.ONLINE_COURSE+"' and c.province.id='"+p.getId()+"'"));
					 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineList.ftl", root, genFilePath, "onlineList_"+categoryList.get(i).getId()+"_"+p.getId()+".html");
				 }
			 }
			 //移除上面存在的省份
			 root.remove("province");
			 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineList.ftl", root, genFilePath, "onlineList_"+categoryList.get(i).getId()+"_0.html");
			 List<CourseCategoryEntity> c = categoryList.get(i).getChildcategory();
			 if(c!=null&&c.size()!=0){
				 //循环发布子类别的所有课程
				 for(CourseCategoryEntity child:c){
					 //循环发布考试类别下面的所有课程详细介绍
					 root.put("courseList", getCourseListByCategory(agencyId,child.getId(),Globals.ONLINE_COURSE));
					 root.put("category", child);
					 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineList.ftl", root, genFilePath, "onlineList_"+child.getId()+"_0.html");
					 List<ProvinceEntity> plist1= getProvinceList(agencyId, Globals.ONLINE_COURSE, child.getId());
					 if(plist1!=null){
						 root.put("plist", plist1);
						 for(ProvinceEntity p:plist1){
							 root.put("province", p);
							 root.put("courseList", agencyService.findHql("from CourseEntity c where ( c.category.id='"+child.getId()+"' or c.category.parentcategoryids like '%"+child.getId()+",%' ) and c.agency.id='"+agencyId+"'and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+Globals.ONLINE_COURSE+"' and c.province.id='"+p.getId()+"'"));
							 FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/onlineList.ftl", root, genFilePath, "onlineList_"+child.getId()+"_"+p.getId()+".html");
						 }
					 }
				 }
			 }	 
		}
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	
	}
	
	@RequestMapping(params = "course")
	@ResponseBody
	public AjaxJson course(String courseId, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		CourseEntity course = agencyService.getEntity(CourseEntity.class, courseId);
		String agencyId = course.getAgency().getId();
		String rootPath = session.getServletContext().getRealPath("");
		String genFilePath = getFolder(agencyId, "agency");
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		root.put("menuList",getMenuList());
		//推荐课程
		root.put("faceList",getCourseList(agencyId,Globals.FACE_COURSE));
		root.put("onlineList", getCourseList(agencyId,Globals.ONLINE_COURSE));
		//课程详细
		root.put("course", course);
		//机构新闻
		root.put("recourseList", getRecourseList(agencyId,6));
		//发布静态页面
		boolean flag= FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,"/agency/faceCourse.ftl", root, genFilePath, "course_"+course.getId()+".html");
		j.setMsg(message);
		j.setSuccess(flag);
		return j;
	
	}
	
	public AjaxJson reputation(String agencyId, HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		return j;
	}
	
	
	
	/**
	 * 根据路径生成文件夹
	 * @param path
	 * @return
	 */
	private String getFolder(String agencyId,String path) {
		path =path+ "/"+StringUtil.subStrLast(agencyId, 11);
		File dir = new File(getPhysicalPath(path));
		if (!dir.exists()) {
			try {
				dir.mkdirs();
			} catch (Exception e) {
				message = "目录创建失败";
				return "";
			}
		}
		return path;
	}
	
	/**
	 * 根据传入的虚拟路径获取物理路径
	 * 
	 * @param path
	 * @return
	 */
	private static String getPhysicalPath(String path) {
		/*String servletPath = this.request.getServletPath();
		System.out.println(servletPath);*/
		String realPath = ContextHolderUtils.getSession().getServletContext().getRealPath("");
		return realPath +"/" +path;
	}
	
	/**
	 * 获取机构的类别列表
	 * @param id
	 * @param agencyid
	 * @return
	 */
	private List<CourseCategoryEntity>  getCategoryList(String[] id,String agencyid,String type){
		List<CourseCategoryEntity> categoryList = new ArrayList<CourseCategoryEntity>();
		for(String categoryid:id){
			CourseCategoryEntity c = agencyService.getEntity(CourseCategoryEntity.class, categoryid);
			//List<CourseEntity> list = agencyService.findByQueryString("from CourseEntity c where c.category.id='"+categoryid+"' or c.category.parentcategoryids like '%"+categoryid+",%' order by courseorder asc"  );
			List<CourseEntity> list =  getCourseListByCategory(agencyid,categoryid,type);
			if(list!=null&&list.size()!=0){
				List<CourseCategoryEntity> childList = new ArrayList<CourseCategoryEntity>();
				List<CourseCategoryEntity> children = getChildrenCategory(categoryid);
				if(children!=null&&children.size()!=0){
					for(CourseCategoryEntity cc:children){
						List<CourseEntity> childrenList = getCourseListByCategory(agencyid,cc.getId(),type);
						if(childrenList!=null&&childrenList.size()!=0){
							childList.add(cc);
						}
					}
					c.setChildcategory(childList);
				}
				categoryList.add(c);
			}
			
		}
		return categoryList;
	}
	
	/**
	 * 查找机构有课程的省份
	 * @param agencyId
	 * @return
	 */
	private List<ProvinceEntity> getProvinceList(String agencyId,String type,String categoryId){
		List<ProvinceEntity> list = new ArrayList<ProvinceEntity>();
		//获取全部省份
	    List<ProvinceEntity> pList = agencyService.getList(ProvinceEntity.class);
	    for(ProvinceEntity p:pList){
	    	StringBuffer hql = new StringBuffer();
	    	hql.append("from CourseEntity c where ");
	    	if(!StringUtil.isEmpty(categoryId)){
	    		hql.append("( c.category.id='"+categoryId+"' or c.category.parentcategoryids like '%"+categoryId+",%' ) and  ");
	    	}
	    	hql.append("c.agency.id='"+agencyId+"'and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+type+"' and c.province.id='"+p.getId()+"'");
	    	List<CourseEntity> list3 = agencyService.findHql(hql.toString());
	    	if(list3!=null&&list3.size()!=0){
	    		list.add(p);
	    	}
	    }
	    if(list!=null&&list.size()!=0){
	    	return list;
	    }else{
	    	return null;
	    }
	}
	//获取导航栏菜单
	private List<MenuEntity> getMenuList(){
		List<MenuEntity> menuList = agencyService.findByQueryString("from MenuEntity m where m.parentmenu is null or m.parentmenu='' order by m.menuorder asc");
		return menuList;
	}
	/**
	 * 获取该类别下面的课程
	 * @param agencyId
	 * @param categoryId
	 * @return
	 */
	private List<CourseEntity> getCourseListByCategory(String agencyId,String categoryId){
		List<CourseEntity> childrenList = agencyService.findHql("from CourseEntity c where ( c.category.id='"+categoryId+"' or c.category.parentcategoryids like '%"+categoryId+",%' ) and c.agency.id='"+agencyId+"' and c.status="+Globals.AGENCY_COURSE_SUCCESS+" order by courseorder asc");
		return childrenList;
	}
	/**
	 * 获取该类别下面的课程（按类别 面授或者视频）
	 * @param agencyId
	 * @param categoryId
	 * @return
	 */
	private List<CourseEntity> getCourseListByCategory(String agencyId,String categoryId,String type){
		List<CourseEntity> childrenList = agencyService.findHql("from CourseEntity c   Left outer join  fetch c.teacher  where ( c.category.id='"+categoryId+"' or c.category.parentcategoryids like '%"+categoryId+",%' ) and c.agency.id='"+agencyId+"' and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.coursetype = '"+type+"' order by courseorder asc");
		return childrenList;
	}
	
	/**
	 * 当前机构下面的课程（按类别 面授或者视频）
	 * @param agencyid
	 * @param type
	 * @return
	 */
	private List<CourseEntity> getCourseList(String agencyid,String type){
		List<CourseEntity> list = agencyService.findHql("from CourseEntity c where c.coursetype = '"+type+"' and c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.agency.id='"+agencyid+"'   order by courseorder asc", 1, 10, (Object[])null);
		return list;
	}
	/**
	 * 获取机构课程不分类别,按指定排序
	 * @param agencyid
	 * @param num
	 * @return
	 */
	private List<CourseEntity> getCourseList(String agencyid,int num,String row,String order){
		List<CourseEntity> list = agencyService.findHql("from CourseEntity c where  c.status="+Globals.AGENCY_COURSE_SUCCESS+" and c.agency.id='"+agencyid+"'   order by "+row+" "+order, 1, num, (Object[])null);
		return list;
	}
//	/**
//	 * 获取机构指定的老师
//	 * @param agencyId
//	 * @param num
//	 * @param row
//	 * @param order
//	 * @return
//	 */
//	private List<TeacherEntity> getTeacherList(String agencyId,int page,int num,String row,String order){
//		Object[] param = {agencyId,row,order};
//		List<TeacherEntity> list = agencyService.findHql("from TeacherEntity t where t.agencyid=? order by ? ?", page, num, param);
//		return list;
//	}
	
	private List<RecourseEntity> getRecourseList(String agencyId){
		List<RecourseEntity> list = agencyService.findHql("from RecourseEntity r where r.agency.id=? order by r.aorder desc",  agencyId);
		return list;
	}
	
	private List<RecourseEntity> getRecourseList(String agencyId,int num){
		List<RecourseEntity> list = agencyService.findHql("from RecourseEntity r where r.agency.id=? order by r.aorder desc", 1, num,new Object[]{ agencyId });
		return list;
	}
	/***
	 * 获取机构的全部老师
	 * @param agencyId
	 * @param row
	 * @param order
	 * @return
	 */
	private List<TeacherEntity> getTeacherList(String agencyId,String row,String order){
		Object[] param = {agencyId};
		List<TeacherEntity> list = agencyService.findHql("from TeacherEntity t where t.agencyid=? order by "+row+" "+order,param);
		return list;
	}
	
	/**
	 * 当前类别的所有子类别
	 * @param categoryId
	 * @return
	 */
	private List<CourseCategoryEntity> getChildrenCategory(String categoryId){
		List<CourseCategoryEntity> categoryList = agencyService.findHql("from CourseCategoryEntity c where c.category.id="+categoryId);
		return categoryList;
	}
	
	private AgencyEntity getAgency(String agencyId){
		AgencyEntity agency = agencyService.getEntity(AgencyEntity.class,agencyId);
		return agency;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
