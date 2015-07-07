package com.changh.jeeipms.common.controller.content;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.changh.jeeipms.cms.entity.core.LinkListEntity;
import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.agency.AgencyServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.area.CityEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;
import com.changh.jeeipms.common.entity.content.FrontMenuEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;
import com.changh.jeeipms.common.entity.exam.ExamCategoryEntity;
import com.changh.jeeipms.common.entity.ksbd.KSBDEntity;
import com.changh.jeeipms.common.service.agency.CourseServiceI;
import com.changh.jeeipms.common.util.FreeMarkerUtil;

@Controller
@RequestMapping("/contentRelease")
public class FrontReleaseContronller {

	@Autowired
	private SystemService systemService;
	@Autowired
	private CourseServiceI courseService;
	@Autowired
	private AgencyServiceI agencyService;

	/**
	 * 发布导航页
	 * 
	 * @param menu
	 * @param rq
	 * @return
	 */
	@RequestMapping(params = "release")
	@ResponseBody
	public AjaxJson release(FrontMenuEntity menu, HttpServletRequest rq) {
		AjaxJson j = new AjaxJson();
		menu = systemService.getEntity(FrontMenuEntity.class, menu.getId());
		if (menu.getEnname().equalsIgnoreCase("index")) {
			index(rq, menu);
		}
		if (menu.getEnname().equalsIgnoreCase("course")) {
			releaseAll(rq, menu);
		}
		if (menu.getEnname().equalsIgnoreCase("agency")) {
			releaseAgency(rq, menu);
		}
		if (menu.getEnname().equalsIgnoreCase("ksbd")) {
			index(rq);
		}
		j.setMsg("发布成功");
		return j;
	}

