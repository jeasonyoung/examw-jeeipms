package com.changh.jeeipms.front.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.VideoEntity;
import com.changh.jeeipms.common.entity.order.CourseItemEntity;
import com.changh.jeeipms.common.entity.student.NoteEntity;
import com.changh.jeeipms.common.entity.student.ScStudentEntity;
import com.changh.jeeipms.common.entity.student.StudentEntity;
import com.changh.jeeipms.common.service.agency.CourseServiceI;

/**
 * 网络课堂 controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/classController")
public class ClassController {
	
	@Autowired
	private CourseServiceI courseService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * 听课controller
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping(params = "class")
	public ModelAndView getCourse(HttpServletRequest request,String courseId) throws Exception{
		//VideoEntity v = new VideoEntity();
		StudentEntity stu =	ResourceUtil.getStudent();
		HttpSession session = ContextHolderUtils.getSession();
		List<String> list = (List<String>) session.getAttribute("listC");
		if(list==null||list.size()==0){
		list = new ArrayList<String>();
		List<CourseItemEntity>	list1 = courseService.findHql("from CourseItemEntity c where c.order.orderStatus="+Globals.ORDER_PAY_SUCCESS+" and c.order.student.id='"+stu.getId()+"' order by c.order.orderPaytime desc");
			for(CourseItemEntity item:list1){
				 list.add(item.getCourse().getId());
				 System.out.println(item.getCourse().getId());
			 }
			 session.setAttribute("listC", list);
		}
		if(StringUtil.isNotEmpty(courseId)&&list.contains(courseId)&&StringUtil.isNotEmpty(stu)){
			
			CourseEntity c = courseService.getEntity(CourseEntity.class, courseId);
			if(StringUtil.isNotEmpty(c.getSchool())){
				Object[] pro={stu.getId(),c.getSchool().getId()};
				ScStudentEntity scs = (ScStudentEntity) courseService.findHql("from ScStudentEntity scs where scs.stuId =? and scs.schId=?",pro ).get(0);
				return new ModelAndView("redirect:"+c.getSchool().getScUrl()+"?username="+scs.getUsername()+"&password="+scs.getPassword());
			}else{
				request.setAttribute("course", c);
				return new ModelAndView("front/class");
			}
		}else{
			return new ModelAndView("/");
		}
		
	}
	/**
	 * json 返回笔记
	 * @param request
	 * @param classId
	 * @return
	 */
	@RequestMapping(params = "noteList")
	@ResponseBody
	public List<NoteEntity> getNoteList(HttpServletRequest request,String videoId){
		StudentEntity student =	ResourceUtil.getStudent();
		Object[] param = {videoId,student.getId()};
		List<NoteEntity> note = courseService.findHql("from NoteEntity n where n.video.id =? and n.student.id=? order by notetime desc ", param);
		return note;
	}
	
	/**
	 * 删除笔记
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(params ="deleteNote")
	@ResponseBody
	public AjaxJson deleteNote(HttpServletRequest request,String id){
		AjaxJson j = new AjaxJson();
		NoteEntity note = courseService.getEntity(NoteEntity.class, id);
		courseService.delete(note);
		return j;
	}
	
	/**
	 * 添加笔记
	 * @param note
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(NoteEntity note, HttpServletRequest request) {
		StudentEntity student =	ResourceUtil.getStudent();
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(note.getId())) {
			message = "更新成功";
			NoteEntity t = courseService.get(NoteEntity.class, note.getId());
			t.setContent(note.getContent());
			courseService.saveOrUpdate(t);
		} else {
			message = "添加成功";	
			note.setNotetime(new Date());
			note.setStudent(student);
			courseService.save(note);
		}
		
		return j;
	}
	
}
