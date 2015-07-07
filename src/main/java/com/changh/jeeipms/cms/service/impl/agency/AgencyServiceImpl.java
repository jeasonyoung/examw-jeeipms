package com.changh.jeeipms.cms.service.impl.agency;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.service.agency.AgencyServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;

@Service("agencyService")
@Transactional
public class AgencyServiceImpl extends CommonServiceImpl implements AgencyServiceI {
	
	//@Override
	public FrontPage<AgencyParameterEntity> getAgencyList(AgencyParameterEntity agency,
			FrontPage<AgencyParameterEntity> page) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = this.commonDao.createDetachedCriteria(AgencyEntity.class);
		if(StringUtil.isNotEmpty(agency.getProvince().getId())&&!agency.getProvince().getId().equals("0")){
			dc.add(Restrictions.eq("province.id", agency.getProvince().getId()));
		}
		if(StringUtil.isNotEmpty(agency.getCategory())&&!agency.getCategory().equals("0")){
			dc.add(Restrictions.like("category", "%"+agency.getCategory()+"%"));
		}
		if(StringUtil.isNotEmpty(agency.getKeywords())){
			dc.add(Restrictions.or(Restrictions.like("keywords", "%"+agency.getKeywords()+"%"),Restrictions.like("name", "%"+agency.getKeywords()+"%")));
		}
		dc.add(Restrictions.eq("status", Globals.AGENCY__SUCCESS));
		return  this.commonDao.find(page, dc);
	}
	
}