package com.changh.jeeipms.common.service.impl.content;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.content.FrontMenuServiceI;

@Service("frontMenuService")
@Transactional
public class FrontMenuServiceImpl extends CommonServiceImpl implements FrontMenuServiceI {
	
}