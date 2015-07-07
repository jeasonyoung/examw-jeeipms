package com.changh.jeeipms.cms.service.agency;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;

public interface AgencyServiceI extends CommonService{
	/**
	 * 获得机构列表
	 * @param course
	 * @param page
	 * @return
	 */
	public FrontPage<AgencyParameterEntity> getAgencyList(AgencyParameterEntity agency,FrontPage<AgencyParameterEntity> page);
}
