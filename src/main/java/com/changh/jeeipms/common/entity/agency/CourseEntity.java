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

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OrderBy;

import com.changh.jeeipms.cms.entity.order.SchoolEntity;
import com.changh.jeeipms.common.entity.area.CityEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;

/**   
 * @Title: Entity
 * @Description: 机构课程
 * @author failymiss
 * @date 2013-08-20 15:23:46
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_course", schema = "")
@SuppressWarnings("serial")
public class CourseEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**课程名称*/
	private java.lang.String coursename;
	/**课程类别*/
	private CourseCategoryEntity category = new CourseCategoryEntity();
	/**课程类型*/
	private java.lang.String coursetype;
	/**关键字*/
	private java.lang.String keywords;
	/**学校*/
	//private java.lang.String agencyid;
	private AgencyEntity agency = new AgencyEntity();
	/**添加时间*/
	private java.util.Date addtime;
	/**是否免费*/
	private java.lang.Integer isfree;
	/**购买量*/
	private java.lang.Integer buycount;
	/**评论数*/
	private java.lang.Integer commentcount;
	/**课程地区*/
	private CityEntity city = new CityEntity();
	/**课程省份*/
	private ProvinceEntity province = new ProvinceEntity();
	/**上课时段*/
	private java.lang.String teachtime;
	/**试听地址*/
	private java.lang.String audition;
	/**学习地点*/
	private java.lang.String places;
	/**课程摘要*/
	private java.lang.String summary;
	/**课程介绍*/
	private java.lang.String description;
	/**原价*/
	private java.lang.String price;
	/**优惠价*/
	private java.lang.String favorableprice;
	/**开班时间*/
	private java.util.Date opentime;
	/**更新时间*/
	private java.util.Date updatetime;
	/**备注*/
	private java.lang.String content;
	/**状态*/
	private java.lang.Integer status;
	/**推荐排序*/
	private java.lang.Integer courseorder;
	/**图片地址*/
	private java.lang.String imageurl;
	/**老师*/
	private TeacherEntity teacher;
	/**课时*/
	private java.lang.Integer period; 
	/**课程视频*/
	private List<VideoEntity> list = new ArrayList<VideoEntity>();
	
	/**在网校的Id*/
	private String courseid;
	
	private SchoolEntity school;
	
	
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
	@Column(name ="COURSENAME",nullable=false,length=50)
	public java.lang.String getCoursename(){
		return this.coursename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  课程名称
	 */
	public void setCoursename(java.lang.String coursename){
		this.coursename = coursename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  课程类型
	 */
	@Column(name ="COURSETYPE",nullable=false,length=10)
	public java.lang.String getCoursetype(){
		return this.coursetype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  课程类型
	 */
	public void setCoursetype(java.lang.String coursetype){
		this.coursetype = coursetype;
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  是否免费
	 */
	@Column(name ="ISFREE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getIsfree(){
		return this.isfree;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  是否免费
	 */
	public void setIsfree(java.lang.Integer isfree){
		this.isfree = isfree;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AREA")
	public CityEntity getCity() {
		return city;
	}
	
	public void setCity(CityEntity city) {
		this.city = city;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  上课时段
	 */
	@Column(name ="TEACHTIME",nullable=true,length=50)
	public java.lang.String getTeachtime(){
		return this.teachtime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  上课时段
	 */
	public void setTeachtime(java.lang.String teachtime){
		this.teachtime = teachtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  试听地址
	 */
	@Column(name ="AUDITION",nullable=true,length=255)
	public java.lang.String getAudition(){
		return this.audition;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  试听地址
	 */
	public void setAudition(java.lang.String audition){
		this.audition = audition;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学习地点
	 */
	@Column(name ="PLACES",nullable=true,length=255)
	public java.lang.String getPlaces(){
		return this.places;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学习地点
	 */
	public void setPlaces(java.lang.String places){
		this.places = places;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  课程介绍
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=65535)
	public java.lang.String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  课程介绍
	 */
	public void setDescription(java.lang.String description){
		this.description = description;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原价
	 */
	@Column(name ="PRICE",nullable=true,length=20)
	public java.lang.String getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原价
	 */
	public void setPrice(java.lang.String price){
		this.price = price;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  优惠价
	 */
	@Column(name ="FAVORABLEPRICE",nullable=true,length=20)
	public java.lang.String getFavorableprice(){
		return this.favorableprice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  优惠价
	 */
	public void setFavorableprice(java.lang.String favorableprice){
		this.favorableprice = favorableprice;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  开班时间
	 */
	@Column(name ="OPENTIME",nullable=true)
	public java.util.Date getOpentime(){
		return this.opentime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  开班时间
	 */
	public void setOpentime(java.util.Date opentime){
		this.opentime = opentime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新时间
	 */
	@Column(name ="UPDATETIME",nullable=true)
	public java.util.Date getUpdatetime(){
		return this.updatetime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新时间
	 */
	public void setUpdatetime(java.util.Date updatetime){
		this.updatetime = updatetime;
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
	 *@return: java.lang.Integer  状态
	 */
	@Column(name ="STATUS",nullable=true,precision=5,scale=0)
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
	 *@return: java.lang.String  推荐排序
	 */
	@Column(name ="COURSEORDER",nullable=true,precision=10,scale=0)
	public java.lang.Integer getCourseorder(){
		return this.courseorder;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  推荐排序
	 */
	public void setCourseorder(java.lang.Integer courseorder){
		this.courseorder = courseorder;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片地址
	 */
	@Column(name ="IMAGEURL",nullable=true,length=100)
	public java.lang.String getImageurl(){
		return this.imageurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片地址
	 */
	public void setImageurl(java.lang.String imageurl){
		this.imageurl = imageurl;
	}
	/**
	 * 类别
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoryid")
	public CourseCategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CourseCategoryEntity category) {
		this.category = category;
	}
	

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  关键字
	 */
	@Column(name ="KEYWORDS",nullable=true,length=255)
	public java.lang.String getKeywords(){
		return this.keywords;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  关键字
	 */
	public void setKeywords(java.lang.String keywords){
		this.keywords = keywords;
	}
	/**
	 * 机构
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "agencyid")
	public AgencyEntity getAgency() {
		return agency;
	}

	public void setAgency(AgencyEntity agency) {
		this.agency = agency;
	}
	/**
	 * 老师
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacherid")
	public TeacherEntity getTeacher() {
		return teacher;
	}

	public void setTeacher(TeacherEntity teacher) {
		this.teacher = teacher;
	}
	@Column(name ="BUYCOUNT",nullable=true,precision=5,scale=0)
	public java.lang.Integer getBuycount() {
		return buycount;
	}

	public void setBuycount(java.lang.Integer buycount) {
		this.buycount = buycount;
	}
	@Column(name ="COMMENTCOUNT",nullable=true,precision=5,scale=0)
	public java.lang.Integer getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(java.lang.Integer commentcount) {
		this.commentcount = commentcount;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "course")
	@OrderBy(clause = "videoorder asc")  
	public List<VideoEntity> getList() {
		return list;
	}

	public void setList(List<VideoEntity> list) {
		this.list = list;
	}
	@Column(name ="SUMMARY",nullable=true,length=500)
	public java.lang.String getSummary() {
		return summary;
	}

	public void setSummary(java.lang.String summary) {
		this.summary = summary;
	}
	@Column(name ="PERIOD",nullable=true,precision=11,scale=0)
	public java.lang.Integer getPeriod() {
		return period;
	}

	public void setPeriod(java.lang.Integer period) {
		this.period = period;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SCHOOL_ID")
	public SchoolEntity getSchool() {
		return school;
	}

	public void setSchool(SchoolEntity school) {
		this.school = school;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  关键字
	 */
	@Column(name ="COURSE_ID",nullable=true,length=32)
	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROVINCE_ID")
	public ProvinceEntity getProvince() {
		return province;
	}

	public void setProvince(ProvinceEntity province) {
		this.province = province;
	}
}