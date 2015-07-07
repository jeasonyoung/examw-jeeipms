package com.changh.jeeipms.common.entity.agency;

import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 课程评论
 * @author failymiss
 * @date 2013-09-06 14:13:59
 * @version V1.0   
 *
 */
@Entity
@Table(name = "course_comments", schema = "")
@SuppressWarnings("serial")
public class CommentEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**评论内容*/
	private java.lang.String content;
	/**评论课程*/
	private java.lang.String courseid;
	/**评分*/
	private java.lang.Double coursescore;
	/**状态*/
	private java.lang.Integer status;
	/**排序*/
	private java.lang.Integer commentorder;
	/**时间*/
	private java.util.Date addtime;
	/**评论人ID*/
	private java.lang.String stuid;
	/**评论人姓名*/
	private java.lang.String stuname;
	/**IP地址*/
	private java.lang.String ip;
	/**
	 * 格式化的时间
	 */
	private java.lang.String formattime;
	
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
	
	@Transient
	public java.lang.String getFormattime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if(null!=this.addtime){
			return format.format(this.addtime);
		}else{
			return "";
		}
	}
	@Transient
	public void setFormattime(java.lang.String formattime) {
		this.formattime = formattime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论内容
	 */
	@Column(name ="CONTENT",nullable=false,length=500)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论课程
	 */
	@Column(name ="COURSEID",nullable=false,length=32)
	public java.lang.String getCourseid(){
		return this.courseid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论课程
	 */
	public void setCourseid(java.lang.String courseid){
		this.courseid = courseid;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  评分
	 */
	@Column(name ="COURSESCORE",nullable=false,precision=22)
	public java.lang.Double getCoursescore(){
		return this.coursescore;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  评分
	 */
	public void setCoursescore(java.lang.Double coursescore){
		this.coursescore = coursescore;
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  排序
	 */
	@Column(name ="COMMENTORDER",nullable=true,precision=10,scale=0)
	public java.lang.Integer getCommentorder(){
		return this.commentorder;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  排序
	 */
	public void setCommentorder(java.lang.Integer commentorder){
		this.commentorder = commentorder;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  时间
	 */
	@Column(name ="ADDTIME",nullable=true)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论人ID
	 */
	@Column(name ="STUID",nullable=true,length=32)
	public java.lang.String getStuid(){
		return this.stuid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论人ID
	 */
	public void setStuid(java.lang.String stuid){
		this.stuid = stuid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论人姓名
	 */
	@Column(name ="STUNAME",nullable=true,length=32)
	public java.lang.String getStuname(){
		return this.stuname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论人姓名
	 */
	public void setStuname(java.lang.String stuname){
		this.stuname = stuname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  IP地址
	 */
	@Column(name ="IP",nullable=true,length=32)
	public java.lang.String getIp(){
		return this.ip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  IP地址
	 */
	public void setIp(java.lang.String ip){
		this.ip = ip;
	}
}
