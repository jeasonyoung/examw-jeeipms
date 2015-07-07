package com.changh.jeeipms.cms.service;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.cms.entity.base.TSUser;

public interface UserService extends CommonService{

	public TSUser checkUserExits(TSUser user);
	public String getUserRole(TSUser user);
	public void pwdInit(TSUser user, String newPwd);
}
