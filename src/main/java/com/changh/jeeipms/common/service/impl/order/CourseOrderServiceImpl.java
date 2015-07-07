package com.changh.jeeipms.common.service.impl.order;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.order.CourseOrderServiceI;

@Service("courseOrderService")
@Transactional
public class CourseOrderServiceImpl extends CommonServiceImpl implements CourseOrderServiceI {
	
}