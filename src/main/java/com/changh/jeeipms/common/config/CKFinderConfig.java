package com.changh.jeeipms.common.config;

import javax.servlet.ServletConfig;

import org.jeecgframework.core.util.ResourceUtil;

import com.ckfinder.connector.ServletContextFactory;
import com.ckfinder.connector.configuration.Configuration;
import com.ckfinder.connector.utils.AccessControlUtil;

/**
 * CKFinder配置
 * @author ThinkGem
 * @version 2013-01-15
 */
public class CKFinderConfig extends Configuration {

	public CKFinderConfig(ServletConfig servletConfig) {
        super(servletConfig);  
    }
	
	@Override
    protected Configuration createConfigurationInstance() {
		AccessControlUtil.getInstance(this).loadACLConfig();
		try {
			String id = ResourceUtil.getAgencyId();
			this.baseURL = ServletContextFactory.getServletContext().getContextPath()+"/userfiles/"+
					(id!=null?id:0)+"/";
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return new CKFinderConfig(this.servletConf);
    }

}
