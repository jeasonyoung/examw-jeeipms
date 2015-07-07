package com.changh.jeeipms.common.entity.paper;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.core.constant.Globals;

import com.changh.jeeipms.common.entity.agency.AgencyEntity;

/**   
 * @Title: Entity
 * @Description: 试卷表
 * @author vigo
 * @date 2014-04-24 10:35:27
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_course", schema = "")	//使用表agency_course
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class PaperEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**试卷名称*/
	private java.lang.String paperName;
	private java.lang.String coursetype = Globals.PAPER;
	/**考试时间*/
	private java.lang.Integer paperTime;
	/**试卷总分*/
	private java.lang.Integer paperScore;
	/**来源*/
	private java.lang.String paperSource;
	/**难度*/
//	private java.lang.Integer paperLevel;
	/**创建人*/
//	private java.lang.String createBy;
	/**创建时间*/
	private java.util.Date createDate;
	/**修改人*/
	//private java.lang.String updateBy;
	/**修改时间*/
	private java.util.Date updateDate;
	/**试卷类型*/
//	private java.lang.Integer paperType;
	/**试卷价格*/
	private BigDecimal paperPrice;
	private BigDecimal oldPrice;
	/**状态*/
	private java.lang.Integer status;
	/**科目*/
//	private java.lang.String courseId;
	/**删除标记*/
//	private java.lang.Integer delFlag;
	/**期限*/
