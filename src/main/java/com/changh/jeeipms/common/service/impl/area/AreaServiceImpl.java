package com.changh.jeeipms.common.service.impl.area;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.area.AreaServiceI;

@Service("areaService")
@Transactional
public class AreaServiceImpl extends CommonServiceImpl implements AreaServiceI {
	
}