package com.changh.jeeipms.cms.controller.card;
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
import com.changh.jeeipms.common.entity.card.CardRecordEntity;
import com.changh.jeeipms.common.service.card.CardRecordServiceI;

/**   
 * @Title: Controller
 * @Description: 学习卡流水
 * @author failymiss
 * @date 2013-10-14 13:45:33
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/syscardRecordController")
public class CardRecordController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CardRecordController.class);

	@Autowired
	private CardRecordServiceI cardRecordService;
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
	 * 学习卡流水列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "cardRecord")
	public ModelAndView cardRecord(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/common/card/cardRecordList");
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
	public void datagrid(CardRecordEntity cardRecord,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CardRecordEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, cardRecord);
		this.cardRecordService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除学习卡流水
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CardRecordEntity cardRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		cardRecord = systemService.getEntity(CardRecordEntity.class, cardRecord.getId());
		message = "删除成功";
		cardRecordService.delete(cardRecord);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加学习卡流水
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CardRecordEntity cardRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(cardRecord.getId())) {
			message = "更新成功";
			CardRecordEntity t = cardRecordService.get(CardRecordEntity.class, cardRecord.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(cardRecord, t);
				cardRecordService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			cardRecordService.save(cardRecord);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 学习卡流水列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CardRecordEntity cardRecord, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(cardRecord.getId())) {
			cardRecord = cardRecordService.getEntity(CardRecordEntity.class, cardRecord.getId());
			req.setAttribute("cardRecordPage", cardRecord);
		}
		return new ModelAndView("com/changh/jeeipms/common/card/cardRecord");
	}
}
