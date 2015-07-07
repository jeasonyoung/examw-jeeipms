package com.changh.jeeipms.common.entity.student;

import java.text.SimpleDateFormat;
import java.util.TimeZone;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.cms.controller.order.SysOrderController;
import com.changh.jeeipms.common.entity.agency.VideoEntity;

/**   
 * @Title: Entity
 * @Description: 学员笔记
 * @author failymiss
 * @date 2013-10-21 14:18:42
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_study_note", schema = "")
@SuppressWarnings("serial")
public class NoteEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**学员*/
	//private java.lang.String stuId;
	private StudentEntity student;
	/**课程*/
	//private java.lang.String courseId;
	private VideoEntity video;
	/**笔记时间*/
	private java.util.Date notetime;
	/**课程时间*/
	private double coursetime;
	/**笔记内容*/
	private java.lang.String content;
	/**笔记来源*/
	private java.lang.String derived;
	/**格式时间*/
	private java.lang.String formatTime;
	
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
	
	/*@Transient
	public java.lang.String getFormattime() {
		long  ms = (long) (this.getCoursetime()*1000)- TimeZone.getDefault().getRawOffset(); ;
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");//初始化Formatter的转换格式。
		return  formatter.format(ms);
	}
	@Transient
	public void setFormattime(java.lang.String formattime) {
		this.formattime = formattime;
	}*/
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  笔记时间
	 */
	@Column(name ="NOTETIME",nullable=false)
	public java.util.Date getNotetime(){
		return this.notetime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  笔记时间
	 */
	public void setNotetime(java.util.Date notetime){
		this.notetime = notetime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  笔记内容
	 */
	@Column(name ="CONTENT",nullable=false,length=1000)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  笔记内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  笔记来源
	 */
	@Column(name ="DERIVED",nullable=true,length=255)
	public java.lang.String getDerived(){
		return this.derived;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  笔记来源
	 */
	public void setDerived(java.lang.String derived){
		this.derived = derived;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STU_ID")
	@JsonIgnore 
	public StudentEntity getStudent() {
		return student;
	}

	public void setStudent(StudentEntity student) {
		this.student = student;
	}
	
	public double getCoursetime() {
		return coursetime;
	}

	public void setCoursetime(double coursetime) {
		this.coursetime = coursetime;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COURSE_ID")
	@JsonIgnore 
	public VideoEntity getVideo() {
		return video;
	}

	public void setVideo(VideoEntity video) {
		this.video = video;
	}
	@Transient
	public java.lang.String getFormatTime() {
		if(this.coursetime!=0.0){
			long  ms = (long) (this.coursetime*1000)- TimeZone.getDefault().getRawOffset(); ;
			SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");//初始化Formatter的转换格式。
			return  formatter.format(ms);
		}else{
			return "";
		}
		
	}

	public void setFormatTime(java.lang.String formatTime) {
		this.formatTime = formatTime;
	}
	
}
