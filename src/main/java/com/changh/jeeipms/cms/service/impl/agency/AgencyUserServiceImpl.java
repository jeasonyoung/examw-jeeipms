package com.changh.jeeipms.cms.service.impl.agency;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.service.agency.AgencyUserServiceI;

@Service("agencyUserService")
@Transactional
public class AgencyUserServiceImpl extends CommonServiceImpl implements AgencyUserServiceI {
	
}