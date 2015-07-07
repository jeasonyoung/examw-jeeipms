package com.changh.jeeipms.common.service.impl.card;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.card.StudyCardServiceI;

@Service("studyCardService")
@Transactional
public class StudyCardServiceImpl extends CommonServiceImpl implements StudyCardServiceI {
	
}