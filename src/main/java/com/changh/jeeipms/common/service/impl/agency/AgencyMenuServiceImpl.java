package com.changh.jeeipms.common.service.impl.agency;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.agency.AgencyMenuServiceI;

@Service("agencyMenuService")
@Transactional
public class AgencyMenuServiceImpl extends CommonServiceImpl implements AgencyMenuServiceI {
	
}