package com.changh.jeeipms.common.service.impl.student;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.student.StudyRecordServiceI;

@Service("studyRecordService")
@Transactional
public class StudyRecordServiceImpl extends CommonServiceImpl implements StudyRecordServiceI {
	
}