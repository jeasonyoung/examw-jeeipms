package com.changh.jeeipms.common.service.agency;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyStudentEntity;


public interface AgencyStudentServiceI extends CommonService{
	public Page<AgencyStudentEntity> find(Page<AgencyStudentEntity> page, AgencyStudentEntity stu);
}
