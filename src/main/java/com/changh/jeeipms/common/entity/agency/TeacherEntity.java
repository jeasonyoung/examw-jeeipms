package com.changh.jeeipms.common.entity.agency;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 机构老师
 * @author failymiss
 * @date 2013-08-27 17:16:36
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_teacher", schema = "")
@SuppressWarnings("serial")
public class TeacherEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**姓名*/
	private java.lang.String realname;
	/**所属机构*/
	private java.lang.String agencyid;
	/**头像*/
	private java.lang.String imageurl;
	/**电话号码*/
	private java.lang.String phone;
	/**联系QQ*/
	private java.lang.String qq;
	/**电子邮箱*/
	private java.lang.String email;
	/**推荐排序*/
	private java.lang.String teacherorder;
	/**主要课程*/
	private java.lang.String lessons;
	/**老师介绍*/
	private java.lang.String description;
	/**添加时间*/
	private java.util.Date addtime;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
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
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  姓名
	 */
	@Column(name ="REALNAME",nullable=false,length=50)
	public java.lang.String getRealname(){
		return this.realname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  姓名
	 */
	public void setRealname(java.lang.String realname){
		this.realname = realname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所属机构
	 */
	@Column(name ="AGENCYID",nullable=false,length=32)
	public java.lang.String getAgencyid(){
		return this.agencyid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属机构
	 */
	public void setAgencyid(java.lang.String agencyid){
		this.agencyid = agencyid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  头像
	 */
	@Column(name ="IMAGEURL",nullable=true,length=100)
	public java.lang.String getImageurl(){
		return this.imageurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  头像
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
	@Column(name ="EMAIL",nullable=true,length=50)
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
	 *@return: java.lang.String  推荐排序
	 */
	@Column(name ="TEACHERORDER",nullable=true,length=15)
	public java.lang.String getTeacherorder(){
		return this.teacherorder;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  推荐排序
	 */
	public void setTeacherorder(java.lang.String teacherorder){
		this.teacherorder = teacherorder;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主要课程
	 */
	@Column(name ="LESSONS",nullable=true,length=255)
	public java.lang.String getLessons(){
		return this.lessons;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主要课程
	 */
	public void setLessons(java.lang.String lessons){
		this.lessons = lessons;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  老师介绍
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=65535)
	public java.lang.String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  老师介绍
	 */
	public void setDescription(java.lang.String description){
		this.description = description;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  添加时间
	 */
	@Column(name ="ADDTIME",nullable=true)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  添加时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
}
