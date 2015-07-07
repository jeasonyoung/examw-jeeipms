package com.changh.jeeipms.common.service.impl.agency;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;
import com.changh.jeeipms.common.service.agency.CourseServiceI;


@Service("courseService")
@Transactional
public class CourseServiceImpl extends CommonServiceImpl implements CourseServiceI {

	//@Override
	public Page<CourseEntity> find(Page<CourseEntity> page, CourseEntity course,String type) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(CourseEntity.class); 
		dc.createAlias("category", "category");
		dc.createAlias("agency", "agency");
		//DetachedCriteria dcpr = dc.createCriteria("category");
		AgencyEntity agency = ResourceUtil.getAgency();
		dc.add(Restrictions.eq("agency.id", agency.getId()));
		dc.add(Restrictions.eq("coursetype",type));
		if(!StringUtil.isEmpty(course.getCategory().getId())){
			CourseCategoryEntity category = this.commonDao.getEntity(CourseCategoryEntity.class,course.getCategory().getId());
			if(null!=category){
				dc.add(Restrictions.or(
						Restrictions.eq("category.id", category.getId()),
						Restrictions.like("category.parentcategoryids", "%"+category.getId()+",%")));
			}
		}
		if(!StringUtil.isEmpty(course.getProvince().getId())){
			dc.add(Restrictions.eq("province.id", course.getProvince().getId()));
		}
		if(StringUtil.isNotEmpty(course.getStatus())&&course.getStatus() != 4){
			dc.add(Restrictions.eq("status", course.getStatus()));
		}
		if(StringUtil.isNotEmpty(course.getCoursename())){
			dc.add(Restrictions.like("coursename","%"+course.getCoursename()+"%"));
		}
		dc.addOrder(Order.asc("courseorder"));
		return this.commonDao.find(page, dc);
	}

	@SuppressWarnings("deprecation")
	//@Override
	public FrontPage<CourseEntity> getCourseList(CourseEntity course,FrontPage<CourseEntity> page) {
		DetachedCriteria dc =  this.commonDao.createDetachedCriteria(CourseEntity.class); 
		if(StringUtil.isNotEmpty(course.getCategory().getId())&&!course.getCategory().getId().equalsIgnoreCase("0")){
			CourseCategoryEntity category = this.commonDao.getEntity(CourseCategoryEntity.class,course.getCategory().getId());
			if(null!=category){
				dc.createAlias("category", "category");
				dc.add(Restrictions.or(
						Restrictions.eq("category.id", category.getId()),
						Restrictions.like("category.parentcategoryids", "%"+category.getId()+",%")));
			}
		}
		if(StringUtil.isNotEmpty(course.getCoursetype())&&!course.getCoursetype().equalsIgnoreCase("all")){
			dc.add(Restrictions.eq("coursetype", course.getCoursetype()));
		}
		/**
		 * 当课程类型是在线课程时，不查询课程地点
		 */
		if((StringUtil.isNotEmpty(course.getCoursetype())&&!course.getCoursetype().equalsIgnoreCase("all"))&&course.getCoursetype().equalsIgnoreCase(Globals.FACE_COURSE)){		
			if(StringUtil.isNotEmpty(course.getCity().getId())){
				dc.add(Restrictions.eq("city.id", course.getCity().getId()));
			}else if(StringUtil.isNotEmpty(course.getCity().getFatherId())&&course.getCity().getFatherId()!=0){
				dc.createAlias("city", "city");
				dc.add(Restrictions.eq("city.fatherId", course.getCity().getFatherId()));
			}
		}
		/**
		 *当课程类型是全部
		 */
		if(!StringUtil.isNotEmpty(course.getCoursetype())){		
			if(StringUtil.isNotEmpty(course.getCity().getFatherId())&&course.getCity().getFatherId()!=0){
				dc.add(Restrictions.isNull("city"));
				//DetachedCriteria city = dc.createCriteria("city");
				//city.add(Restrictions.eq("fatherId", course.getCity().getFatherId()));
				//dc.createAlias("city", "city", CriteriaSpecification.LEFT_JOIN);
				//dc.add(Restrictions.eq("city.fatherId", course.getCity().getFatherId()));
				//dc.setFetchMode("city", FetchMode.DEFAULT).add(Restrictions.eq("city.fatherId", course.getCity().getFatherId()));
			}
		}
		if(StringUtil.isNotEmpty(course.getKeywords())){
			dc.add(Restrictions.or(
					Restrictions.like("coursename", "%"+course.getKeywords()+"%"),
					Restrictions.like("keywords", "%"+course.getKeywords()+"%")));
		}
		dc.add(Restrictions.eq("status", Globals.AGENCY_COURSE_SUCCESS));
		return this.commonDao.find(page, dc);
	}
	
}