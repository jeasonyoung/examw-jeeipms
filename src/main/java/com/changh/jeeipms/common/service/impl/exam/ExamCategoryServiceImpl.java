package com.changh.jeeipms.common.service.impl.exam;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.exam.ExamCategoryServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("examCategoryService")
@Transactional
public class ExamCategoryServiceImpl extends CommonServiceImpl implements ExamCategoryServiceI {
	
}