package org.jeecgframework.core.common.model.common;

import java.io.Serializable;

import com.changh.jeeipms.cms.entity.base.TSUser;


public class SessionInfo implements Serializable {

	private TSUser user;
	public TSUser getUser() {
		return user;
	}

	public void setUser(TSUser user) {
		this.user = user;
	}

}
