package com.changh.jeeipms.cms.entity.order;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.common.entity.student.StudentEntity;

/**   
 * @Title: Entity
 * @Description: 账户明细
 * @author failymiss
 * @date 2013-11-18 14:56:35
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_trade_record", schema = "")
@SuppressWarnings("serial")
public class TradeEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**学员*/
	private StudentEntity student;
	/**收入*/
	private BigDecimal income;
	/**支出*/
	private BigDecimal outlay;
	/**交易时间*/
	private java.util.Date tradeTime;
	/**交易IP*/
	private java.lang.String tradeIp;
	/**币种*/
	private java.lang.Integer tradeCurrency;
	/**类型*/
	private java.lang.Integer tradeType;
	/**操作内容*/
	private java.lang.String userContent;
	/**备注*/
	private java.lang.String tradeContent;
	/**现金结余*/
	private BigDecimal cashBalance;
	/**学习卡结余*/
	private BigDecimal cardBalance;
	
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
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  收入
	 */
	@Column(name ="INCOME",nullable=true,precision=10,scale=2)
	public BigDecimal getIncome(){
		return this.income;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  收入
	 */
	public void setIncome(BigDecimal income){
		this.income = income;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  支出
	 */
	@Column(name ="OUTLAY",nullable=true,precision=10,scale=2)
	public BigDecimal getOutlay(){
		return this.outlay;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  支出
	 */
	public void setOutlay(BigDecimal outlay){
		this.outlay = outlay;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  交易时间
	 */
	@Column(name ="TRADE_TIME",nullable=true)
	public java.util.Date getTradeTime(){
		return this.tradeTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  交易时间
	 */
	public void setTradeTime(java.util.Date tradeTime){
		this.tradeTime = tradeTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  交易IP
	 */
	@Column(name ="TRADE_IP",nullable=true,length=32)
	public java.lang.String getTradeIp(){
		return this.tradeIp;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  交易IP
	 */
	public void setTradeIp(java.lang.String tradeIp){
		this.tradeIp = tradeIp;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  币种
	 */
	@Column(name ="TRADE_CURRENCY",nullable=true,precision=5,scale=0)
	public java.lang.Integer getTradeCurrency(){
		return this.tradeCurrency;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  币种
	 */
	public void setTradeCurrency(java.lang.Integer tradeCurrency){
		this.tradeCurrency = tradeCurrency;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  类型
	 */
	@Column(name ="TRADE_TYPE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getTradeType(){
		return this.tradeType;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  类型
	 */
	public void setTradeType(java.lang.Integer tradeType){
		this.tradeType = tradeType;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作内容
	 */
	@Column(name ="USER_CONTENT",nullable=true,length=200)
	public java.lang.String getUserContent(){
		return this.userContent;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作内容
	 */
	public void setUserContent(java.lang.String userContent){
		this.userContent = userContent;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="TRADE_CONTENT",nullable=true,length=200)
	public java.lang.String getTradeContent(){
		return this.tradeContent;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setTradeContent(java.lang.String tradeContent){
		this.tradeContent = tradeContent;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  现金结余
	 */
	@Column(name ="CASH_BALANCE",nullable=true,precision=10,scale=2)
	public BigDecimal getCashBalance(){
		return this.cashBalance;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  现金结余
	 */
	public void setCashBalance(BigDecimal cashBalance){
		this.cashBalance = cashBalance;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  学习卡结余
	 */
	@Column(name ="CARD_BALANCE",nullable=true,precision=10,scale=2)
	public BigDecimal getCardBalance(){
		return this.cardBalance;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  学习卡结余
	 */
	public void setCardBalance(BigDecimal cardBalance){
		this.cardBalance = cardBalance;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STU_ID")
	public StudentEntity getStudent() {
		return student;
	}
	
	public void setStudent(StudentEntity student) {
		this.student = student;
	}
}
