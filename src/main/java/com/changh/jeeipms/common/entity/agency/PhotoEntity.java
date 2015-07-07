package com.changh.jeeipms.common.entity.agency;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 机构相册
 * @author failymiss
 * @date 2013-12-03 11:30:19
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_photo", schema = "")
@SuppressWarnings("serial")
public class PhotoEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**名称*/
	private java.lang.String title;
	/**机构*/
	private AgencyEntity agency;
	/**类型*/
	private java.lang.Integer type;
	/**路径*/
	private java.lang.String urlpath;
	/**预览路径*/
	private java.lang.String thumbUrl;
	/**介绍*/
	private java.lang.String content;
	/**添加时间*/
	private java.util.Date addtime;
	
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
	 *@return: java.lang.String  名称
	 */
	@Column(name ="TITLE",nullable=false,length=100)
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  名称
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  类型
	 */
	@Column(name ="TYPE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  类型
	 */
	public void setType(java.lang.Integer type){
		this.type = type;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  路径
	 */
	@Column(name ="URLPATH",nullable=false,length=400)
	public java.lang.String getUrlpath(){
		return this.urlpath;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  路径
	 */
	public void setUrlpath(java.lang.String urlpath){
		this.urlpath = urlpath;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  预览路径
	 */
	@Column(name ="THUMB_URL",nullable=false,length=400)
	public java.lang.String getThumbUrl(){
		return this.thumbUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  预览路径
	 */
	public void setThumbUrl(java.lang.String thumbUrl){
		this.thumbUrl = thumbUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  介绍
	 */
	@Column(name ="CONTENT",nullable=true,length=500)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  介绍
	 */
	public void setContent(java.lang.String content){
		this.content = content;
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AGENCY_ID")
	public AgencyEntity getAgency() {
		return agency;
	}

	public void setAgency(AgencyEntity agency) {
		this.agency = agency;
	}
}
