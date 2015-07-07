package com.changh.jeeipms.common.service.impl.card;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.card.CardRecordServiceI;

@Service("cardRecordService")
@Transactional
public class CardRecordServiceImpl extends CommonServiceImpl implements CardRecordServiceI {
	
}