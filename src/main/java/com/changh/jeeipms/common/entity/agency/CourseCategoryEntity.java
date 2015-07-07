package com.changh.jeeipms.common.entity.agency;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 课程分类
 * @author failymiss
 * @date 2013-08-21 15:58:47
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_course_category", schema = "")
@SuppressWarnings("serial")
public class CourseCategoryEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**课程名称*/
	private java.lang.String categoryname;
	/**上级课程*/
	private CourseCategoryEntity  category;
	/**下级课程*/
	private List<CourseCategoryEntity> childcategory = new ArrayList<CourseCategoryEntity>();//下属部门
	/**所有上级*/
	private java.lang.String parentcategoryids="";
	/**图标*/
	private java.lang.String image;
	/**链接地址*/
	private java.lang.String href;
	/**目标*/
	private java.lang.String target;
	/**首页显示*/
	private java.lang.Integer inmenu;
	/**删除标记*/
	private java.lang.Integer delFlag;
	/**备注*/
	private java.lang.String content;
	/**排序*/
	private java.lang.Integer categoryorder;
	/**课程*/
	private List<CourseEntity> courseList = new ArrayList<CourseEntity>();
	
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
	@Column(name ="CATEGORYNAME",nullable=false,length=50)
	public java.lang.String getCategoryname(){
		return this.categoryname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  课程名称
	 */
	public void setCategoryname(java.lang.String categoryname){
		this.categoryname = categoryname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所有上级
	 */
	@Column(name ="PARENTCATEGORYIDS",nullable=true,length=1000)
	public java.lang.String getParentcategoryids(){
		return this.parentcategoryids;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所有上级
	 */
	public void setParentcategoryids(java.lang.String parentcategoryids){
		this.parentcategoryids = parentcategoryids;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图标
	 */
	@Column(name ="IMAGE",nullable=true,length=255)
	public java.lang.String getImage(){
		return this.image;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图标
	 */
	public void setImage(java.lang.String image){
		this.image = image;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  链接地址
	 */
	@Column(name ="HREF",nullable=true,length=255)
	public java.lang.String getHref(){
		return this.href;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  链接地址
	 */
	public void setHref(java.lang.String href){
		this.href = href;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  目标
	 */
	@Column(name ="TARGET",nullable=true,length=20)
	public java.lang.String getTarget(){
		return this.target;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  目标
	 */
	public void setTarget(java.lang.String target){
		this.target = target;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  首页显示
	 */
	@Column(name ="INMENU",nullable=true,precision=5,scale=0)
	public java.lang.Integer getInmenu(){
		return this.inmenu;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  首页显示
	 */
	public void setInmenu(java.lang.Integer inmenu){
		this.inmenu = inmenu;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="CONTENT",nullable=true,length=255)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  排序
	 */
	@Column(name ="CATEGORYORDER",nullable=true,precision=5,scale=0)
	public java.lang.Integer getCategoryorder(){
		return this.categoryorder;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  排序
	 */
	public void setCategoryorder(java.lang.Integer categoryorder){
		this.categoryorder = categoryorder;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentcategoryid")
	public CourseCategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CourseCategoryEntity category) {
		this.category = category;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	public List<CourseCategoryEntity> getChildcategory() {
		return childcategory;
	}

	public void setChildcategory(List<CourseCategoryEntity> childcategory) {
		this.childcategory = childcategory;
	}
	/**
	 * 不存入数据库 方便生成静态页面的时候显示
	 * @return
	 */
	@Transient
	public List<CourseEntity> getCourseList() {
		return courseList;
	}
	@Transient
	public void setCourseList(List<CourseEntity> courseList) {
		this.courseList = courseList;
	}
}
