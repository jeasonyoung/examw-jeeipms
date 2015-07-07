package com.changh.jeeipms.common.entity.card;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 学习卡管理
 * @author failymiss
 * @date 2013-10-13 14:51:36
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_study_card", schema = "")
@SuppressWarnings("serial")
public class StudyCardEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**学员*/
	private java.lang.String stuId;
	/**卡号*/
	private java.lang.String cardNum;
	/**密码*/
	private java.lang.String cardPassword;
	/**面值*/
	private BigDecimal cardValue;
	/**结余*/
	private BigDecimal cardBalance;
	/**添加时间*/
	private java.util.Date addtime;
	/**过期时间*/
	private java.util.Date overtime;
	/**使用时间*/
	private java.util.Date usetime;
	/**0:收费1:免费*/
	private java.lang.Integer isfree;
	
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
	 *@return: java.lang.String  学员
	 */
	@Column(name ="STU_ID",nullable=true,length=32)
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
	 *@return: java.lang.String  卡号
	 */
	@Column(name ="CARD_NUM",nullable=false,length=32)
	public java.lang.String getCardNum(){
		return this.cardNum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  卡号
	 */
	public void setCardNum(java.lang.String cardNum){
		this.cardNum = cardNum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  密码
	 */
	@Column(name ="CARD_PASSWORD",nullable=false,length=31)
	public java.lang.String getCardPassword(){
		return this.cardPassword;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  密码
	 */
	public void setCardPassword(java.lang.String cardPassword){
		this.cardPassword = cardPassword;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  面值
	 */
	@Column(name ="CARD_VALUE",nullable=false,precision=10,scale=2)
	public BigDecimal getCardValue(){
		return this.cardValue;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  面值
	 */
	public void setCardValue(BigDecimal cardValue){
		this.cardValue = cardValue;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  结余
	 */
	@Column(name ="CARD_BALANCE",nullable=true,precision=10,scale=2)
	public BigDecimal getCardBalance(){
		return this.cardBalance;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  结余
	 */
	public void setCardBalance(BigDecimal cardBalance){
		this.cardBalance = cardBalance;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  添加时间
	 */
	@Column(name ="ADDTIME",nullable=false)
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  过期时间
	 */
	@Column(name ="OVERTIME",nullable=false)
	public java.util.Date getOvertime(){
		return this.overtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  过期时间
	 */
	public void setOvertime(java.util.Date overtime){
		this.overtime = overtime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  使用时间
	 */
	@Column(name ="USETIME",nullable=true)
	public java.util.Date getUsetime(){
		return this.usetime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  使用时间
	 */
	public void setUsetime(java.util.Date usetime){
		this.usetime = usetime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  0:收费1:免费
	 */
	@Column(name ="ISFREE",nullable=false,precision=5,scale=0)
	public java.lang.Integer getIsfree(){
		return this.isfree;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  0:收费1:免费
	 */
	public void setIsfree(java.lang.Integer isfree){
		this.isfree = isfree;
	}
}
