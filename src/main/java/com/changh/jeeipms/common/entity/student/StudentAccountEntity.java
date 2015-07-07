package com.changh.jeeipms.common.entity.student;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.core.util.oConvertUtils;

/**   
 * @Title: Entity
 * @Description: 学员账户
 * @author failymiss
 * @date 2013-10-14 14:50:08
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_student_account", schema = "")
@Inheritance(strategy = InheritanceType.JOINED)
@SuppressWarnings("serial")
public class StudentAccountEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**学习卡金额*/
	private BigDecimal studycard;
	/**现金*/
	private BigDecimal cash;
	/**等级*/
	private java.lang.Integer grade;
	/**用户组*/
	private java.lang.Integer usergroup;
	/**个性签名*/
	private java.lang.String autograph;
	
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  学习卡金额
	 */
	@Column(name ="STUDYCARD",nullable=true,precision=10,scale=0)
	public BigDecimal getStudycard(){
		return this.studycard;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  学习卡金额
	 */
	public void setStudycard(BigDecimal studycard){
		this.studycard = oConvertUtils._4out5in(studycard);
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  现金
	 */
	@Column(name ="CASH",nullable=true,precision=10,scale=0)
	public BigDecimal getCash(){
		return this.cash;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  现金
	 */
	public void setCash(BigDecimal cash){
		this.cash = oConvertUtils._4out5in(cash);
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  等级
	 */
	@Column(name ="GRADE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getGrade(){
		return this.grade;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  等级
	 */
	public void setGrade(java.lang.Integer grade){
		this.grade = grade;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  用户组
	 */
	@Column(name ="USERGROUP",nullable=true,precision=5,scale=0)
	public java.lang.Integer getUsergroup(){
		return this.usergroup;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  用户组
	 */
	public void setUsergroup(java.lang.Integer usergroup){
		this.usergroup = usergroup;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  个性签名
	 */
	@Column(name ="AUTOGRAPH",nullable=true,length=255)
	public java.lang.String getAutograph(){
		return this.autograph;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  个性签名
	 */
	public void setAutograph(java.lang.String autograph){
		this.autograph = autograph;
	}
}
