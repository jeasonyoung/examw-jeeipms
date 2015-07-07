package com.changh.jeeipms.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;


public class HttpClientUtil {

	//接口地址
	private String apiURL = "";
	private Log logger = LogFactory.getLog(this.getClass());
	private static final String pattern = "yyyy-MM-dd HH:mm:ss:SSS";
    private HttpClient httpClient = null;
	private HttpPost method = null;
	private long startTime = 0L;
	private long endTime = 0L;
	private int status = 0;
	/**
	 * 接口地址
	 * @param url
	 */
	public HttpClientUtil(String url){

		if(url != null)
		{
			this.apiURL = url;
		}
		if(apiURL != null)
		{
                    httpClient = new DefaultHttpClient();
                   
                    method = new HttpPost(apiURL);
			
		}
	}
	
	/**
	 * 调用 API
	 * @param parameters
	 * @return
	 */
	public String post(String parameters)
	{
		String resultJsonObject = null;  
                logger.info("parameters:" + parameters);
                
                
		if(method != null & parameters != null  && !"".equals(parameters.trim()))
		{
                    //JSONArray jsonObject = JSONArray.fromObject(parameters);
                   // logger.info("json:" + jsonObject.toString());
                    try{

                        List<NameValuePair> params=new ArrayList<NameValuePair>();  
                        //建立一个NameValuePair数组，用于存储欲传送的参数  
                        params.add(new BasicNameValuePair("data",parameters));  
                        //添加参数  
                        method.setEntity(new UrlEncodedFormEntity(params,HTTP.UTF_8));  
                        
                        startTime = System.currentTimeMillis();
                                
                        //设置编码  
                        HttpResponse response=httpClient.execute(method);  
                        endTime = System.currentTimeMillis();
                        int statusCode = response.getStatusLine().getStatusCode();
                        logger.info("statusCode:" + statusCode);
                        logger.info("调用API 花费时间(单位：毫秒)：" + (endTime - startTime));
                        if(statusCode != HttpStatus.SC_OK){
                            logger.error("Method failed:"+response.getStatusLine());
                            status = 1;
                        }
                        
                        
                        if ( statusCode == 200) {  
                            // 得到httpResponse的实体数据  
                            HttpEntity httpEntity = response.getEntity();  
                            if (httpEntity != null) {  
                                try {  
                                    BufferedReader bufferedReader = new BufferedReader(  
                                    new InputStreamReader(httpEntity.getContent(),"UTF-8"), 8 * 1024);  
                                    StringBuilder entityStringBuilder = new StringBuilder();  
                                    String line = null;  
                                    while ((line = bufferedReader.readLine()) != null) {
                                        entityStringBuilder.append(line);  
                                    }  
                                    // 利用从HttpEntity中得到的String生成JsonObject  
                                    resultJsonObject = (entityStringBuilder.toString()) ;  
                                } catch (Exception e) {  
                                    e.printStackTrace();  
                                }  
                            }  
                        } 
                            //Read the response body
                        	
                        
			}catch(IOException e){
				//发生网络异常
				logger.error("exception occurred!\n"+ExceptionUtils.getStackTrace(e));
				//网络错误
				status = 3;
			}
                    finally{
                        logger.info("调用接口状态：" + status);
                    }

		}
		return  resultJsonObject;
	}

	/**
	 * 0.成功 1.执行方法失败 2.协议错误 3.网络错误
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	/**
	 * @return the startTime
	 */
	public long getStartTime() {
		return startTime;
	}
	/**
	 * @return the endTime
	 */
	public long getEndTime() {
		return endTime;
	}
}
