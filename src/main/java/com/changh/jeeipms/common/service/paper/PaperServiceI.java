package com.changh.jeeipms.common.service.paper;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.paper.PaperEntity;

public interface PaperServiceI extends CommonService{
	public Page<PaperEntity> find(Page<PaperEntity> page, PaperEntity paper,String type);
}
