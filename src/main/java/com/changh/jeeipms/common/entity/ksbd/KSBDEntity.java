package com.changh.jeeipms.common.entity.ksbd;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 考试宝典
 * @author failymiss
 * @date 2013-12-30 16:25:41
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_ksbd", schema = "")
@SuppressWarnings("serial")
public class KSBDEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**考试类别*/
	private java.lang.String classId;
	/**宝典英文名*/
	private java.lang.String ksbdEname;
	/**宝典中文名*/
	private java.lang.String ksbdCname;
	/**价格*/
	private BigDecimal price;
	/**版本*/
	private java.lang.String ksbdVersion;
	/**优惠价*/
	private BigDecimal goodPrice;
	/**保存路径*/
	private java.lang.String savepath;
	/**试题数*/
	private java.lang.Integer questionNum;
	/**下载次数*/
	private java.lang.Integer downNum;
	/**更新时间*/
	private java.util.Date updateTime;
	/**电信下载*/
	private java.lang.String dxUrl;
	/**网通下载*/
	private java.lang.String wtUrl;
	/**宝典简介*/
	private java.lang.String ksbdDescr;
	/**宝典介绍*/
	private java.lang.String ksbdIntro;
	/**关键字*/
	private java.lang.String keywords;
	/**模板*/
	private java.lang.String ksbdTemp;
	/**添加时间*/
	private java.util.Date addTime;
	/**标题*/
	private java.lang.String ksbdTitle;
	/**历年真题*/
	private java.lang.Integer realQuestion;
	/**是否解析*/
	private java.lang.Integer ifAnalysis;
	/**图片地址*/
	private java.lang.String imgUrl;
	/**域名*/
	private java.lang.String ksbdDomain;
	
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
	 *@return: java.lang.String  宝典英文名
	 */
	@Column(name ="KSBD_ENAME",nullable=true,length=100)
	public java.lang.String getKsbdEname(){
		return this.ksbdEname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  宝典英文名
	 */
	public void setKsbdEname(java.lang.String ksbdEname){
		this.ksbdEname = ksbdEname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  宝典中文名
	 */
	@Column(name ="KSBD_CNAME",nullable=true,length=100)
	public java.lang.String getKsbdCname(){
		return this.ksbdCname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  宝典中文名
	 */
	public void setKsbdCname(java.lang.String ksbdCname){
		this.ksbdCname = ksbdCname;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  价格
	 */
	@Column(name ="PRICE",nullable=true,precision=10,scale=2)
	public BigDecimal getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  价格
	 */
	public void setPrice(BigDecimal price){
		this.price = price;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  版本
	 */
	@Column(name ="KSBD_VERSION",nullable=true,length=20)
	public java.lang.String getKsbdVersion(){
		return this.ksbdVersion;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  版本
	 */
	public void setKsbdVersion(java.lang.String ksbdVersion){
		this.ksbdVersion = ksbdVersion;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  优惠价
	 */
	@Column(name ="GOOD_PRICE",nullable=true,precision=10,scale=2)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  保存路径
	 */
	@Column(name ="SAVEPATH",nullable=false,length=250)
	public java.lang.String getSavepath(){
		return this.savepath;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  保存路径
	 */
	public void setSavepath(java.lang.String savepath){
		this.savepath = savepath;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  试题数
	 */
	@Column(name ="QUESTION_NUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getQuestionNum(){
		return this.questionNum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  试题数
	 */
	public void setQuestionNum(java.lang.Integer questionNum){
		this.questionNum = questionNum;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  下载次数
	 */
	@Column(name ="DOWN_NUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDownNum(){
		return this.downNum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  下载次数
	 */
	public void setDownNum(java.lang.Integer downNum){
		this.downNum = downNum;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新时间
	 */
	@Column(name ="UPDATE_TIME",nullable=false)
	public java.util.Date getUpdateTime(){
		return this.updateTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新时间
	 */
	public void setUpdateTime(java.util.Date updateTime){
		this.updateTime = updateTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电信下载
	 */
	@Column(name ="DX_URL",nullable=true,length=300)
	public java.lang.String getDxUrl(){
		return this.dxUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电信下载
	 */
	public void setDxUrl(java.lang.String dxUrl){
		this.dxUrl = dxUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  网通下载
	 */
	@Column(name ="WT_URL",nullable=true,length=300)
	public java.lang.String getWtUrl(){
		return this.wtUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  网通下载
	 */
	public void setWtUrl(java.lang.String wtUrl){
		this.wtUrl = wtUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  宝典简介
	 */
	@Column(name ="KSBD_DESCR",nullable=true,length=65535)
	public java.lang.String getKsbdDescr(){
		return this.ksbdDescr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  宝典简介
	 */
	public void setKsbdDescr(java.lang.String ksbdDescr){
		this.ksbdDescr = ksbdDescr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  宝典介绍
	 */
	@Column(name ="KSBD_INTRO",nullable=true,length=65535)
	public java.lang.String getKsbdIntro(){
		return this.ksbdIntro;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  宝典介绍
	 */
	public void setKsbdIntro(java.lang.String ksbdIntro){
		this.ksbdIntro = ksbdIntro;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  关键字
	 */
	@Column(name ="KEYWORDS",nullable=true,length=400)
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
	 *@return: java.lang.String  模板
	 */
	@Column(name ="KSBD_TEMP",nullable=true,length=200)
	public java.lang.String getKsbdTemp(){
		return this.ksbdTemp;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  模板
	 */
	public void setKsbdTemp(java.lang.String ksbdTemp){
		this.ksbdTemp = ksbdTemp;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="KSBD_TITLE",nullable=false,length=400)
	public java.lang.String getKsbdTitle(){
		return this.ksbdTitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标题
	 */
	public void setKsbdTitle(java.lang.String ksbdTitle){
		this.ksbdTitle = ksbdTitle;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  历年真题
	 */
	@Column(name ="REAL_QUESTION",nullable=true,precision=5,scale=0)
	public java.lang.Integer getRealQuestion(){
		return this.realQuestion;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  历年真题
	 */
	public void setRealQuestion(java.lang.Integer realQuestion){
		this.realQuestion = realQuestion;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  是否解析
	 */
	@Column(name ="IF_ANALYSIS",nullable=true,precision=5,scale=0)
	public java.lang.Integer getIfAnalysis(){
		return this.ifAnalysis;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  是否解析
	 */
	public void setIfAnalysis(java.lang.Integer ifAnalysis){
		this.ifAnalysis = ifAnalysis;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片地址
	 */
	@Column(name ="IMG_URL",nullable=true,length=300)
	public java.lang.String getImgUrl(){
		return this.imgUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片地址
	 */
	public void setImgUrl(java.lang.String imgUrl){
		this.imgUrl = imgUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  域名
	 */
	@Column(name ="KSBD_DOMAIN",nullable=true,length=100)
	public java.lang.String getKsbdDomain(){
		return this.ksbdDomain;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  域名
	 */
	public void setKsbdDomain(java.lang.String ksbdDomain){
		this.ksbdDomain = ksbdDomain;
	}
}
