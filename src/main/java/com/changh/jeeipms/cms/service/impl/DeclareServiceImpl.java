package com.changh.jeeipms.cms.service.impl;

import java.util.List;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.entity.base.TSAttachment;
import com.changh.jeeipms.cms.service.DeclareService;


@Service("declareService")
@Transactional
public class DeclareServiceImpl extends CommonServiceImpl implements DeclareService {

	public List<TSAttachment> getAttachmentsByCode(String businessKey,String description)
	{
		String hql="from TSAttachment t where t.businessKey='"+businessKey+"' and t.description='"+description+"'";
		return commonDao.findByQueryString(hql);
	}
	
}
