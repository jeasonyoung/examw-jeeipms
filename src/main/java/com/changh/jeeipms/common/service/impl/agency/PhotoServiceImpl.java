package com.changh.jeeipms.common.service.impl.agency;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.PhotoEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;
import com.changh.jeeipms.common.service.agency.PhotoServiceI;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;

@Service("photoService")
@Transactional
public class PhotoServiceImpl extends CommonServiceImpl implements PhotoServiceI {
	//@Override
	public Page<PhotoEntity> find(Page<PhotoEntity> page, PhotoEntity photo) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(PhotoEntity.class); 
		/*dc.createAlias("category", "category");
		dc.createAlias("agency", "agency");*/
		//DetachedCriteria dcpr = dc.createCriteria("category");
		AgencyEntity agency = ResourceUtil.getAgency();
		dc.add(Restrictions.eq("agency.id", agency.getId()));
		if(StringUtil.isNotEmpty(photo.getTitle())){
			dc.add(Restrictions.like("title","%"+photo.getTitle()+"%"));
		}
		dc.addOrder(Order.asc("addtime"));
		return this.commonDao.find(page, dc);
	}

	//@Override
	public FrontPage<PhotoEntity> getPhotoList(String agencyId, FrontPage<PhotoEntity> page) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(PhotoEntity.class); 
		/*dc.createAlias("category", "category");
		dc.createAlias("agency", "agency");*/
		//DetachedCriteria dcpr = dc.createCriteria("category");
		dc.add(Restrictions.eq("agency.id", agencyId));
		return this.commonDao.find(page, dc);
	}

}