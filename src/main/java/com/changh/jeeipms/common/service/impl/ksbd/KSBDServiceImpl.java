package com.changh.jeeipms.common.service.impl.ksbd;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.ksbd.KSBDServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("kSBDService")
@Transactional
public class KSBDServiceImpl extends CommonServiceImpl implements KSBDServiceI {
	
}