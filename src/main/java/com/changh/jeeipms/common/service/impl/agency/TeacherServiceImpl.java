package com.changh.jeeipms.common.service.impl.agency;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.TeacherEntity;
import com.changh.jeeipms.common.service.agency.TeacherServiceI;

@Service("teacherService")
@Transactional
public class TeacherServiceImpl extends CommonServiceImpl implements TeacherServiceI {
	
	//@Override
	public Page<TeacherEntity> find(Page<TeacherEntity> page, TeacherEntity t) {
		DetachedCriteria dc =  DetachedCriteria.forClass(TeacherEntity.class); 
		String agencyid = ResourceUtil.getAgencyId();
		dc.add(Restrictions.eq("agencyid",agencyid));
		if(!StringUtil.isEmpty(t.getRealname())){
			dc.add(Restrictions.like("realname", "%"+t.getRealname()+"%"));
		}
		if(!StringUtil.isEmpty(t.getPhone())){
			dc.add(Restrictions.like("phone", "%"+t.getPhone()+"%"));
		}
		return this.commonDao.find(page, dc);
	}
}