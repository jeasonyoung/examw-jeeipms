package com.changh.jeeipms.common.service.impl.order;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.order.CourseItemServiceI;

@Service("courseItemService")
@Transactional
public class CourseItemServiceImpl extends CommonServiceImpl implements CourseItemServiceI {
	
}