package com.changh.jeeipms.cms.controller.order;
import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.common.SessionInfo;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.IPUtil;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.entity.order.TradeEntity;
import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.cms.service.order.TradeServiceI;
import com.changh.jeeipms.common.entity.student.StudentEntity;

/**   
 * @Title: Controller
 * @Description: 账户明细
 * @author failymiss
 * @date 2013-11-18 14:56:34
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/systradeController")
public class TradeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TradeController.class);

	@Autowired
	private TradeServiceI tradeService;
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
	 * 账户明细列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "trade")
	public ModelAndView trade(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/cms/order/tradeList");
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
	public void datagrid(TradeEntity trade,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(!StringUtil.isNotEmpty(dataGrid.getSort())){
			dataGrid.setSort("tradeTime");
		}
		CriteriaQuery cq = new CriteriaQuery(TradeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, trade);
		this.tradeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除账户明细
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TradeEntity trade, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		trade = systemService.getEntity(TradeEntity.class, trade.getId());
		message = "删除成功";
		tradeService.delete(trade);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加账户明细
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TradeEntity trade, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		SessionInfo sessioninfo = (SessionInfo) session.getAttribute(Globals.USER_SESSION);
		if(trade.getIncome().intValue()<0){
			trade.setOutlay(trade.getIncome().abs());
			trade.setIncome(new BigDecimal(0));
		}else{
			trade.setOutlay(new BigDecimal(0));
		}
		if (StringUtil.isNotEmpty(trade.getId())) {
			message = "更新成功";
			TradeEntity t = tradeService.get(TradeEntity.class, trade.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(trade, t);
				tradeService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			StudentEntity stu = tradeService.getEntity(StudentEntity.class,trade.getStudent().getId());
			//2014.04.30 解决空指针
			if(stu.getCash()==null) stu.setCash(new BigDecimal(0));
			if(stu.getStudycard()==null) stu.setStudycard(new BigDecimal(0));
			//2014.04.30 解决空指针
			if(trade.getTradeCurrency()==Globals.TRADECARD){
				stu.setCash(stu.getCash().add(trade.getIncome()).add(trade.getOutlay().negate()));
				trade.setCardBalance((stu.getStudycard()));
				trade.setCashBalance((stu.getCash()));
			}else{
				stu.setStudycard(stu.getStudycard().add(trade.getIncome()).add(trade.getOutlay().negate()));
				trade.setCardBalance((stu.getStudycard()));
				trade.setCashBalance((stu.getCash()));
			}
			trade.setTradeTime(new Date());
			trade.setTradeIp(IPUtil.getIpAddr(request));
			trade.setTradeContent(trade.getTradeContent()+"==>操作者："+sessioninfo.getUser().getUserName());
			systemService.updateEntitie(stu);
			tradeService.save(trade);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 账户明细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TradeEntity trade, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(trade.getId())) {
			trade = tradeService.getEntity(TradeEntity.class, trade.getId());
			req.setAttribute("tradePage", trade);
		}
		return new ModelAndView("com/changh/jeeipms/cms/order/trade");
	}
}
