package com.changh.jeeipms.common.service.impl.agency;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.agency.MenuServiceI;

@Service("menuService")
@Transactional
public class MenuServiceImpl extends CommonServiceImpl implements MenuServiceI {
	
}