package org.jeecgframework.core.constant;

import org.jeecgframework.core.util.ResourceUtil;

import com.changh.jeeipms.common.util.PropertiesLoader;


/**  
* 项目名称：jeecg
* 类名称：Globals   
* 类描述：  全局变量定义
* 创建人：jeecg      
* @version    
*
 */
public final class Globals {
	/**
	 * 订单状态
	 */
	public static int ORDER_PAY_SUCCESS =1;
	public static int ORDER_NO_PAY =0;
	/**
	 * 
	 */
	public static int ORDER_TYPE_COURSE =1;
	public static int ORDER_TYPE_CHARGE =2;
	public static int ORDER_TYPE_KSBD = 3;
	/**
	 * 币种
	 */
	public static int TRADECASH =1;
	public static int TRADECARD =0;
	/**
	 * 咨询学员状态
	 */
	public static Short AGENCY_STUDENT_UNTREATED =0;//未处理
	public static Short AGENCY_STUDENT_TREATED =1;//跟踪中
	public static Short AGENCY_STUDENT_APPLY =2;//已报名
	public static Short AGENCY_STUDENT_CANCEL =3;//不报名
	/**
	 * 课程类别
	 */
	public static String FACE_COURSE ="0";//面授
	public static String ONLINE_COURSE ="1";//网课
	public static String PAPER = "2";//试卷
	
	public static Integer  YES_FREE =1;//免费
	public static Integer  NO_FREE =0;//不免费
	
	
	public static Integer AGENCY_COURSE_UNTREATED =0;//未处理
	public static Integer AGENCY_COURSE_SUCCESS =1;//审核成功
	public static Integer AGENCY_COURSE_ERROR =2;//审核失败
	
	public static String AGENCY__UNTREATED ="0";//未处理
	public static String AGENCY__SUCCESS ="1";//审核成功
	public static String AGENCY__ERROR ="2";//审核失败
	
	/**
	 * 保存用户到SESSION
	 */
	public static String USER_SESSION="USER_SESSION";
	public static String AGENCY_USER_SESSION ="agencyuser";
	public static String AGENCY_SESSION="AGENCY_SESSION";
	/**
	 * 人员类型
	 */
	public static Short User_Normal=1;//正常
	public static Short User_Forbidden=0;//禁用
	public static Short User_ADMIN=-1;//超级管理员
	/**
	 *日志级别定义
	 */
	public static Short Log_Leavel_INFO=1;
	public static Short Log_Leavel_WARRING=2;
	public static Short Log_Leavel_ERROR=3;
	 /**
	  * 日志类型
	  */
	 public static Short Log_Type_LOGIN=1; //登陆
	 public static Short Log_Type_EXIT=2;  //退出
	 public static Short Log_Type_INSERT=3; //插入
	 public static Short Log_Type_DEL=4; //删除
	 public static Short Log_Type_UPDATE=5; //更新
	 public static Short Log_Type_UPLOAD=6; //上传
	 public static Short Log_Type_OTHER=7; //其他
	 /**
	  * cookie
	  */
	 public static String COURSE ="course"; 
	 
	 /**
	  * 词典分组定义
	  */
	 public static String TypeGroup_Database="database";//数据表分类
	 
	 /**
	  * 权限等级
	  */
	 public static Short Function_Leave_ONE=0;//一级权限
	 public static Short Function_Leave_TWO=1;//二级权限
	 
	 /**
	  * 权限等级前缀
	  */
	 public static String Function_Order_ONE="ofun";//一级权限
	 public static String Function_Order_TWO="tfun";//二级权限

	 /**
	  * 新闻法规
	  */
	 public static Short Document_NEW=0; //新建
	 public static Short Document_PUBLICH=0; //发布
	 
	 /**
	  * 答疑类型
	  */
	 public static Short ASK_COURSE = 0;	//咨询
	 public static Short ASK_STUDY = 1;		//学习
	 /**
	  * 问题状态
	  */
	 public static Short ASK_ANSWER_NO = 0; //未回复
	 public static Short ASK_ANSWER_NOSEE = 1;	//已回复未查看
	 public static Short ASK_ANSWER_DONE = 2;	//已查看
	 
	 /**
	  * 配置系统是否开启按钮权限控制
	  */
	 public static boolean BUTTON_AUTHORITY_CHECK = false;
	 static{
		 String button_authority_jeecg = ResourceUtil.getSessionattachmenttitle("button.authority.jeecg");
		 if("true".equals(button_authority_jeecg)){
			 BUTTON_AUTHORITY_CHECK = true;
		 }
	 }
	 /**
	  * 后台路径
	  */
	 public static final String ADMIN_PATH = "/a";
	 public static String getAdminPath() {
		return ADMIN_PATH;
	}
	 /**
		 * 获取配置
		 */
	 /**
		 * 属性文件加载对象
		 */
	private static PropertiesLoader propertiesLoader;
	public static String getConfig(String key) {
			if (propertiesLoader == null){
				propertiesLoader = new PropertiesLoader("application.properties");
			}
			return propertiesLoader.getProperty(key);
	}
	
}
