package com.changh.jeeipms.common.entity.exam;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.ksbd.KSBDEntity;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 考试类别
 * @author failymiss
 * @date 2013-12-31 11:16:36
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_exam_category", schema = "")
@SuppressWarnings("serial")
public class ExamCategoryEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**考试类别*/
	private java.lang.String classId;
	/**考试英文名*/
	private java.lang.String examEname;
	/**考试中文名*/
	private java.lang.String examCname;
	/**上级考试*/
	private ExamCategoryEntity pexam;
	/**下级数量*/
	private java.lang.Integer childNum;
	/**删除标记*/
	private java.lang.Integer delFlag;
	/**添加时间*/
	private java.util.Date addTime;
	/**排序*/
	private java.lang.Integer orderId;
	/**描述*/
	private java.lang.String examDesc;
	/**标题*/
	private java.lang.String examTitle;
	/**关键字*/
	private java.lang.String examKeywords;
	
	/**下级考试*/
	private List<ExamCategoryEntity> examList = new ArrayList<ExamCategoryEntity>();
	/**考试宝典*/
	private List<KSBDEntity> ksbd = new ArrayList<KSBDEntity>();
	
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
	 *@return: java.lang.String  考试类别
	 */
	@Column(name ="CLASS_ID",nullable=false,length=32)
	public java.lang.String getClassId(){
		return this.classId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  考试类别
	 */
	public void setClassId(java.lang.String classId){
		this.classId = classId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  考试英文名
	 */
	@Column(name ="EXAM_ENAME",nullable=true,length=100)
	public java.lang.String getExamEname(){
		return this.examEname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  考试英文名
	 */
	public void setExamEname(java.lang.String examEname){
		this.examEname = examEname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  考试中文名
	 */
	@Column(name ="EXAM_CNAME",nullable=true,length=100)
	public java.lang.String getExamCname(){
		return this.examCname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  考试中文名
	 */
	public void setExamCname(java.lang.String examCname){
		this.examCname = examCname;
	}
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  下级数量
	 */
	@Column(name ="CHILD_NUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getChildNum(){
		return this.childNum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  下级数量
	 */
	public void setChildNum(java.lang.Integer childNum){
		this.childNum = childNum;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  删除标记
	 */
	@Column(name ="DEL_FLAG",nullable=true,precision=5,scale=0)
	public java.lang.Integer getDelFlag(){
		return this.delFlag;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  删除标记
	 */
	public void setDelFlag(java.lang.Integer delFlag){
		this.delFlag = delFlag;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  添加时间
	 */
	@Column(name ="ADD_TIME",nullable=false)
	public java.util.Date getAddTime(){
		return this.addTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  添加时间
	 */
	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  排序
	 */
	@Column(name ="ORDER_ID",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOrderId(){
		return this.orderId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  排序
	 */
	public void setOrderId(java.lang.Integer orderId){
		this.orderId = orderId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  描述
	 */
	@Column(name ="EXAM_DESC",nullable=true,length=65535)
	public java.lang.String getExamDesc(){
		return this.examDesc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  描述
	 */
	public void setExamDesc(java.lang.String examDesc){
		this.examDesc = examDesc;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="EXAM_TITLE",nullable=true,length=65535)
	public java.lang.String getExamTitle(){
		return this.examTitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标题
	 */
	public void setExamTitle(java.lang.String examTitle){
		this.examTitle = examTitle;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  关键字
	 */
	@Column(name ="EXAM_KEYWORDS",nullable=true,length=500)
	public java.lang.String getExamKeywords(){
		return this.examKeywords;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  关键字
	 */
	public void setExamKeywords(java.lang.String examKeywords){
		this.examKeywords = examKeywords;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "pexam")
	public List<ExamCategoryEntity> getExamList() {
		return examList;
	}

	public void setExamList(List<ExamCategoryEntity> examList) {
		for (Iterator<ExamCategoryEntity> it = examList.iterator(); it.hasNext();) {   
		ExamCategoryEntity exam = (ExamCategoryEntity)it.next();  
		if (exam.getKsbd().size()==0){  
			it.remove();    
			}  
		} 
		this.examList = examList;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_ID")
	public ExamCategoryEntity getPexam() {
		return pexam;
	}

	public void setPexam(ExamCategoryEntity pexam) {
		this.pexam = pexam;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "classId")
	public List<KSBDEntity> getKsbd() {
		return ksbd;
	}

	public void setKsbd(List<KSBDEntity> ksbd) {
		this.ksbd = ksbd;
	}
}
