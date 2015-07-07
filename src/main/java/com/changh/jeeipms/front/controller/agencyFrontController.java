package com.changh.jeeipms.front.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.IPUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import alex.zhrenjie04.wordfilter.WordFilterUtil;

import com.changh.jeeipms.cms.service.agency.AgencyServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.agency.AgencyStudentEntity;
import com.changh.jeeipms.common.entity.agency.CommentEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.area.CityEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;
import com.changh.jeeipms.common.entity.ask.AnswerEntity;
import com.changh.jeeipms.common.entity.ask.AskEntity;
import com.changh.jeeipms.common.entity.content.FrontMenuEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;
import com.changh.jeeipms.common.entity.student.StudentEntity;
import com.changh.jeeipms.common.service.agency.CommentServiceI;
import com.changh.jeeipms.common.service.agency.CourseServiceI;
import com.changh.jeeipms.common.service.ask.AskServiceI;

@Controller
@RequestMapping("/agencyfront")
public class agencyFrontController {
	@Autowired
	private CommentServiceI commentService;
	@Autowired
	private AgencyServiceI agencyService;
	@Autowired
	private CourseServiceI courseService;
	@Autowired
	private AskServiceI askService;
	
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	@RequestMapping(params = "searchCourse")
	public ModelAndView searchCourse(CourseEntity course,HttpServletRequest request){
		//System.out.println(course.getCity().toString());
		if(!StringUtil.isNotEmpty(course.getCoursetype())){
			course.setCoursetype("all");
		}
		if(!StringUtil.isNotEmpty(course.getCategory().getId())){
			course.getCategory().setId("0");
		}
		if(!StringUtil.isNotEmpty(course.getCity().getFatherId())){
			course.getCity().setFatherId(0);
		}
		FrontPage<CourseEntity> page = courseService.getCourseList(course, new FrontPage<CourseEntity>(request,"courseorder asc"));
		request.setAttribute("page", page);
		request.setAttribute("course", course);
		//导航栏菜单 
		List<FrontMenuEntity> menuList = getFrontMenuList();
		request.setAttribute("menuList", menuList);
		//获取当前类别的子类别
		List<CityEntity> listcity = courseService.findByProperty(CityEntity.class, "fatherId", course.getCity().getFatherId());
		request.setAttribute("cityList", listcity);
		//省份
		List<ProvinceEntity> list = courseService.loadAll(ProvinceEntity.class);
		ProvinceEntity p = new ProvinceEntity();
		p.setProvince("全国");
		p.setId("0");
		p.setProvinceId(0);
		List<ProvinceEntity> list1 = new ArrayList<ProvinceEntity>();
		list1.add(p);
		list1.addAll(list);
		request.setAttribute("provinceList", list1);
		//种类
		request.setAttribute("categoryList", getCourseCategoryList());
		return new ModelAndView("front/course");
	}
	
	@RequestMapping(params = "searchAgency")
	public ModelAndView searchAgency(AgencyParameterEntity agency,HttpServletRequest request){	
		FrontPage<AgencyParameterEntity> page = agencyService.getAgencyList(agency,new FrontPage<AgencyParameterEntity>(request,"recommend asc" ));
		request.setAttribute("page", page);	
		request.setAttribute("agency", agency);
		if(StringUtil.isEmpty(agency.getProvince().getProvince())){
			ProvinceEntity p = new ProvinceEntity();
			p.setProvince("全国");
			p.setId("0");
			p.setProvinceId(0);
			agency.setProvince(p);
		}
		if(StringUtil.isEmpty(agency.getCategory())){
			agency.setCategory("0");
		}
		//导航栏菜单 
		List<FrontMenuEntity> menuList = getFrontMenuList();
		request.setAttribute("menuList", menuList);
		//省份
		List<ProvinceEntity> list = courseService.loadAll(ProvinceEntity.class);
		ProvinceEntity p = new ProvinceEntity();
		p.setProvince("全国");
		p.setId("0");
		p.setProvinceId(0);
		List<ProvinceEntity> list1 = new ArrayList<ProvinceEntity>();
		list1.add(p);
		list1.addAll(list);
		System.out.println(list1.size());
		request.setAttribute("provinceList", list1);
		//种类
		request.setAttribute("categoryList", getCourseCategoryList());
		return new ModelAndView("front/agencyList");
	}
	
	@RequestMapping(params = "courseList")
	@ResponseBody
	public List<CourseEntity> courseList(){
		List<CourseEntity>	list = commentService.findHql("from CourseEntity c where c.city is null ");
		System.out.println(list.size());
		return list;
	}
	
	/**
	 * @param page
	 * @param pagesize
	 * @param courseId
	 * @return
	 */
	@RequestMapping(params = "commentList")
	@ResponseBody
	public Map<String, Object> commentList(int page,int pagesize ,String courseid){
		Map<String, Object> map = new HashMap<String, Object>();
		Object[] param = {courseid};
		List<CommentEntity>	commentList = commentService.findHql("from CommentEntity c where c.courseid =? order by c.coursescore desc,c.addtime desc", page, pagesize, param);
		int count = commentService.findHql(" from CommentEntity c where c.courseid =? ",param).size();
		map.put("page", page);
		map.put("pagesize", pagesize);
		map.put("comment", commentList);
		map.put("count", count);
		return map;
	}
	
