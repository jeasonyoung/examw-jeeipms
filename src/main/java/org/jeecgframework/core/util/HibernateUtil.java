package org.jeecgframework.core.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static SessionFactory sf;
	private static ThreadLocal<Session> tl = 
		new ThreadLocal<Session>();
	
	static{//第一次加载类时,实例化SessionFactory
		Configuration conf = new Configuration();
		//加载hibernate配置及hbm.xml映射文件
		conf.configure("spring-mvc-hibernate.xml");
		//获取SessionFactory
		sf = conf.buildSessionFactory();
	}
	
	//同一个线程多次调用,可返回相同session对象
	public static Session getSession(){
		Session session = tl.get();
		if(session == null){
			session = sf.openSession();
			tl.set(session);
		}
		return session;
	}
	
	public static void closeSession(){
		Session session = tl.get();
		tl.set(null);
		if(session != null && session.isOpen()){
			session.close();
		}
	}
	
	
}
