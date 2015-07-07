package com.changh.jeeipms.cms.entity.order;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 合作网校
 * @author failymiss
 * @date 2013-12-23 14:14:26
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_s_school", schema = "")
@SuppressWarnings("serial")
public class SchoolEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**用户名*/
	private java.lang.String username;
	/**密钥*/
	private java.lang.String scKey;
	/**网址*/
	private java.lang.String scUrl;
	/**接口*/
	private java.lang.String scInterface;
	/**网站名称*/
	private java.lang.String scName;
	/**修改时间*/
	private java.util.Date updatetime;
	/**添加时间*/
	private java.util.Date addtime;
	/**添加人*/
	private java.lang.String addby;
	/**修改人*/
	private java.lang.String updateby;
	
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
	 *@return: java.lang.String  密钥
	 */
	@Column(name ="SC_KEY",nullable=false,length=250)
	public java.lang.String getScKey(){
		return this.scKey;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  密钥
	 */
	public void setScKey(java.lang.String scKey){
		this.scKey = scKey;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  网址
	 */
	@Column(name ="SC_URL",nullable=false,length=250)
	public java.lang.String getScUrl(){
		return this.scUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  网址
	 */
	public void setScUrl(java.lang.String scUrl){
		this.scUrl = scUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  接口
	 */
	@Column(name ="SC_INTERFACE",nullable=false,length=250)
	public java.lang.String getScInterface(){
		return this.scInterface;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  接口
	 */
	public void setScInterface(java.lang.String scInterface){
		this.scInterface = scInterface;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  网站名称
	 */
	@Column(name ="SC_NAME",nullable=true,length=250)
	public java.lang.String getScName(){
		return this.scName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  网站名称
	 */
	public void setScName(java.lang.String scName){
		this.scName = scName;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  修改时间
	 */
	@Column(name ="UPDATETIME",nullable=true)
	public java.util.Date getUpdatetime(){
		return this.updatetime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  修改时间
	 */
	public void setUpdatetime(java.util.Date updatetime){
		this.updatetime = updatetime;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  添加人
	 */
	@Column(name ="ADDBY",nullable=true,length=32)
	public java.lang.String getAddby(){
		return this.addby;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  添加人
	 */
	public void setAddby(java.lang.String addby){
		this.addby = addby;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  修改人
	 */
	@Column(name ="UPDATEBY",nullable=true,length=32)
	public java.lang.String getUpdateby(){
		return this.updateby;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  修改人
	 */
	public void setUpdateby(java.lang.String updateby){
		this.updateby = updateby;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户名
	 */
	@Column(name ="USERNAME",nullable=false,length=200)
	public java.lang.String getUsername() {
		return username;
	}

	public void setUsername(java.lang.String username) {
		this.username = username;
	}
}
