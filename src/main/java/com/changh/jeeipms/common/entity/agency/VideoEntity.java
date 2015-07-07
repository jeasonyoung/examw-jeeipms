package com.changh.jeeipms.common.entity.agency;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 课程视频
 * @author failymiss
 * @date 2013-12-01 11:08:23
 * @version V1.0   
 *
 */
@Entity
@Table(name = "course__video", schema = "")
@SuppressWarnings("serial")
public class VideoEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**所属课程*/
	private CourseEntity course = new CourseEntity();
	/**视频地址*/
	private java.lang.String videoUrl;
	/**是否免费*/
	private java.lang.Integer isfree;
	/**排序*/
	private java.lang.Integer videoorder;
	/**标题*/
	private java.lang.String title;
	
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
	 *@return: java.lang.String  视频地址
	 */
	@Column(name ="VIDEO_URL",nullable=false,length=250)
	public java.lang.String getVideoUrl(){
		return this.videoUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  视频地址
	 */
	public void setVideoUrl(java.lang.String videoUrl){
		this.videoUrl = videoUrl;
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
	@JoinColumn(name = "COURSE_ID")
	public CourseEntity getCourse() {
		return course;
	}

	public void setCourse(CourseEntity course) {
		this.course = course;
	}
	@Column(name ="VIDEO_ORDER",nullable=true,precision=5,scale=0)
	public java.lang.Integer getVideoorder() {
		return videoorder;
	}

	public void setVideoorder(java.lang.Integer videoorder) {
		this.videoorder = videoorder;
	}
	@Column(name ="TITLE",nullable=false,length=100)
	public java.lang.String getTitle() {
		return title;
	}

	public void setTitle(java.lang.String title) {
		this.title = title;
	}
}
