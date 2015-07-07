package com.changh.jeeipms.cms.service.impl.core;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.service.core.LinkListServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("linkListService")
@Transactional
public class LinkListServiceImpl extends CommonServiceImpl implements LinkListServiceI {
	
}