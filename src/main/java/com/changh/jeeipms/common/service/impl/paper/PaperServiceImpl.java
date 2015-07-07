package com.changh.jeeipms.common.service.impl.paper;


import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ResourceUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.ask.AskEntity;
import com.changh.jeeipms.common.entity.paper.PaperEntity;
import com.changh.jeeipms.common.service.paper.PaperServiceI;

@Service("paperService")
@Transactional
public class PaperServiceImpl extends CommonServiceImpl implements PaperServiceI {

	//@Override
	public Page<PaperEntity> find(Page<PaperEntity> page, PaperEntity paper, String type) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(PaperEntity.class); 
		dc.createAlias("agency", "agency");
		//DetachedCriteria dcpr = dc.createCriteria("category");
		AgencyEntity agency = ResourceUtil.getAgency();
		dc.add(Restrictions.eq("agency.id", agency.getId()));
		dc.add(Restrictions.eq("coursetype",Globals.PAPER));
		page.setOrderBy("createDate desc");
		return this.commonDao.find(page, dc);
	}
	
}