	/**
	 * 发布首页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "index")
	@ResponseBody
	public AjaxJson index(HttpServletRequest request, FrontMenuEntity menu) {
		AjaxJson j = new AjaxJson();
		Map<String, Object> root = new HashMap<String, Object>();
		String rootPath = getPhysicalPath();
		// 友情链接
		root.put("domain", Globals.getConfig("domain"));
		root.put("linkList", getLinkList(menu.getEnname()));
		/**
		 * 2014.04.02 发布公共页面先
		 */
		FreeMarkerUtil.getInstance()
				.genHtmlFile(request, rootPath, "/common/footer_about.ftl",
						root, "common", "footer_about.html");
		FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
				"/common/footer_nav.ftl", root, "common", "footer_nav.html");
		FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
				"/common/footer_link.ftl", root, "common", "footer_link.html");
		// 导航栏菜单
		List<FrontMenuEntity> menuList = getFrontMenuList();
		root.put("menuList", menuList);
		// 课程分类
		root.put("courseCategory", getCourseCategoryList());
		// 面授课程
		root.put("faceCourse", getCourseList(Globals.FACE_COURSE));
		// 视频课程
		root.put("onlineCourse", getCourseList(Globals.ONLINE_COURSE));
		// 推荐机构
		root.put("hotAgency", getAgencyList("recommend", "asc"));
		// 最新机构
		root.put("newAgency", getAgencyList("createTime", "desc"));

		FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
				"/front/index.ftl", root, "", "index.html");
		return j;
	}

	/**
	 * 发布课程
	 * 
	 * @param areaId
	 * @param coursetype
	 * @param courseCategoryId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "course")
	@ResponseBody
	public AjaxJson course(CourseEntity course, HttpServletRequest request) {

		AjaxJson j = new AjaxJson();
		Map<String, Object> root = new HashMap<String, Object>();
		String rootPath = getPhysicalPath();

		// 导航栏菜单
		List<FrontMenuEntity> menuList = getFrontMenuList();
		root.put("menuList", menuList);
		// 课程
		root.put("page", getCourseList(course, request));
		// 当前课程
		root.put("course", course);
		// 省份
		root.put("provinceList", systemService.loadAll(ProvinceEntity.class));
		// 当前省份下面的城市
		root.put("cityList", systemService.findByProperty(CityEntity.class,
				"fatherId", course.getCity().getFatherId()));
		// 种类
		root.put("categoryList", getCourseCategoryList());
		// 当前种类的下级类别
		List<CourseCategoryEntity> category = systemService.findByProperty(
				CourseCategoryEntity.class, "category.id", course.getCategory()
						.getId());
		if (course.getCategory().getCategory() != null) {
			category = systemService.findByProperty(CourseCategoryEntity.class,
					"category.id", course.getCategory().getCategory().getId());
		}
		root.put("children", category);
		String name = getHtmlName(course);
		if (name.equalsIgnoreCase("0_all_0.html")) {
			FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
					"/front/courseList.ftl", root, "course", name);
			FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
					"/front/courseList.ftl", root, "course", "index.html");
		} else {
			FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
					"/front/courseList.ftl", root, "course", name);
		}
		return j;
	}

	/**
	 * 发布全部课程
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "releaseAll")
	@ResponseBody
	public AjaxJson releaseAll(HttpServletRequest request, FrontMenuEntity menu) {
		AjaxJson j = new AjaxJson();
		List<ProvinceEntity> plist = systemService
				.loadAll(ProvinceEntity.class);
		// 获得全部类别
		List<CourseCategoryEntity> categoryList = getCourseCategoryList();
		// --------------城市类别-------------------------

		for (ProvinceEntity p : plist) {
			List<CityEntity> cityList = systemService.findByProperty(
					CityEntity.class, "fatherId", Integer.parseInt(p.getId()));
			for (CityEntity city : cityList) {
				for (CourseCategoryEntity c : categoryList) {
					CourseEntity course = new CourseEntity();
					course.setCategory(c);
					// 类型分三种情况
					course.setCity(city);
					course(course, request);
					course.setCoursetype(Globals.FACE_COURSE);
					course(course, request);
					course.setCoursetype(Globals.ONLINE_COURSE);
					course(course, request);
					List<CourseCategoryEntity> children = systemService
							.findByProperty(CourseCategoryEntity.class,
									"category.id", c.getId());
					for (CourseCategoryEntity childC : children) {
						CourseEntity course1 = new CourseEntity();
						course1.setCategory(childC);
						// 类型分三种情况
						course1.setCity(city);
						course(course1, request);
						course1.setCoursetype(Globals.FACE_COURSE);
						course(course1, request);
						course1.setCoursetype(Globals.ONLINE_COURSE);
						course(course1, request);
					}
				}
				// 类别不存在
				CourseEntity course = new CourseEntity();
				// 类型分三种情况
				course.setCity(city);
				course(course, request);
				course.setCoursetype(Globals.FACE_COURSE);
				course(course, request);
				course.setCoursetype(Globals.ONLINE_COURSE);
				course(course, request);
			}
			// 单独省份
			CityEntity city = new CityEntity();
			city.setFatherId(p.getProvinceId());
			for (CourseCategoryEntity c : categoryList) {
				CourseEntity course = new CourseEntity();
				course.setCategory(c);
				// 类型分三种情况
				course.setCity(city);
				course(course, request);
				course.setCoursetype(Globals.FACE_COURSE);
				course(course, request);
				course.setCoursetype(Globals.ONLINE_COURSE);
				course(course, request);
				List<CourseCategoryEntity> children = systemService
						.findByProperty(CourseCategoryEntity.class,
								"category.id", c.getId());
				for (CourseCategoryEntity childC : children) {
					CourseEntity course1 = new CourseEntity();
					course1.setCategory(childC);
					// 类型分三种情况
					course1.setCity(city);
					course(course1, request);
					course1.setCoursetype(Globals.FACE_COURSE);
					course(course1, request);
					course1.setCoursetype(Globals.ONLINE_COURSE);
					course(course1, request);
				}

			}
			CourseEntity c = new CourseEntity();
			// 类型分三种情况
			c.setCity(city);
			course(c, request);
			c.setCoursetype(Globals.FACE_COURSE);
			course(c, request);
			c.setCoursetype(Globals.ONLINE_COURSE);
			course(c, request);

		}

		// ------------------城市不存在 全国----------------------
		// 类别存在
		for (CourseCategoryEntity c : categoryList) {
			CourseEntity course = new CourseEntity();
			course.setCategory(c);
			// 类型分三种情况
			course(course, request);
			course.setCoursetype(Globals.FACE_COURSE);
			course(course, request);
			course.setCoursetype(Globals.ONLINE_COURSE);
			course(course, request);
			List<CourseCategoryEntity> children = systemService.findByProperty(
					CourseCategoryEntity.class, "category.id", c.getId());
			for (CourseCategoryEntity childC : children) {
				CourseEntity course1 = new CourseEntity();
				course1.setCategory(childC);
				// 类型分三种情况
				course(course1, request);
				course1.setCoursetype(Globals.FACE_COURSE);
				course(course1, request);
				course1.setCoursetype(Globals.ONLINE_COURSE);
				course(course1, request);
			}
		}
		// 类别不存在
		CourseEntity course = new CourseEntity();
		// 类型分三种情况
		course(course, request);
		course.setCoursetype(Globals.FACE_COURSE);
		course(course, request);
		course.setCoursetype(Globals.ONLINE_COURSE);
		course(course, request);
		return j;
	}

	/**
	 * 发布机构列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "agency")
	@ResponseBody
	public AjaxJson agency(AgencyParameterEntity agency,
			HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String rootPath = getPhysicalPath();
		Map<String, Object> root = new HashMap<String, Object>();
		// 种类
		root.put("categoryList", getCourseCategoryList());
		// 导航栏菜单
		List<FrontMenuEntity> menuList = getFrontMenuList();
		root.put("agency", agency);
		root.put("menuList", menuList);
		// 省份
		root.put("provinceList", systemService.loadAll(ProvinceEntity.class));
		// 机构page
		root.put("page", getAgency(agency, request));
		/**
		 * 2014.04.02修改
		 */
		String domain = Globals.getConfig("domain");
		root.put("domain", domain); //主域名
		root.put("domainS", domain.substring(domain.indexOf("."), domain.length()));//主机带点
		String name = getAgencyHtmlName(agency);
		if (!name.equalsIgnoreCase("0_0.html")) {
			FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
					"/front/agencyList.ftl", root, "agency", name);
		} else {
			FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
					"/front/agencyList.ftl", root, "agency", "index.html");
			FreeMarkerUtil.getInstance().genHtmlFile(request, rootPath,
					"/front/agencyList.ftl", root, "agency", name);
		}

		return j;
	}

	/**
	 * 发布全部机构
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "agencyList")
	@ResponseBody
	public AjaxJson releaseAgency(HttpServletRequest request,
			FrontMenuEntity menu) {
		AjaxJson j = new AjaxJson();
		List<ProvinceEntity> plist = systemService
				.loadAll(ProvinceEntity.class);
		List<CourseCategoryEntity> categoryList = getCourseCategoryList();
		// 全国城市 城市不存在
		// 类别存在
		for (CourseCategoryEntity c : categoryList) {
			AgencyParameterEntity agency = new AgencyParameterEntity();
			agency.setCategory(c.getId());
			agency(agency, request);
		}
		// 全国 全类别
		AgencyParameterEntity agency = new AgencyParameterEntity();
		agency(agency, request);
		// 城市
		for (ProvinceEntity p : plist) {
			// 类别不存在
			AgencyParameterEntity agency1 = new AgencyParameterEntity();
			agency1.setProvince(p);
			agency(agency1, request);
			// 类别存在
			for (CourseCategoryEntity c : categoryList) {
				agency1.setCategory(c.getId());
				agency(agency1, request);
			}
		}
		// 全国
		return j;
	}

	@RequestMapping(params = "test")
	@ResponseBody
	public AjaxJson main(HttpServletRequest request) {
		CityEntity city = new CityEntity();
		city.setFatherId(120000);
		CourseEntity course = new CourseEntity();
		// 类型分三种情况
		course.setCity(city);
		course(course, request);
		return new AjaxJson();
	}

	/**
	 * 发布考试宝典首页
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "ksbd")
	public void index(HttpServletRequest request) {
		List<ExamCategoryEntity> list = getExamCategoryList();
		Map<String, Object> root = new HashMap<String, Object>();
		// 导航栏菜单
		root.put("list", list);
		FreeMarkerUtil.getInstance().genHtmlFile(request, getPhysicalPath(),
				"/front/index_ksbd.ftl", root, "ksbd", "index.html");

		// 发布
		for (ExamCategoryEntity exam : list) {
			exam(exam.getId(), request);
		}
	}

	public void exam(String examId, HttpServletRequest request) {
		Map<String, Object> root = new HashMap<String, Object>();
		Map<String, Object> ksroot = new HashMap<String, Object>();
		List<ExamCategoryEntity> list = getExamCategoryList();
		ExamCategoryEntity exam = systemService.getEntity(
				ExamCategoryEntity.class, examId);
		for (ExamCategoryEntity child : exam.getExamList()) {
			if (child.getKsbd().size() != 1) {
				root.put("exam", child);
				root.put("list", list);
				root.put("examList", exam.getExamList());
				root.put("ksbdlist", child.getKsbd());
				FreeMarkerUtil.getInstance().genHtmlFile(request,
						getPhysicalPath(), "/front/exam.ftl", root,
						"ksbd/" + child.getExamEname(), "index.html");
				for (KSBDEntity ksbd : child.getKsbd()) {
					ksroot.put("list", list);
					ksroot.put("ksbd", ksbd);
					FreeMarkerUtil.getInstance().genHtmlFile(request,
							getPhysicalPath(), "/front/desc_ksbd.ftl", ksroot,
							ksbd.getSavepath(), "index.html");
				}
			} else if (child.getKsbd().size() == 1) {
				ksroot.put("list", list);
				ksroot.put("ksbd", child.getKsbd().get(0));
				FreeMarkerUtil.getInstance().genHtmlFile(request,
						getPhysicalPath(), "/front/desc_ksbd.ftl", ksroot,
						child.getKsbd().get(0).getSavepath(), "index.html");
			}
		}
	}

	/**
	 * 获取考试分类
	 * 
	 * @return
	 */
	public List<ExamCategoryEntity> getExamCategoryList() {
		List<ExamCategoryEntity> list = systemService.getListByOrder(
				ExamCategoryEntity.class, "pexam.id", "0", "orderId", true,
				"EQ");
		return list;
	}

	/**
	 * 获得page对象
	 * 
	 * @param agency
	 * @param request
	 * @return
	 */
	public FrontPage<AgencyParameterEntity> getAgency(
			AgencyParameterEntity agency, HttpServletRequest request) {
		FrontPage<AgencyParameterEntity> page = agencyService.getAgencyList(
				agency, new FrontPage<AgencyParameterEntity>(request,
						"recommend asc"));
		return page;
	}

	/**
	 * 获取courseList
	 * 
	 * @param course
	 * @param request
	 * @return
	 */
	public FrontPage<CourseEntity> getCourseList(CourseEntity course,
			HttpServletRequest request) {
		FrontPage<CourseEntity> page = courseService.getCourseList(course,
				new FrontPage<CourseEntity>(request, "courseorder asc"));
		return page;
	}

	/**
	 * 获取课程列表的名字
	 * 
	 * @param areaId
	 * @param coursetype
	 * @param courseCategoryId
	 * @return
	 */
	public String getHtmlName(CourseEntity course) {
		StringBuffer s = new StringBuffer();
		if (StringUtil.isNotEmpty(course.getCity().getCityId())) {
			s.append(course.getCity().getCityId() + "_");
		} else if (StringUtil.isNotEmpty(course.getCity().getFatherId())) {
			s.append(course.getCity().getFatherId() + "_");
		} else {
			s.append("0_");
		}
		if (StringUtil.isEmpty(course.getCoursetype())) {
			s.append("all_");
		} else {
			s.append(course.getCoursetype() + "_");
		}
		if (StringUtil.isNotEmpty(course.getCategory().getId())) {
			s.append(course.getCategory().getId() + ".html");
		} else {
			s.append("0.html");
		}
		return s.toString();

	}

	public String getAgencyHtmlName(AgencyEntity agency) {
		StringBuffer sb = new StringBuffer();
		if (StringUtil.isNotEmpty(agency.getProvince().getId())) {
			sb.append(agency.getProvince().getId() + "_");
		} else {
			sb.append("0_");
		}
		if (StringUtil.isNotEmpty(agency.getCategory())) {
			sb.append(agency.getCategory() + ".html");
		} else {
			sb.append("0.html");
		}
		return sb.toString();
	}

	/**
	 * 获取导航栏菜单，按推荐排序
	 * 
	 * @return
	 */
	public List<FrontMenuEntity> getFrontMenuList() {
		List<FrontMenuEntity> list = systemService.getListByOrder(
				FrontMenuEntity.class, "", "", "menuorder", true, "");
		return list;
	}

	/**
	 * 获取课程分类
	 * 
	 * @return
	 */
	public List<CourseCategoryEntity> getCourseCategoryList() {
		List<CourseCategoryEntity> list = systemService.getListByOrder(
				CourseCategoryEntity.class, "category", "", "categoryorder",
				true, "ISNULL");
		return list;
	}

	/**
	 * 找到推荐课程（面授或在视频）
	 * 
	 * @param coursetype
	 * @return
	 */
	public List<CourseEntity> getCourseList(String coursetype) {
		List<CourseEntity> list = systemService.findHql(
				"from CourseEntity c where c.coursetype= '" + coursetype
						+ "'  and c.status='" + Globals.AGENCY_COURSE_SUCCESS
						+ "' order by courseorder asc", 1, 8, (Object[])null);
		return list;
	}

	/**
	 * 排序获得前八推荐机构
	 * 
	 * @param ordername
	 * @return
	 */
	public List<AgencyParameterEntity> getAgencyList(String ordername,
			String order) {
		List<AgencyParameterEntity> agency = systemService.findHql(
				"from AgencyParameterEntity a where a.status='1' order by a."
						+ ordername + " " + order, 1, 8, (Object[])null);
		return agency;
	}

	/**
	 * 根据传入的虚拟路径获取物理路径
	 * 
	 * @param path
	 * @return
	 */
	private static String getPhysicalPath() {
		String realPath = ContextHolderUtils.getSession().getServletContext()
				.getRealPath("");
		return realPath;
	}

	/**
	 * 获取栏目的友情链接
	 * 
	 * @param str
	 * @return
	 */
	private List<LinkListEntity> getLinkList(String str) {
		List<LinkListEntity> list = systemService
				.findHql(
						"from LinkListEntity l where l.menu.enname =? order by l.orderid asc",
						str);
		return list;
	}

}
