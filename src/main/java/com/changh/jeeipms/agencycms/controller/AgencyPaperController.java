package com.changh.jeeipms.agencycms.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.paper.PaperEntity;
import com.changh.jeeipms.common.service.paper.PaperServiceI;
import com.changh.jeeipms.common.util.StringUtils;

@Controller
@RequestMapping("/agencycmsPaper")
public class AgencyPaperController  extends BaseController{
	@Autowired
	private PaperServiceI  paperService;
	
	
	@RequestMapping(params = "paperList")
	public String paperList( PaperEntity course, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PaperEntity> page = paperService.find(new Page<PaperEntity>(request, response), course,Globals.FACE_COURSE);	
        model.addAttribute("course", course);
        model.addAttribute("page", page);
		return "agency/cms/paperList";
	}
	
	/**
	 * 单个页面
	 */
	@RequestMapping(params = "addOrUpdate")
	public ModelAndView addOrUpdate(PaperEntity paper,HttpServletRequest request)
	{
		String id = paper.getId();
		if(StringUtil.isNotEmpty(id))
		{
			paper = paperService.get(PaperEntity.class, id);
		}
		request.setAttribute("paper", paper);
		request.setAttribute("load", request.getParameter("load"));
		return new ModelAndView("agency/cms/paper");
	}
	/**
	 * 添加试卷
	 */
	@RequestMapping(params = "savePaper")
	public ModelAndView saveAnswer(PaperEntity paper,HttpServletRequest req,RedirectAttributes redirectAttributes)
	{
		String id = paper.getId();
		HttpSession session = ContextHolderUtils.getSession();
		if (StringUtil.isNotEmpty(paper.getId())) {
			PaperEntity c = paperService.getEntity(PaperEntity.class, id);
			try {
				c.setPaperDescr(req.getParameter("myeditor"));
				MyBeanUtils.copyBeanNotNull2Bean(paper, c);
				c.setOldPrice(c.getPaperPrice());
				c.setUpdateDate(new Date()); 
				//设置状态未审核，需要重新审核
				c.setStatus(0);
				paperService.saveOrUpdate(c);	
				addMessage(redirectAttributes, "修改试卷'" + StringUtils.abbr(c.getPaperName(),18) + "'成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
			req.setAttribute("paper", paper);
		}else{
			paper.setPaperDescr(req.getParameter("myeditor"));
			paper.setCreateDate(new Date());
			paper.setOldPrice(paper.getPaperPrice());
			paper.setAgency(ResourceUtil.getAgency());
			paper.setStatus(Globals.AGENCY_COURSE_UNTREATED);
			paperService.save(paper);
			addMessage(redirectAttributes, "添加试卷'" + StringUtils.abbr(paper.getPaperName(),18) + "'成功");
		}
		return new ModelAndView("redirect:/agencycmsPaper.do?paperList");
	}
}
