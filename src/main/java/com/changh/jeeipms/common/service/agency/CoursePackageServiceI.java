package com.changh.jeeipms.common.service.agency;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.CoursePackageEntity;

public interface CoursePackageServiceI extends CommonService{
	/**
	 * 按条件获取分页 课程列表
	 * @param page
	 * @param course
	 * @param type
	 * @return
	 */
	public Page<CoursePackageEntity> find(Page<CoursePackageEntity> page, CoursePackageEntity coursePackage);
}
