package com.changh.jeeipms.common.entity.agency;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.common.entity.area.AreaEntity;
import com.changh.jeeipms.common.entity.area.CityEntity;
import com.changh.jeeipms.common.entity.area.ProvinceEntity;

/**   
 * @Title: Entity
 * @Description: 机构管理
 * @author failymiss
 * @date 2013-07-23 10:53:37
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency")
@Inheritance(strategy = InheritanceType.JOINED)
public class AgencyEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**公司名称*/
	private java.lang.String name;
	/**公司摘要*/
	private java.lang.String abbreviation;
	/**所在省份*/
	private ProvinceEntity  province = new ProvinceEntity();
	/**所在城市*/
	private CityEntity  city = new CityEntity();
	/**所在地区*/
	private AreaEntity  area = new AreaEntity();
	/**关键字*/
	private java.lang.String keywords;
	/**培训类别*/
	private java.lang.String category;
	/**培训类别 名称*/
	private java.lang.String categoryname;
	/**公司地址*/
	private java.lang.String address;
	/**办公电话*/
	private java.lang.String officephone;
	/**传真*/
	private java.lang.String fax;
	/**公司简介*/
	private java.lang.String introduction;
	/**注册时间*/
	private java.util.Date createTime;
	/**机构logo*/
	private java.lang.String imageurl;
	/**备注*/
	private java.lang.String content;
	/**0:未处理 1:已处理*/
	private java.lang.String status;
	//2014.03.26增加二级域名属性
	/**二级域名*/
	private java.lang.String secondDomain;
	//2014.03.26增加二级域名属性
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
	 *@return: java.lang.String  公司名称
	 */
	@Column(name ="NAME",nullable=true,length=255)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司名称
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司简称
	 */
	@Column(name ="ABBREVIATION",nullable=true,length=500)
	public java.lang.String getAbbreviation(){
		return this.abbreviation;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司简称
	 */
	public void setAbbreviation(java.lang.String abbreviation){
		this.abbreviation = abbreviation;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "provinceID")
	public ProvinceEntity getProvince() {
		return province;
	}

	public void setProvince(ProvinceEntity province) {
		this.province = province;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cityID")
	public CityEntity getCity() {
		return city;
	}

	public void setCity(CityEntity city) {
		this.city = city;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "areaID")
	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  培训类别
	 */
	@Column(name ="CATEGORY",nullable=true,length=500)
	public java.lang.String getCategory(){
		return this.category;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  培训类别
	 */
	public void setCategory(java.lang.String category){
		this.category = category;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=255)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  办公电话
	 */
	@Column(name ="OFFICEPHONE",nullable=true,length=50)
	public java.lang.String getOfficephone(){
		return this.officephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  办公电话
	 */
	public void setOfficephone(java.lang.String officephone){
		this.officephone = officephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  传真
	 */
	@Column(name ="FAX",nullable=true,length=30)
	public java.lang.String getFax(){
		return this.fax;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  传真
	 */
	public void setFax(java.lang.String fax){
		this.fax = fax;
	}
	public java.lang.String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(java.lang.String introduction) {
		this.introduction = introduction;
	}

	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  注册时间
	 */
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  注册时间
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="CONTENT",nullable=false,length=32)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  0:未处理 1:已处理
	 */
	@Column(name ="STATUS",nullable=true,length=4)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  0:未处理 1:已处理
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	
	@Transient
	public java.lang.String getCategoryname() {
		return categoryname;
	}
	@Transient
	public void setCategoryname(java.lang.String categoryname) {
		this.categoryname = categoryname;
	}
	
	@Override
    public boolean equals(Object o){
        if(this==o){
        return true;
        }
        if(o instanceof AgencyEntity){
        if(((AgencyEntity)o).id==this.id){
            return true;
        }
        }
        return false;
    }
	@Column(name ="IMAGE_URL",nullable=false,length=250)
	public java.lang.String getImageurl() {
		return imageurl;
	}

	public void setImageurl(java.lang.String imageurl) {
		this.imageurl = imageurl;
	}
	@Column(name ="SECOND_DOMAIN",nullable=false,length=32)
	public java.lang.String getSecondDomain() {
		return secondDomain;
	}
	
	public void setSecondDomain(java.lang.String secondDomain) {
		this.secondDomain = secondDomain;
	}
	
}