	/**
	 * 添加课程评论
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CommentEntity comment, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		comment.setContent(WordFilterUtil.filterText(comment.getContent(), '*').getFilteredContent());
		comment.setAddtime(new Date());
		comment.setIp(IPUtil.getIpAddr(request));
		comment.setStatus(0);
		comment.setStuname("考试网友");
		commentService.save(comment);
		return j;
	}
	
	@RequestMapping(params = "player")
	@ResponseBody
	public String playerUrl(){
		Map<String, Object> map = new HashMap<String, Object>();
		return "2013yjgcjjjjst.flv";
	}
	
	/**
	 * 咨询学员添加
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "savestu")
	public String savestu(AgencyStudentEntity stu, HttpServletRequest request) {
		stu.setAddtime(new Date());
		stu.setStatus((int)Globals.AGENCY_STUDENT_UNTREATED);
		agencyService.save(stu);
		return "/jeeipms/agency/bf9e01407fc2f5320000/index.html";
	}
	
	/**
	 * 获取导航栏菜单，按推荐排序
	 * @return
	 */
	public List<FrontMenuEntity> getFrontMenuList(){
		List<FrontMenuEntity> list = courseService.getListByOrder(FrontMenuEntity.class, "", "", "menuorder", true, "");
		return list;
	}
	
	/**
	 * 获取课程分类
	 * @return
	 */
	public List<CourseCategoryEntity> getCourseCategoryList(){
		List<CourseCategoryEntity> list =courseService.getListByOrder(CourseCategoryEntity.class, "category", "", "categoryorder", true, "ISNULL");	
		CourseCategoryEntity c = new CourseCategoryEntity();
		c.setCategoryname("全部");
		c.setId("0");
		List<CourseCategoryEntity> cate = new ArrayList<CourseCategoryEntity>();
		cate.add(c);
		cate.addAll(list);
		return cate;
	}
	/**
	 * 答疑添加
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "saveAsk")
	public ModelAndView saveAsk(AskEntity ask, HttpServletRequest request) {
		ask.setCreateDate(new Date());
		ask.setStatus(Integer.valueOf(Globals.ASK_ANSWER_NO));
		HttpSession session = ContextHolderUtils.getSession();
		ask.setStudent((StudentEntity) session.getAttribute("student"));
		askService.save(ask);
		return new ModelAndView("redirect:/cstudyRecordController.do?getAsk&page=1");
	}
	//asklist
	@RequestMapping(params = "askList")
	public void askList(HttpServletRequest request,HttpServletResponse response)
	{
		String pageS = request.getParameter("page");
		String status = request.getParameter("status");
		String agencyId = request.getParameter("agencyId");
		String countSql = "select count(*) from f_ask where agency_id = '"+agencyId+"'";
		String hql = "from AskEntity a where a.parent is null and a.agency.id = ?";
		if("unanswered".equals(status))
		{
			countSql = countSql + " and status = "+Globals.ASK_ANSWER_NO;
			hql = hql + " and a.status = "+Globals.ASK_ANSWER_NO;
		}else if("answered".equals(status))
		{
			countSql = countSql + " and status != "+Globals.ASK_ANSWER_NO;
			hql = hql + " and a.status != "+Globals.ASK_ANSWER_NO;
		}
		hql = hql + " order by a.createDate desc";
		Long count = askService.getCountForJdbc(countSql);
		long pageCount = count%10==0?count%10:count/10+1;
		int page = 1;
		try{ page = Integer.parseInt(pageS);}catch(Exception e){}
		List<AskEntity> list = askService.findHql(hql, page, 10, new Object[]{ agencyId });
		StringBuffer jsonTemp = new StringBuffer();
		jsonTemp.append("{\"total\":").append(count).append(",\"list\":[ ");
		for(AskEntity ask:list)
		{
			String s = Globals.ASK_STUDY.equals(ask.getType())?"学习答疑":"课程咨询";
			jsonTemp.append("{\"username\":\"").append(ask.getStudent().getUsername()).append("\",")
			.append("\"content\":\"").append(ask.getContent()).append("\",")
			.append("\"createDate\":\"").append(ask.getCreateDate()).append("\",")
			.append("\"imgurl\":\"").append(ask.getStudent().getImageurl()).append("\",")
			.append("\"type\":\"").append(s).append("\",")
			.append("\"replyList\":[");
			for(AnswerEntity reply:ask.getAnswerList())
			{
				jsonTemp.append("{\"answer\":\"").append(reply.getContent()).append("\",")
				.append("\"addtime\":\"").append(reply.getCreateDate()).append("\",")
				.append("\"createBy\":\"").append(reply.getCreateBy()).append("\"}");
			}
			jsonTemp.append("]},");
		}
		jsonTemp.deleteCharAt(jsonTemp.length()-1);
		jsonTemp.append("],\"agencyId\":\"").append(agencyId).append("\",\"pagecount\":\"").append(pageCount).append("\"}");
		response.setContentType("application/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-store");
		try {
			PrintWriter pw=response.getWriter();
			pw.write(jsonTemp.toString());
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
