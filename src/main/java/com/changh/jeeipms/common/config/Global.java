package com.changh.jeeipms.common.config;

import com.changh.jeeipms.common.util.PropertiesLoader;

/**
 * 全局配置类
 * @author faliymiss
 * @version 2013-03-23
 */
public class Global {
	
	/**
	 * 属性文件加载对象
	 */
	private static PropertiesLoader propertiesLoader;
	
	/**
	 * 获取配置
	 */
	public static String getConfig(String key) {
		if (propertiesLoader == null){
			propertiesLoader = new PropertiesLoader("application.properties");
		}
		return propertiesLoader.getProperty(key);
	}

	/////////////////////////////////////////////////////////
	
	public static String getAdminPath() {
		return getConfig("adminPath");
	}
	public static String getFrontPath() {
		return getConfig("frontPath");
	}
	public static String getUrlSuffix() {
		return getConfig("urlSuffix");
	}
	public static String getAgencyPath() {
		return getConfig("agencyPath");
	}
	
}
