package com.changh.jeeipms.common.service.agency;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.RecourseEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;

public interface RecourseServiceI extends CommonService{
	public Page<RecourseEntity> find(Page<RecourseEntity> page, RecourseEntity recourse);
	public FrontPage<RecourseEntity> getRecourseList(String agencyId,FrontPage<RecourseEntity> page);
}
