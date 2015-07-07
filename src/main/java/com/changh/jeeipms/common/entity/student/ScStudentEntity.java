package com.changh.jeeipms.common.entity.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 网校学员信息
 * @author failymiss
 * @date 2014-01-06 11:03:17
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_student_school", schema = "")
@SuppressWarnings("serial")
public class ScStudentEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**学员*/
	private java.lang.String stuId;
	/**网校*/
	private java.lang.String schId;
	/**用户名*/
	private java.lang.String username;
	/**密码*/
	private java.lang.String password;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键ID
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键ID
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学员
	 */
	@Column(name ="STU_ID",nullable=false,length=32)
	public java.lang.String getStuId(){
		return this.stuId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学员
	 */
	public void setStuId(java.lang.String stuId){
		this.stuId = stuId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  网校
	 */
	@Column(name ="SCH_ID",nullable=false,length=100)
	public java.lang.String getSchId(){
		return this.schId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  网校
	 */
	public void setSchId(java.lang.String schId){
		this.schId = schId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户名
	 */
	@Column(name ="USERNAME",nullable=false,length=100)
	public java.lang.String getUsername(){
		return this.username;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户名
	 */
	public void setUsername(java.lang.String username){
		this.username = username;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  密码
	 */
	@Column(name ="PASSWORD",nullable=false,length=100)
	public java.lang.String getPassword(){
		return this.password;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  密码
	 */
	public void setPassword(java.lang.String password){
		this.password = password;
	}
}
