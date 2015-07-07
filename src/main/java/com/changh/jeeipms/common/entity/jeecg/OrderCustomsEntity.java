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
 * @Description: 订单客户明细
 * @author failymiss
 * @date 2013-10-30 14:41:26
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_order_item", schema = "")
@SuppressWarnings("serial")
public class OrderCustomsEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**所属订单*/
	private java.lang.String orderId;
	/**课程*/
	private java.lang.String courseId;
	/**课程名称*/
	private java.lang.String courseName;
	/**原价*/
	private BigDecimal itemOprice;
	/**优惠价格*/
	private BigDecimal itemRprice;
	/**备注*/
	private java.lang.String itemContent;
	
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
	 *@return: java.lang.String  所属订单
	 */
	@Column(name ="ORDER_ID",nullable=false,length=32)
	public java.lang.String getOrderId(){
		return this.orderId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属订单
	 */
	public void setOrderId(java.lang.String orderId){
		this.orderId = orderId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  课程
	 */
	@Column(name ="COURSE_ID",nullable=false,length=32)
	public java.lang.String getCourseId(){
		return this.courseId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  课程
	 */
	public void setCourseId(java.lang.String courseId){
		this.courseId = courseId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  课程名称
	 */
	@Column(name ="COURSE_NAME",nullable=false,length=100)
	public java.lang.String getCourseName(){
		return this.courseName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  课程名称
	 */
	public void setCourseName(java.lang.String courseName){
		this.courseName = courseName;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  原价
	 */
	@Column(name ="ITEM_OPRICE",nullable=true,precision=10,scale=2)
	public BigDecimal getItemOprice(){
		return this.itemOprice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  原价
	 */
	public void setItemOprice(BigDecimal itemOprice){
		this.itemOprice = itemOprice;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  优惠价格
	 */
	@Column(name ="ITEM_RPRICE",nullable=true,precision=10,scale=2)
	public BigDecimal getItemRprice(){
		return this.itemRprice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  优惠价格
	 */
	public void setItemRprice(BigDecimal itemRprice){
		this.itemRprice = itemRprice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="ITEM_CONTENT",nullable=true,length=200)
	public java.lang.String getItemContent(){
		return this.itemContent;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setItemContent(java.lang.String itemContent){
		this.itemContent = itemContent;
	}
}
