package com.changh.jeeipms.common.service.ask;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.ask.AskEntity;

public interface AskServiceI extends CommonService{
	public Page<AskEntity> find(Page<AskEntity> page, AskEntity ask,String type);
}
