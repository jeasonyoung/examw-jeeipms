package com.changh.jeeipms.cms.service.impl.order;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.service.order.SchoolServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("schoolService")
@Transactional
public class SchoolServiceImpl extends CommonServiceImpl implements SchoolServiceI {
	
}