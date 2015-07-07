package com.changh.jeeipms.common.entity.agency;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 机构统计
 * @author failymiss
 * @date 2013-07-25 10:23:07
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_parameter", schema = "")
@PrimaryKeyJoinColumn(name = "id")
public class AgencyParameterEntity extends AgencyEntity implements java.io.Serializable {
	/**推荐度*/
	private java.lang.Integer recommend;
	/**活跃度*/
	private java.lang.String liveness;
	/**访问量*/
	private java.lang.String pageview;
	/**到期时间*/
	private java.util.Date expirationdate;
	/**0:普通用户1:会员*/
	private java.lang.String vip;
	/**等级*/
	private java.lang.String grade;
	/**积分*/
	private java.lang.String score;
	/**金币*/
	private java.lang.String currency;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  推荐度
	 */
	@Column(name ="RECOMMEND",nullable=true,precision=10,scale=0)
	public java.lang.Integer getRecommend(){
		return this.recommend;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  推荐度
	 */
	public void setRecommend(java.lang.Integer recommend){
		this.recommend = recommend;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  活跃度
	 */
	@Column(name ="LIVENESS",nullable=true,length=10)
	public java.lang.String getLiveness(){
		return this.liveness;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  活跃度
	 */
	public void setLiveness(java.lang.String liveness){
		this.liveness = liveness;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  访问量
	 */
	@Column(name ="PAGEVIEW",nullable=true,length=10)
	public java.lang.String getPageview(){
		return this.pageview;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  访问量
	 */
	public void setPageview(java.lang.String pageview){
		this.pageview = pageview;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  到期时间
	 */
	@Column(name ="EXPIRATIONDATE",nullable=true)
	public java.util.Date getExpirationdate(){
		return this.expirationdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  到期时间
	 */
	public void setExpirationdate(java.util.Date expirationdate){
		this.expirationdate = expirationdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  0:普通用户1:会员
	 */
	@Column(name ="VIP",nullable=true,length=4)
	public java.lang.String getVip(){
		return this.vip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  0:普通用户1:会员
	 */
	public void setVip(java.lang.String vip){
		this.vip = vip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  等级
	 */
	@Column(name ="GRADE",nullable=true,length=10)
	public java.lang.String getGrade(){
		return this.grade;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  等级
	 */
	public void setGrade(java.lang.String grade){
		this.grade = grade;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  积分
	 */
	@Column(name ="SCORE",nullable=true,length=10)
	public java.lang.String getScore(){
		return this.score;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  积分
	 */
	public void setScore(java.lang.String score){
		this.score = score;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  金币
	 */
	@Column(name ="CURRENCY",nullable=true,length=10)
	public java.lang.String getCurrency(){
		return this.currency;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  金币
	 */
	public void setCurrency(java.lang.String currency){
		this.currency = currency;
	}
}
