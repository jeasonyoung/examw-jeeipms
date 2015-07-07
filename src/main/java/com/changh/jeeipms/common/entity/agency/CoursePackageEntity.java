package com.changh.jeeipms.common.entity.agency;

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

import com.changh.jeeipms.common.entity.area.ProvinceEntity;

/**   
 * @Title: Entity
 * @Description: 套餐管理
 * @author failymiss
 * @date 2014-03-04 15:16:09
 * @version V1.0   
 *
 */
@Entity
@Table(name = "course_package", schema = "")
@SuppressWarnings("serial")
public class CoursePackageEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**协议*/
	private java.lang.String dealId;
	/**套餐名称*/
	private java.lang.String pkgName;
	/**所属机构*/
	private AgencyEntity agency;
	/**类别*/
	private CourseCategoryEntity category ;
	/**试听*/
	private java.lang.String audition;
	/**图片地址*/
	private java.lang.String imageurl;
	/**包含课程*/
	private java.lang.String courseIds;
	/**省份*/
	private ProvinceEntity province;
	/**原价*/
	private BigDecimal pkgPrice;
	/**优惠价*/
	private BigDecimal goodPrice;
	/**课程摘要*/
	private java.lang.String summary;
	/**介绍*/
	private java.lang.String pkgDescri;
	/**课时*/
	private java.lang.Integer pkgTime;
	/**到期时间*/
	private java.util.Date dueTime;
	/**修改时间*/
	private java.util.Date updatetime;
	/**添加时间*/
	private java.util.Date addtime;
	/**添加人*/
	private java.lang.String addby;
	/**修改人*/
	private java.lang.String updateby;
	/**状态*/
	private java.lang.Integer status;
	
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
	 *@return: java.lang.String  协议
	 */
	@Column(name ="DEAL_ID",nullable=true,length=32)
	public java.lang.String getDealId(){
		return this.dealId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  协议
	 */
	public void setDealId(java.lang.String dealId){
		this.dealId = dealId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  套餐名称
	 */
	@Column(name ="PKG_NAME",nullable=false,length=200)
	public java.lang.String getPkgName(){
		return this.pkgName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  套餐名称
	 */
	public void setPkgName(java.lang.String pkgName){
		this.pkgName = pkgName;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  原价
	 */
	@Column(name ="PKG_PRICE",nullable=false,precision=10,scale=2)
	public BigDecimal getPkgPrice(){
		return this.pkgPrice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  原价
	 */
	public void setPkgPrice(BigDecimal pkgPrice){
		this.pkgPrice = pkgPrice;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  优惠价
	 */
	@Column(name ="GOOD_PRICE",nullable=false,precision=10,scale=2)
	public BigDecimal getGoodPrice(){
		return this.goodPrice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  优惠价
	 */
	public void setGoodPrice(BigDecimal goodPrice){
		this.goodPrice = goodPrice;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  介绍
	 */
	@Column(name ="PKG_DESCRI",nullable=false,length=65535)
	public java.lang.String getPkgDescri(){
		return this.pkgDescri;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  介绍
	 */
	public void setPkgDescri(java.lang.String pkgDescri){
		this.pkgDescri = pkgDescri;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  课时
	 */
	@Column(name ="PKG_TIME",nullable=true,precision=5,scale=0)
	public java.lang.Integer getPkgTime(){
		return this.pkgTime;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  课时
	 */
	public void setPkgTime(java.lang.Integer pkgTime){
		this.pkgTime = pkgTime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  到期时间
	 */
	@Column(name ="DUE_TIME",nullable=true)
	public java.util.Date getDueTime(){
		return this.dueTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  到期时间
	 */
	public void setDueTime(java.util.Date dueTime){
		this.dueTime = dueTime;
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
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AGENCY_ID")
	public AgencyEntity getAgency() {
		return agency;
	}

	public void setAgency(AgencyEntity agency) {
		this.agency = agency;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CATEGORY_ID")
	public CourseCategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CourseCategoryEntity category) {
		this.category = category;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROVINCE_ID")
	public ProvinceEntity getProvince() {
		return province;
	}

	public void setProvince(ProvinceEntity province) {
		this.province = province;
	}
	
	@Column(name ="audition",nullable=false,length=200)
	public java.lang.String getAudition() {
		return audition;
	}

	public void setAudition(java.lang.String audition) {
		this.audition = audition;
	}
	
	@Column(name ="imageurl",nullable=false,length=200)
	public java.lang.String getImageurl() {
		return imageurl;
	}

	public void setImageurl(java.lang.String imageurl) {
		this.imageurl = imageurl;
	}
	
	@Column(name ="courseIds",nullable=false,length=500)
	public java.lang.String getCourseIds() {
		return courseIds;
	}

	public void setCourseIds(java.lang.String courseIds) {
		this.courseIds = courseIds;
	}
	
	@Column(name ="summary",nullable=false,length=65535)
	public java.lang.String getSummary() {
		return summary;
	}
	public void setSummary(java.lang.String summary) {
		this.summary = summary;
	}

	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  状态
	 */
	@Column(name ="STATUS",nullable=true,precision=5,scale=0)
	public java.lang.Integer getStatus() {
		return status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}
}
