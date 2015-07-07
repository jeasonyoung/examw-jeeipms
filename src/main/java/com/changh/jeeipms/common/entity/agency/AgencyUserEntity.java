package com.changh.jeeipms.common.entity.agency;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 机构用户
 * @author failymiss
 * @date 2013-07-25 17:32:51
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_user", schema = "")
@SuppressWarnings("serial")
public class AgencyUserEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**真实姓名*/
	private java.lang.String realname;
	/**用户名*/
	private java.lang.String username;
	/**密码*/
	private java.lang.String password;
	/**手机号码*/
	private java.lang.String mobilephone;
	/**办公电话*/
	private java.lang.String officephone;
	/**QQ*/
	private java.lang.String qq;
	/**电子邮箱*/
	private java.lang.String email;
	/**浏览器*/
	private java.lang.String browser;
	/**0:正常1:冻结*/
	private java.lang.Integer status;
	/**最近登陆*/
	private java.util.Date lastlogintime;
	/**登陆次数*/
	private java.lang.Integer logincount;
	/**登陆IP*/
	private java.lang.String loginip;
	/**头像地址*/
	private java.lang.String image;
	/**所属公司*/
	private AgencyParameterEntity ape = new AgencyParameterEntity();
	
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户名
	 */
	@Column(name ="USERNAME",nullable=true,length=50)
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
	@Column(name ="PASSWORD",nullable=true,length=100)
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  手机号码
	 */
	@Column(name ="MOBILEPHONE",nullable=true,length=30)
	public java.lang.String getMobilephone(){
		return this.mobilephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  手机号码
	 */
	public void setMobilephone(java.lang.String mobilephone){
		this.mobilephone = mobilephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  办公电话
	 */
	@Column(name ="OFFICEPHONE",nullable=true,length=20)
	public java.lang.String getOfficephone(){
		return this.officephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  办公电话
	 */
	public void setOfficephone(java.lang.String officephone){
		this.officephone = officephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  QQ
	 */
	@Column(name ="QQ",nullable=true,length=30)
	public java.lang.String getQq(){
		return this.qq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  QQ
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
	 *@return: java.lang.String  浏览器
	 */
	@Column(name ="BROWSER",nullable=true,length=20)
	public java.lang.String getBrowser(){
		return this.browser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  浏览器
	 */
	public void setBrowser(java.lang.String browser){
		this.browser = browser;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  0:正常1:冻结
	 */
	@Column(name ="STATUS",nullable=true,precision=5,scale=0)
	public java.lang.Integer getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  0:正常1:冻结
	 */
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  最近登陆
	 */
	@Column(name ="LASTLOGINTIME",nullable=true)
	public java.util.Date getLastlogintime(){
		return this.lastlogintime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  最近登陆
	 */
	public void setLastlogintime(java.util.Date lastlogintime){
		this.lastlogintime = lastlogintime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  登陆次数
	 */
	@Column(name ="LOGINCOUNT",nullable=true,precision=10,scale=0)
	public java.lang.Integer getLogincount(){
		return this.logincount;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  登陆次数
	 */
	public void setLogincount(java.lang.Integer logincount){
		this.logincount = logincount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  登陆IP
	 */
	@Column(name ="LOGINIP",nullable=true,length=50)
	public java.lang.String getLoginip(){
		return this.loginip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  登陆IP
	 */
	public void setLoginip(java.lang.String loginip){
		this.loginip = loginip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  头像地址
	 */
	@Column(name ="IMAGE",nullable=true,length=100)
	public java.lang.String getImage(){
		return this.image;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  头像地址
	 */
	public void setImage(java.lang.String image){
		this.image = image;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "agencyid")
	public AgencyParameterEntity getApe() {
		return ape;
	}

	public void setApe(AgencyParameterEntity ape) {
		this.ape = ape;
	}
}
