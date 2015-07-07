package com.changh.jeeipms.common.entity.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 学员管理
 * @author failymiss
 * @date 2013-09-22 09:23:58
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_student", schema = "")
@PrimaryKeyJoinColumn(name = "id")
@SuppressWarnings("serial")
public class StudentEntity extends StudentAccountEntity implements java.io.Serializable {
	/**用户名*/
	private java.lang.String username;
	/**密码*/
	private java.lang.String spassword;
	/**真实姓名*/
	private java.lang.String realname;
	/**0:男1:女*/
	private java.lang.Integer gender;
	/**0:正常 1:冻结*/
	private java.lang.Integer status;
	/**注册时间*/
	private java.util.Date addtime;
	/**登陆次数*/
	private java.lang.Integer logintimes;
	/**最后登陆时间*/
	private java.util.Date lastlogintime;
	/**最后登陆IP*/
	private java.lang.String lastloginip;
	/**头像地址*/
	private java.lang.String imageurl;
	/**电话号码*/
	private java.lang.String phone;
	/**联系QQ*/
	private java.lang.String qq;
	/**电子邮箱*/
	private java.lang.String email;
	/**学员地址*/
	private java.lang.String address;
	/**MSN*/
	private java.lang.String msn;
	
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
	@Column(name ="SPASSWORD",nullable=false,length=100)
	public java.lang.String getSpassword(){
		return this.spassword;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  密码
	 */
	public void setSpassword(java.lang.String spassword){
		this.spassword = spassword;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  真实姓名
	 */
	@Column(name ="REALNAME",nullable=true,length=50)
	public java.lang.String getRealname(){
		return this.realname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  真实姓名
	 */
	public void setRealname(java.lang.String realname){
		this.realname = realname;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  0:男1:女
	 */
	@Column(name ="GENDER",nullable=true,precision=5,scale=0)
	public java.lang.Integer getGender(){
		return this.gender;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  0:男1:女
	 */
	public void setGender(java.lang.Integer gender){
		this.gender = gender;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  0:正常 1:冻结
	 */
	@Column(name ="STATUS",nullable=true,precision=5,scale=0)
	public java.lang.Integer getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  0:正常 1:冻结
	 */
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  注册时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  注册时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  登陆次数
	 */
	@Column(name ="LOGINTIMES",nullable=true,precision=5,scale=0)
	public java.lang.Integer getLogintimes(){
		return this.logintimes;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  登陆次数
	 */
	public void setLogintimes(java.lang.Integer logintimes){
		this.logintimes = logintimes;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  最后登陆时间
	 */
	@Column(name ="LASTLOGINTIME",nullable=true)
	public java.util.Date getLastlogintime(){
		return this.lastlogintime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  最后登陆时间
	 */
	public void setLastlogintime(java.util.Date lastlogintime){
		this.lastlogintime = lastlogintime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  最后登陆IP
	 */
	@Column(name ="LASTLOGINIP",nullable=true,length=32)
	public java.lang.String getLastloginip(){
		return this.lastloginip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  最后登陆IP
	 */
	public void setLastloginip(java.lang.String lastloginip){
		this.lastloginip = lastloginip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  头像地址
	 */
	@Column(name ="IMAGEURL",nullable=true,length=50)
	public java.lang.String getImageurl(){
		return this.imageurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  头像地址
	 */
	public void setImageurl(java.lang.String imageurl){
		this.imageurl = imageurl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电话号码
	 */
	@Column(name ="PHONE",nullable=true,length=30)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电话号码
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系QQ
	 */
	@Column(name ="QQ",nullable=true,length=30)
	public java.lang.String getQq(){
		return this.qq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系QQ
	 */
	public void setQq(java.lang.String qq){
		this.qq = qq;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电子邮箱
	 */
	@Column(name ="EMAIL",nullable=true,length=100)
	public java.lang.String getEmail(){
		return this.email;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电子邮箱
	 */
	public void setEmail(java.lang.String email){
		this.email = email;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学员地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=500)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学员地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  MSN
	 */
	@Column(name ="MSN",nullable=true,length=100)
	public java.lang.String getMsn(){
		return this.msn;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  MSN
	 */
	public void setMsn(java.lang.String msn){
		this.msn = msn;
	}
}
