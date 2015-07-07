package com.changh.jeeipms.common.service.agency;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.TeacherEntity;

public interface TeacherServiceI extends CommonService{
	public Page<TeacherEntity> find(Page<TeacherEntity> page, TeacherEntity t);
}
