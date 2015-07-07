package com.changh.jeeipms.common.entity.jeecg;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 订单主数据
 * @author zhangdaihao
 * @date 2013-10-30 14:41:27
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_order_main", schema = "")
@SuppressWarnings("serial")
public class OrderMainEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**订单号*/
	private java.lang.String orderCode;
	/**订单类型*/
	private java.lang.Integer orderType;
	/**订单状态*/
	private java.lang.Integer orderStatus;
	/**学员*/
	private java.lang.String stuId;
	/**支付现金*/
	private java.lang.Integer orderCashmoney;
	/**支付学习卡*/
	private java.lang.Integer orderCards;
	/**下单时间*/
	private java.util.Date orderAddtime;
	/**支付时间*/
	private java.util.Date orderPaytime;
	/**联系人*/
	private java.lang.String contactName;
	/**手机*/
	private java.lang.String telphone;
	/**总价(不含返款)*/
	private BigDecimal totalPrice;
	/**返款*/
	private BigDecimal returnPrice;
	/**备注*/
	private java.lang.String orderContent;
	/**修改人*/
	private java.lang.String modifier;
	/**修改人名字*/
	private java.lang.String modifierName;
	/**修改时间*/
	private java.util.Date modifyDt;
	/**删除标记*/
	private java.lang.Integer delflag;
	/**删除时间*/
	private java.util.Date delDt;
	
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
	 *@return: java.lang.String  订单号
	 */
	@Column(name ="ORDER_CODE",nullable=false,length=32)
	public java.lang.String getOrderCode(){
		return this.orderCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单号
	 */
	public void setOrderCode(java.lang.String orderCode){
		this.orderCode = orderCode;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  订单类型
	 */
	@Column(name ="ORDER_TYPE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getOrderType(){
		return this.orderType;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  订单类型
	 */
	public void setOrderType(java.lang.Integer orderType){
		this.orderType = orderType;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  订单状态
	 */
	@Column(name ="ORDER_STATUS",nullable=false,precision=10,scale=0)
	public java.lang.Integer getOrderStatus(){
		return this.orderStatus;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  订单状态
	 */
	public void setOrderStatus(java.lang.Integer orderStatus){
		this.orderStatus = orderStatus;
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  支付现金
	 */
	@Column(name ="ORDER_CASHMONEY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOrderCashmoney(){
		return this.orderCashmoney;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  支付现金
	 */
	public void setOrderCashmoney(java.lang.Integer orderCashmoney){
		this.orderCashmoney = orderCashmoney;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  支付学习卡
	 */
	@Column(name ="ORDER_CARDS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOrderCards(){
		return this.orderCards;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  支付学习卡
	 */
	public void setOrderCards(java.lang.Integer orderCards){
		this.orderCards = orderCards;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  下单时间
	 */
	@Column(name ="ORDER_ADDTIME",nullable=false)
	public java.util.Date getOrderAddtime(){
		return this.orderAddtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  下单时间
	 */
	public void setOrderAddtime(java.util.Date orderAddtime){
		this.orderAddtime = orderAddtime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  支付时间
	 */
	@Column(name ="ORDER_PAYTIME",nullable=true)
	public java.util.Date getOrderPaytime(){
		return this.orderPaytime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  支付时间
	 */
	public void setOrderPaytime(java.util.Date orderPaytime){
		this.orderPaytime = orderPaytime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系人
	 */
	@Column(name ="CONTACT_NAME",nullable=false,length=50)
	public java.lang.String getContactName(){
		return this.contactName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系人
	 */
	public void setContactName(java.lang.String contactName){
		this.contactName = contactName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  手机
	 */
	@Column(name ="TELPHONE",nullable=true,length=20)
	public java.lang.String getTelphone(){
		return this.telphone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  手机
	 */
	public void setTelphone(java.lang.String telphone){
		this.telphone = telphone;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  总价(不含返款)
	 */
	@Column(name ="TOTAL_PRICE",nullable=false,precision=10,scale=2)
	public BigDecimal getTotalPrice(){
		return this.totalPrice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  总价(不含返款)
	 */
	public void setTotalPrice(BigDecimal totalPrice){
		this.totalPrice = totalPrice;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  返款
	 */
	@Column(name ="RETURN_PRICE",nullable=true,precision=10,scale=2)
	public BigDecimal getReturnPrice(){
		return this.returnPrice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  返款
	 */
	public void setReturnPrice(BigDecimal returnPrice){
		this.returnPrice = returnPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="ORDER_CONTENT",nullable=true,length=200)
	public java.lang.String getOrderContent(){
		return this.orderContent;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setOrderContent(java.lang.String orderContent){
		this.orderContent = orderContent;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  修改人
	 */
	@Column(name ="MODIFIER",nullable=true,length=32)
	public java.lang.String getModifier(){
		return this.modifier;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  修改人
	 */
	public void setModifier(java.lang.String modifier){
		this.modifier = modifier;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  修改人名字
	 */
	@Column(name ="MODIFIER_NAME",nullable=true,length=32)
	public java.lang.String getModifierName(){
		return this.modifierName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  修改人名字
	 */
	public void setModifierName(java.lang.String modifierName){
		this.modifierName = modifierName;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  修改时间
	 */
	@Column(name ="MODIFY_DT",nullable=true)
	public java.util.Date getModifyDt(){
		return this.modifyDt;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  修改时间
	 */
	public void setModifyDt(java.util.Date modifyDt){
		this.modifyDt = modifyDt;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  删除标记
	 */
	@Column(name ="DELFLAG",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDelflag(){
		return this.delflag;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  删除标记
	 */
	public void setDelflag(java.lang.Integer delflag){
		this.delflag = delflag;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  删除时间
	 */
	@Column(name ="DEL_DT",nullable=true)
	public java.util.Date getDelDt(){
		return this.delDt;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  删除时间
	 */
	public void setDelDt(java.util.Date delDt){
		this.delDt = delDt;
	}
}
