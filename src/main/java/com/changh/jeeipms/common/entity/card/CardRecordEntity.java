package com.changh.jeeipms.common.entity.card;

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

import com.changh.jeeipms.common.entity.student.StudentEntity;

/**   
 * @Title: Entity
 * @Description: 学习卡流水
 * @author failymiss
 * @date 2013-10-14 13:45:33
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_card_record", schema = "")
@SuppressWarnings("serial")
public class CardRecordEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**学员*/
	//private java.lang.String stuId;
	private StudentEntity student;
	/**卡号*/
	//private java.lang.String cardId;
	private StudyCardEntity studycard;
	/**涉及金额*/
	private BigDecimal recordValue;
	/**操作时间*/
	private java.util.Date useTime;
	/**操作内容*/
	private java.lang.String userContent;
	/**备注*/
	private java.lang.String recordContent;
	
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
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  涉及金额
	 */
	@Column(name ="RECORD_VALUE",nullable=false,precision=10,scale=2)
	public BigDecimal getRecordValue(){
		return this.recordValue;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  涉及金额
	 */
	public void setRecordValue(BigDecimal recordValue){
		this.recordValue = recordValue;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  操作时间
	 */
	@Column(name ="USE_TIME",nullable=true)
	public java.util.Date getUseTime(){
		return this.useTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  操作时间
	 */
	public void setUseTime(java.util.Date useTime){
		this.useTime = useTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作内容
	 */
	@Column(name ="USER_CONTENT",nullable=true,length=200)
	public java.lang.String getUserContent(){
		return this.userContent;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作内容
	 */
	public void setUserContent(java.lang.String userContent){
		this.userContent = userContent;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="RECORD_CONTENT",nullable=true,length=200)
	public java.lang.String getRecordContent(){
		return this.recordContent;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setRecordContent(java.lang.String recordContent){
		this.recordContent = recordContent;
	}
	/**
	 * 充值学员
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STU_ID")
	public StudentEntity getStudent() {
		return student;
	}

	public void setStudent(StudentEntity student) {
		this.student = student;
	}
	/**
	 * 学习卡
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CARD_ID")
	public StudyCardEntity getStudycard() {
		return studycard;
	}

	public void setStudycard(StudyCardEntity studycard) {
		this.studycard = studycard;
	}
}
