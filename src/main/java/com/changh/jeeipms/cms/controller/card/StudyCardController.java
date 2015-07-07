package com.changh.jeeipms.cms.controller.card;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.card.StudyCardEntity;
import com.changh.jeeipms.common.service.card.StudyCardServiceI;
import com.changh.jeeipms.common.util.OverdueDateUtil;
import com.changh.jeeipms.common.util.PasswordCreaterUtil;

/**   
 * @Title: Controller
 * @Description: 学习卡管理
 * @author failymiss
 * @date 2013-10-13 14:51:36
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/sysstudyCardController")
public class StudyCardController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(StudyCardController.class);

	@Autowired
	private StudyCardServiceI studyCardService;
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
	 * 学习卡管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "studyCard")
	public ModelAndView studyCard(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/card/studyCardList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(StudyCardEntity studyCard,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(StudyCardEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, studyCard);
		this.studyCardService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除学习卡管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(StudyCardEntity studyCard, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		studyCard = systemService.getEntity(StudyCardEntity.class, studyCard.getId());
		message = "删除成功";
		studyCardService.delete(studyCard);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加学习卡管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(StudyCardEntity studyCard, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(studyCard.getId())) {
			message = "更新成功";
			StudyCardEntity t = studyCardService.get(StudyCardEntity.class, studyCard.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(studyCard, t);
				studyCardService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			studyCardService.save(studyCard);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 学习卡管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(StudyCardEntity studyCard, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(studyCard.getId())) {
			studyCard = studyCardService.getEntity(StudyCardEntity.class, studyCard.getId());
			req.setAttribute("studyCardPage", studyCard);
		}
		return new ModelAndView("com/changh/jeeipms/common/card/studyCard");
	}
	
	/**
	 * 学习卡批量添加跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "batch")
	public ModelAndView batch(HttpServletRequest req) {
		return new ModelAndView("com/changh/jeeipms/common/card/batchadd");
	}
	
	/**
	 * 批量生成学习卡
	 * @param studyCard
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "batchadd")
	@ResponseBody
	public AjaxJson batchadd(HttpServletRequest req) {
		AjaxJson j = new AjaxJson();
		Integer num = Integer.parseInt(req.getParameter("number"));
		Integer expiration = Integer.parseInt(req.getParameter("expiration"));
		BigDecimal cardvalue =new BigDecimal(req.getParameter("cardvalue")) ;
		Integer isfree =Integer.parseInt(req.getParameter("isfree"));
		int i=0;
		List<StudyCardEntity> entitys = new ArrayList<StudyCardEntity>();
		Date date = new Date();
		Date overtime =OverdueDateUtil.getOverdueDate(expiration);
		for(i=0;i<num;i++){
			StudyCardEntity card = new StudyCardEntity();
			card.setAddtime(date);
			card.setCardBalance(cardvalue);
			card.setCardValue(cardvalue);
			card.setCardPassword(PasswordCreaterUtil.createPassword(8));
			card.setIsfree(isfree);
			card.setOvertime(overtime);
			card.setCardNum(getCardNO(isfree));
			entitys.add(card);	
		}
		this.systemService.batchSave(entitys);
		return j;
	}
	
	public String getCardNO(int isfree){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMss");
		String str = format.format(date);
		Random r = new Random();
		if(isfree==0){
			return "wxsf"+str+(10000+r.nextInt(9999));
		}else{
			return "wxmf"+str+(10000+r.nextInt(9999));
		}
	}

}
