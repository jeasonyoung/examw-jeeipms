package com.changh.jeeipms.common.service.impl.ask;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.ask.AskEntity;
import com.changh.jeeipms.common.service.ask.AskServiceI;

@Service("askService")
@Transactional
public class AskServiceImpl extends CommonServiceImpl implements AskServiceI {

	//@Override
	public Page<AskEntity> find(Page<AskEntity> page, AskEntity course, String type) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(AskEntity.class); 
		dc.createAlias("student", "student");
		//dc.createAlias("agency", "agency");
		//DetachedCriteria dcpr = dc.createCriteria("category");
		AgencyEntity agency = ResourceUtil.getAgency();
		dc.add(Restrictions.eq("agency.id", agency.getId()));
		if(course!=null&&course.getType()!=null&&course.getType()!=4)
		{
			dc.add(Restrictions.eq("type", course.getType()));
		}
		//dc.add(Restrictions.eq("coursetype",type));
		dc.addOrder(Order.asc("status"));
		page.setOrderBy("createDate desc");
		return this.commonDao.find(page, dc);
	}
}