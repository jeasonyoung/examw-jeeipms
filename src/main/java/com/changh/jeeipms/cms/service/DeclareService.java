package com.changh.jeeipms.cms.service;

import java.util.List;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.cms.entity.base.TSAttachment;


public interface DeclareService extends CommonService{
	
	public List<TSAttachment> getAttachmentsByCode(String businessKey,String description);
	
}
