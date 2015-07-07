package com.changh.jeeipms.common.service.impl.agency;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.PhotoEntity;
import com.changh.jeeipms.common.entity.agency.RecourseEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;
import com.changh.jeeipms.common.service.agency.RecourseServiceI;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;

@Service("recourseService")
@Transactional
public class RecourseServiceImpl extends CommonServiceImpl implements RecourseServiceI {

	//@Override
	public Page<RecourseEntity> find(Page<RecourseEntity> page, RecourseEntity recourse) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(RecourseEntity.class); 
		/*dc.createAlias("category", "category");
		dc.createAlias("agency", "agency");*/
		//DetachedCriteria dcpr = dc.createCriteria("category");
		AgencyEntity agency = ResourceUtil.getAgency();
		dc.add(Restrictions.eq("agency.id", agency.getId()));
		if(StringUtil.isNotEmpty(recourse.getTitle())){
			dc.add(Restrictions.like("title","%"+recourse.getTitle()+"%"));
		}
		dc.addOrder(Order.desc("aorder"));
		return this.commonDao.find(page, dc);
	}

	//@Override
	public FrontPage<RecourseEntity> getRecourseList(String agencyId, FrontPage<RecourseEntity> page) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(RecourseEntity.class); 
		/*dc.createAlias("category", "category");
		dc.createAlias("agency", "agency");*/
		//DetachedCriteria dcpr = dc.createCriteria("category");
		dc.add(Restrictions.eq("agency.id", agencyId));
		return this.commonDao.find(page, dc);
	}
	
}