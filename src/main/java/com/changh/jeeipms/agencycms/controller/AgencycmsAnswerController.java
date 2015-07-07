package com.changh.jeeipms.agencycms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.ask.AnswerEntity;
import com.changh.jeeipms.common.entity.ask.AskEntity;
import com.changh.jeeipms.common.service.ask.AskServiceI;
@Controller
@RequestMapping(value = "/agencycmsAnswer")
public class AgencycmsAnswerController extends BaseController {
	/**
	 * Logger for this class
	 */
	//private static final Logger logger = Logger.getLogger(AgencycmsAnswerController.class);

	@Autowired
	private AskServiceI askService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 答疑问题表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "asklist")
	public String asklist( AskEntity ask, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AskEntity> page = askService.find(new Page<AskEntity>(request, response), ask,Globals.FACE_COURSE);	
        model.addAttribute("ask", ask);
        model.addAttribute("page", page);
		return "agency/cms/askList";
	}
	/**
	 * 回复页面
	 */
	@RequestMapping(params = "addAnswer")
	public ModelAndView addAnswer(AskEntity ask,HttpServletRequest request)
	{
		String id = ask.getId();
		if(StringUtil.isNotEmpty(id))
		{
			ask = systemService.get(AskEntity.class, id);
		}
		request.setAttribute("ask", ask);
		request.setAttribute("load", request.getParameter("load"));
		return new ModelAndView("agency/cms/answer");
	}
	/**
	 * 添加回复
	 */
	@RequestMapping(params = "saveAnswer")
	public ModelAndView saveAnswer(AskEntity ask,HttpServletRequest request)
	{
		String id = ask.getId();
		HttpSession session = ContextHolderUtils.getSession();
		if(StringUtil.isNotEmpty(id))
		{
			AskEntity ask2 = systemService.get(AskEntity.class, id);
			ask2.setStatus(Integer.valueOf(Globals.ASK_ANSWER_NOSEE));
			AnswerEntity answer = ask.getAnswerList().get(0);
			answer.setAsk(ask2);
			answer.setCreateDate(new Date());
			answer.setContent(StringEscapeUtils.unescapeHtml4(answer.getContent()));//被转义了，反转回来
			answer.setCreateBy(((AgencyEntity)session.getAttribute(Globals.AGENCY_SESSION)).getName());
			List<AnswerEntity> answerList = new ArrayList<AnswerEntity>();
			answerList.add(answer);
			ask2.setAnswerList(answerList);
			askService.saveOrUpdate(ask2);
		}
		return new ModelAndView("redirect:/agencycmsAnswer.do?asklist");
	}
}
