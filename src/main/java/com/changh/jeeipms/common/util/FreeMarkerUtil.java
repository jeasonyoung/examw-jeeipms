package com.changh.jeeipms.common.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.jeecgframework.core.util.ContextHolderUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerUtil {
	private static FreeMarkerUtil instance = null;
	private static final Logger logger = Logger.getLogger(FreeMarkerUtil.class);
	private final String encoding = "UTF-8";
	private Configuration configuration;
	
	public static FreeMarkerUtil getInstance() {
		if (instance == null) {
			instance = new FreeMarkerUtil();
		}
		return instance;
	}
	
	public Configuration getConfiguration() {
		if (null == configuration) {
			configuration = new Configuration();
		}
		configuration.setDefaultEncoding(encoding);
		ServletContext context = ContextHolderUtils.getSession().getServletContext();;
		logger.info("Set servletContext for template loading at WEB-INF/freemarker");
		configuration.setServletContextForTemplateLoading(context, "WEB-INF/template/");
		return configuration;
	}
	/**
	 * 
	 * @param rootPath
	 * @param templateFileName
	 * @param rootMap
	 * @param htmlFilePath
	 * @param htmlFileName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean genHtmlFile(HttpServletRequest request,String rootPath, String templateFileName,
			Map rootMap, String htmlFilePath, String htmlFileName) {
		try {
			Template t = getConfiguration().getTemplate(templateFileName);
			createDirs(rootPath,htmlFilePath);
			t.setEncoding(encoding);
			logger.info("创建文件：" + rootPath + "/" + htmlFilePath + "/"
					+ htmlFileName);
			File file = new File(rootPath + "/" + htmlFilePath + "/"
					+ htmlFileName);
			Writer bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file), encoding));
			t.setOutputEncoding(encoding);
			t.process(rootMap, bw);
			bw.flush();
			bw.close();
		} catch (TemplateException te) {
			logger.error("读取FreeMarker文件模板出错：" + te.toString());
			return false;
		} catch (IOException ioe) {
			logger.error("I/O出错：" + ioe.toString());
			return false;
		}
		return true;
	}
	
	public boolean createDirs(String parentDir, String subDir) {
		File file = new File( parentDir + "/" + subDir + "/");
		if (!file.exists()) {
			try {
				file.mkdirs();
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}
		return true;
	}
}
