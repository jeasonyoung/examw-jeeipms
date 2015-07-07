package org.jeecgframework.tag.extension;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Myfirst extends SimpleTagSupport{
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		//自动调用doTag()方法
		JspContext context=getJspContext();
		JspWriter out=context.getOut();
		out.println("My Name is "+name+",I'm "+age+" years old");
		super.doTag();
	}
}
