package com.changh.jeeipms.agencycms.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.PhotoEntity;
import com.changh.jeeipms.common.entity.agency.RecourseEntity;
import com.changh.jeeipms.common.service.agency.RecourseServiceI;
/**   
 * @Title: Controller
 * @Description: 机构资源(机构管理后台)
 * @author failymiss
 * @date 2013-12-03 17:01:12
 * @version V1.0   
 *
 */

@Controller
@RequestMapping("/agencycmsrecourseController")
public class AgencycmsRecourseController extends BaseController {
	@Autowired
	private RecourseServiceI recourseService;

	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * 机构资源列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "recourseList")
	public String recourseList( RecourseEntity recourse, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RecourseEntity> page = recourseService.find(new Page<RecourseEntity>(request, response), recourse);	
        model.addAttribute("recourse", recourse);
        model.addAttribute("page", page);
		return "agency/cms/recourseList";
	}
	/**
	 * 机构资源列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(RecourseEntity recourse, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(recourse.getId())) {
			recourse = recourseService.getEntity(RecourseEntity.class, recourse.getId());
			req.setAttribute("recourse", recourse);
		}
		return new ModelAndView("agency/cms/recourse");
	}
	
	/**
	 * 添加机构相册
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	public String save(RecourseEntity recourse, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		
		if (StringUtil.isNotEmpty(recourse.getId())) {
			RecourseEntity t = recourseService.get(RecourseEntity.class, recourse.getId());
			try {
				message="更新成功";
				recourse.setContent(request.getParameter("myeditor"));
				MyBeanUtils.copyBeanNotNull2Bean(recourse, t);
				recourseService.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message="添加成功";
			recourse.setStatus(Globals.AGENCY_COURSE_UNTREATED);
			recourse.setContent(request.getParameter("myeditor"));
			recourse.setAddtime(new Date());
			recourse.setAgency(ResourceUtil.getAgency());
			recourseService.save(recourse);
		}
		addMessage(redirectAttributes, message );
		return "redirect:/agencycmsrecourseController.do?recourseList&repage";
	}
}
