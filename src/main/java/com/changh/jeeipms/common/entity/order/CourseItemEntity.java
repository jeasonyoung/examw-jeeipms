package com.changh.jeeipms.common.entity.order;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.common.entity.agency.CourseEntity;

/**   
 * @Title: Entity
 * @Description: 订单详细
 * @author failymiss
 * @date 2013-10-07 14:19:11
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_order_item", schema = "")
@SuppressWarnings("serial")
public class CourseItemEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**所属订单*/
	private CourseOrderEntity order = new CourseOrderEntity();
	/**课程*/
	private CourseEntity course = new CourseEntity();
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
	/**
	 * 关联订单
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORDER_ID")
	@JsonIgnore
	public CourseOrderEntity getOrder() {
		return order;
	}

	public void setOrder(CourseOrderEntity order) {
		this.order = order;
	}
	/**
	 * 关联课程
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COURSE_ID")
	@JsonIgnore
	public CourseEntity getCourse() {
		return course;
	}

	public void setCourse(CourseEntity course) {
		this.course = course;
	}
}
