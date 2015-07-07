package com.changh.jeeipms.cms.service.impl.order;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.service.order.TradeServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tradeService")
@Transactional
public class TradeServiceImpl extends CommonServiceImpl implements TradeServiceI {
	
}