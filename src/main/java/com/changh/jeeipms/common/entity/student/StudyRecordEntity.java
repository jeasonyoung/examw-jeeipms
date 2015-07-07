package com.changh.jeeipms.common.entity.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.common.entity.agency.CourseEntity;

/**   
 * @Title: Entity
 * @Description: 学习记录
 * @author failymiss
 * @date 2013-10-10 14:30:46
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_study_record", schema = "")
@SuppressWarnings("serial")
public class StudyRecordEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**学员*/
	//private java.lang.String stuId;
	private StudentEntity student = new StudentEntity();
	/**课程*/
	//private java.lang.String courseId;
	private CourseEntity course = new CourseEntity();
	/**开始时间*/
	private java.util.Date starttime;
	/**结束时间*/
	private java.util.Date endtime;
	/**学习IP地址*/
	private java.lang.String studyIp;
	
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  开始时间
	 */
	@Column(name ="STARTTIME",nullable=false)
	public java.util.Date getStarttime(){
		return this.starttime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  开始时间
	 */
	public void setStarttime(java.util.Date starttime){
		this.starttime = starttime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  结束时间
	 */
	@Column(name ="ENDTIME",nullable=true)
	public java.util.Date getEndtime(){
		return this.endtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  结束时间
	 */
	public void setEndtime(java.util.Date endtime){
		this.endtime = endtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学习IP地址
	 */
	@Column(name ="STUDY_IP",nullable=true,length=32)
	public java.lang.String getStudyIp(){
		return this.studyIp;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学习IP地址
	 */
	public void setStudyIp(java.lang.String studyIp){
		this.studyIp = studyIp;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STU_ID")
	public StudentEntity getStudent() {
		return student;
	}

	public void setStudent(StudentEntity student) {
		this.student = student;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COURSE_ID")
	public CourseEntity getCourse() {
		return course;
	}

	public void setCourse(CourseEntity course) {
		this.course = course;
	}
}
