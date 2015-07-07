package com.changh.jeeipms.common.service.impl.agency;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyStudentEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.service.agency.AgencyStudentServiceI;

@Service("agencyStudentService")
@Transactional
public class AgencyStudentServiceImpl extends CommonServiceImpl implements AgencyStudentServiceI {

	public Page<AgencyStudentEntity> find(Page<AgencyStudentEntity> page, AgencyStudentEntity stu) {
		DetachedCriteria dc =  DetachedCriteria.forClass(AgencyStudentEntity.class); 
		AgencyUserEntity user = ResourceUtil.getSessionAgencyUser();
		dc.add(Restrictions.eq("agency.id", user.getApe().getId()));
		if(!StringUtil.isEmpty(stu.getRealname())){
			dc.add(Restrictions.like("realname", "%"+stu.getRealname()+"%"));
		}
		if(!StringUtil.isEmpty(stu.getPhone())){
			dc.add(Restrictions.like("phone", "%"+stu.getPhone()+"%"));
		}
		if(StringUtil.isNotEmpty(stu.getStatus())&&stu.getStatus() != 4){
			dc.add(Restrictions.eq("status", stu.getStatus()));
		}
		return this.commonDao.find(page, dc);
	}
}