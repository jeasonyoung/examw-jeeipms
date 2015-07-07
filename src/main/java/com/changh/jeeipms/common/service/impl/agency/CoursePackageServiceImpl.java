package com.changh.jeeipms.common.service.impl.agency;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.CoursePackageEntity;
import com.changh.jeeipms.common.service.agency.CoursePackageServiceI;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;

@Service("coursePackageService")
@Transactional
public class CoursePackageServiceImpl extends CommonServiceImpl implements CoursePackageServiceI {

	public Page<CoursePackageEntity> find(Page<CoursePackageEntity> page,CoursePackageEntity coursePackage) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(CoursePackageEntity.class); 
		dc.createAlias("category", "category");
		dc.createAlias("agency", "agency");
		//DetachedCriteria dcpr = dc.createCriteria("category");
		AgencyEntity agency = ResourceUtil.getAgency();
		dc.add(Restrictions.eq("agency.id", agency.getId()));
		if(coursePackage.getCategory()!=null&&!StringUtil.isEmpty(coursePackage.getCategory().getId())){
			CourseCategoryEntity category = this.commonDao.getEntity(CourseCategoryEntity.class,coursePackage.getCategory().getId());
			if(null!=category){
				dc.add(Restrictions.or(
						Restrictions.eq("category.id", category.getId()),
						Restrictions.like("category.parentcategoryids", "%"+category.getId()+",%")));
			}
		}
		if(coursePackage.getProvince()!=null&&!StringUtil.isEmpty(coursePackage.getProvince().getId())){
			dc.add(Restrictions.eq("province.id", coursePackage.getProvince().getId()));
		}
		if(StringUtil.isNotEmpty(coursePackage.getPkgName())){
			dc.add(Restrictions.like("coursename","%"+coursePackage.getPkgName()+"%"));
		}
		if(StringUtil.isNotEmpty(coursePackage.getStatus())&&coursePackage.getStatus() != 4){
			dc.add(Restrictions.eq("status", coursePackage.getStatus()));
		}
		dc.addOrder(Order.asc("addtime"));
		return this.commonDao.find(page, dc);
	}
	
}