//	private java.util.Date paperExpire;
	/**试卷地址*/
	private java.lang.String paperUrl;
	/**试卷简介*/
	private java.lang.String paperSummary;
	/**试卷描述*/
	private java.lang.String paperDescr;
	/**机构ID*/
	private AgencyEntity agency;
	
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
	 *@return: java.lang.String  试卷名称
	 */
	@Column(name ="COURSENAME",nullable=false,length=100)
	public java.lang.String getPaperName(){
		return this.paperName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  试卷名称
	 */
	public void setPaperName(java.lang.String paperName){
		this.paperName = paperName;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  考试时间
	 */
	@Column(name ="BUYCOUNT",nullable=true,precision=10,scale=0)
	public java.lang.Integer getPaperTime(){
		return this.paperTime;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  考试时间
	 */
	public void setPaperTime(java.lang.Integer paperTime){
		this.paperTime = paperTime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  试卷总分
	 */
	@Column(name ="COMMENTCOUNT",nullable=true,precision=10,scale=0)
	public java.lang.Integer getPaperScore(){
		return this.paperScore;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  试卷总分
	 */
	public void setPaperScore(java.lang.Integer paperScore){
		this.paperScore = paperScore;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  来源
	 */
	@Column(name ="CONTENT",nullable=true,length=100)
	public java.lang.String getPaperSource(){
		return this.paperSource;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  来源
	 */
	public void setPaperSource(java.lang.String paperSource){
		this.paperSource = paperSource;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  难度
	 */
//	@Column(name ="PAPER_LEVEL",nullable=true,precision=10,scale=0)
//	public java.lang.Integer getPaperLevel(){
//		return this.paperLevel;
//	}
//
//	/**
//	 *方法: 设置java.lang.Integer
//	 *@param: java.lang.Integer  难度
//	 */
//	public void setPaperLevel(java.lang.Integer paperLevel){
//		this.paperLevel = paperLevel;
//	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人
	 */
//	@Column(name ="CREATE_BY",nullable=false,length=100)
//	public java.lang.String getCreateBy(){
//		return this.createBy;
//	}
//
//	/**
//	 *方法: 设置java.lang.String
//	 *@param: java.lang.String  创建人
//	 */
//	public void setCreateBy(java.lang.String createBy){
//		this.createBy = createBy;
//	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getCreateDate(){
		return this.createDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建时间
	 */
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
//	/**
//	 *方法: 取得java.lang.String
//	 *@return: java.lang.String  修改人
//	 */
//	@Column(name ="UPDATE_BY",nullable=true,length=100)
//	public java.lang.String getUpdateBy(){
//		return this.updateBy;
//	}
//
//	/**
//	 *方法: 设置java.lang.String
//	 *@param: java.lang.String  修改人
//	 */
//	public void setUpdateBy(java.lang.String updateBy){
//		this.updateBy = updateBy;
//	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  修改时间
	 */
	@Column(name ="UPDATETIME",nullable=true)
	public java.util.Date getUpdateDate(){
		return this.updateDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  修改时间
	 */
	public void setUpdateDate(java.util.Date updateDate){
		this.updateDate = updateDate;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  试卷类型
	 */
//	@Column(name ="PAPER_TYPE",nullable=true,precision=10,scale=0)
//	public java.lang.Integer getPaperType(){
//		return this.paperType;
//	}
//
//	/**
//	 *方法: 设置java.lang.Integer
//	 *@param: java.lang.Integer  试卷类型
//	 */
//	public void setPaperType(java.lang.Integer paperType){
//		this.paperType = paperType;
//	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  试卷价格
	 */
	@Column(name ="FAVORABLEPRICE",nullable=false,precision=10,scale=2)
	public BigDecimal getPaperPrice(){
		return this.paperPrice;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  试卷价格
	 */
	public void setPaperPrice(BigDecimal paperPrice){
		this.paperPrice = paperPrice;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  状态
	 */
	@Column(name ="STATUS",nullable=false,precision=10,scale=0)
	public java.lang.Integer getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  状态
	 */
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  科目
//	 */
//	@Column(name ="COURSE_ID",nullable=true,length=32)
//	public java.lang.String getCourseId(){
//		return this.courseId;
//	}
//
//	/**
//	 *方法: 设置java.lang.String
//	 *@param: java.lang.String  科目
//	 */
//	public void setCourseId(java.lang.String courseId){
//		this.courseId = courseId;
//	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  删除标记
	 */
//	@Column(name ="DEL_FLAG",nullable=true,precision=10,scale=0)
//	public java.lang.Integer getDelFlag(){
//		return this.delFlag;
//	}
//
//	/**
//	 *方法: 设置java.lang.Integer
//	 *@param: java.lang.Integer  删除标记
//	 */
//	public void setDelFlag(java.lang.Integer delFlag){
//		this.delFlag = delFlag;
//	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  期限
	 */
//	@Column(name ="PAPER_EXPIRE",nullable=true)
//	public java.util.Date getPaperExpire(){
//		return this.paperExpire;
//	}
//
//	/**
//	 *方法: 设置java.util.Date
//	 *@param: java.util.Date  期限
//	 */
//	public void setPaperExpire(java.util.Date paperExpire){
//		this.paperExpire = paperExpire;
//	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  试卷地址
	 */
	@Column(name ="AUDITION",nullable=true,length=256)
	public java.lang.String getPaperUrl(){
		return this.paperUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  试卷地址
	 */
	public void setPaperUrl(java.lang.String paperUrl){
		this.paperUrl = paperUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  试卷简介
	 */
	@Column(name ="SUMMARY",nullable=true,length=512)
	public java.lang.String getPaperSummary(){
		return this.paperSummary;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  试卷简介
	 */
	public void setPaperSummary(java.lang.String paperSummary){
		this.paperSummary = paperSummary;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  试卷描述
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=65535)
	public java.lang.String getPaperDescr(){
		return this.paperDescr;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  试卷描述
	 */
	public void setPaperDescr(java.lang.String paperDescr){
		this.paperDescr = paperDescr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  机构ID
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="agencyid")
	public AgencyEntity getAgency() {
		return agency;
	}

	public void setAgency(AgencyEntity agency) {
		this.agency = agency;
	}
	@Column(name ="COURSETYPE",nullable=false,length=10)
	public java.lang.String getCoursetype() {
		return coursetype;
	}

	public void setCoursetype(java.lang.String coursetype) {
		this.coursetype = coursetype;
	}
	@Column(name ="PRICE",nullable=false,precision=10,scale=2)
	public BigDecimal getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(BigDecimal oldPrice) {
		this.oldPrice = oldPrice;
	}
}
