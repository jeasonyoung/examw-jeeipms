package com.changh.jeeipms.common.entity.agency;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.core.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 咨询学员
 * @author failymiss
 * @date 2013-08-08 16:30:15
 * @version V1.0   
 *
 */
@Entity
@Table(name = "agency_student", schema = "")
@SuppressWarnings("serial")
public class AgencyStudentEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/*@Excel(exportName="咨询机构", exportConvertSign = 0, exportFieldWidth = 30, importConvertSign = 0)
	private String agencyname;*/
	/**真实姓名*/
	@Excel(exportName="学员姓名", exportConvertSign = 0, exportFieldWidth = 10, importConvertSign = 0)
	private java.lang.String realname;
	/**电话号码*/
	@Excel(exportName="电话号码", exportConvertSign = 0, exportFieldWidth = 20, importConvertSign = 0)
	private java.lang.String phone;
	/**联系QQ*/
	@Excel(exportName="联系QQ", exportConvertSign = 0, exportFieldWidth = 20, importConvertSign = 0)
	private java.lang.String qq;
	/**电子邮箱*/
	@Excel(exportName="电子邮箱", exportConvertSign = 0, exportFieldWidth = 20, importConvertSign = 0)
	private java.lang.String email;
	/**状态*/
	@Excel(exportName="状态", exportConvertSign = 1, exportFieldWidth = 10, importConvertSign = 0)
	private java.lang.Integer status;
	/**咨询课程*/
	@Excel(exportName="咨询课程", exportConvertSign = 0, exportFieldWidth = 20, importConvertSign = 0)
	private java.lang.String course;
	/**咨询时间*/
	@Excel(exportName="咨询时间", exportConvertSign = 1, exportFieldWidth = 20, importConvertSign = 0)
	private java.util.Date addtime;
	/**咨询机构*/
	private AgencyParameterEntity agency = new AgencyParameterEntity();
	/**咨询内容*/
	@Excel(exportName="咨询内容", exportConvertSign = 0, exportFieldWidth = 40, importConvertSign = 0)
	private java.lang.String content;
	/**学员地址*/
	@Excel(exportName="学员地址", exportConvertSign = 0, exportFieldWidth = 40, importConvertSign = 0)
	private java.lang.String address;
	static DateFormat dateFormaterCreatedt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
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
	
	public String convertGetStatus(){
		if (this.status == 0) {
			return "未处理";
		} else if(this.status == 1){
			return "跟踪中";
		}else if(this.status == 2){
			return "已报名";
		}else{
			return "不报名";
		}
			
	}
	public String convertGetAddtime() {
		if (this.addtime != null) {
			return dateFormaterCreatedt.format(getAddtime());
		} else
			return "";
	}
	public void convertSetAddtime(String addtime) {
		if (addtime != null) {
			try {
				this.addtime = dateFormaterCreatedt.parse(addtime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "agencyid")
	public AgencyParameterEntity getAgency() {
		return agency;
	}
	/**
	 * 方法：设置培训机构
	 * @param agency
	 */
	public void setAgency(AgencyParameterEntity agency) {
		this.agency = agency;
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
	 *@return: java.lang.String  真实姓名
	 */
	@Column(name ="REALNAME",nullable=true,length=50)
	public java.lang.String getRealname(){
		return this.realname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  真实姓名
	 */
	public void setRealname(java.lang.String realname){
		this.realname = realname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电话号码
	 */
	@Column(name ="PHONE",nullable=true,length=30)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电话号码
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系QQ
	 */
	@Column(name ="QQ",nullable=true,length=30)
	public java.lang.String getQq(){
		return this.qq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系QQ
	 */
	public void setQq(java.lang.String qq){
		this.qq = qq;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电子邮箱
	 */
	@Column(name ="EMAIL",nullable=true,length=50)
	public java.lang.String getEmail(){
		return this.email;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电子邮箱
	 */
	public void setEmail(java.lang.String email){
		this.email = email;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学员地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=255)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学员地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
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
	 *@return: java.lang.String  咨询课程
	 */
	@Column(name ="COURSE",nullable=false,length=32)
	public java.lang.String getCourse(){
		return this.course;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  咨询课程
	 */
	public void setCourse(java.lang.String course){
		this.course = course;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  咨询内容
	 */
	@Column(name ="CONTENT",nullable=true,length=65535)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.Object  咨询内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  咨询时间
	 */
	@Column(name ="ADDTIME",nullable=true)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  咨询时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
}
