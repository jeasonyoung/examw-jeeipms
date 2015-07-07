package com.changh.jeeipms.cms.entity.core;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.changh.jeeipms.common.entity.content.FrontMenuEntity;

/**   
 * @Title: Entity
 * @Description: 友情链接
 * @author failymiss
 * @date 2013-12-09 11:19:39
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_s_linklist", schema = "")
@SuppressWarnings("serial")
public class LinkListEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**链接地址*/
	private java.lang.String outurl;
	/**交互地址*/
	private java.lang.String inurl;
	/**栏目*/
	private FrontMenuEntity  menu;
	/**联系QQ*/
	private java.lang.String qq;
	/**添加时间*/
	private java.util.Date addtime;
	/**排序*/
	private java.lang.Integer orderid;
	/**操作者*/
	private java.lang.String editor;
	
	private java.lang.String linkname;
	
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
	 *@return: java.lang.String  链接地址
	 */
	@Column(name ="OUTURL",nullable=false,length=250)
	public java.lang.String getOuturl(){
		return this.outurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  链接地址
	 */
	public void setOuturl(java.lang.String outurl){
		this.outurl = outurl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  交互地址
	 */
	@Column(name ="INURL",nullable=false,length=250)
	public java.lang.String getInurl(){
		return this.inurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  交互地址
	 */
	public void setInurl(java.lang.String inurl){
		this.inurl = inurl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系QQ
	 */
	@Column(name ="QQ",nullable=true,length=20)
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  添加时间
	 */
	@Column(name ="ADDTIME",nullable=true)
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
	 *@return: java.lang.Integer  排序
	 */
	@Column(name ="ORDERID",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOrderid(){
		return this.orderid;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  排序
	 */
	public void setOrderid(java.lang.Integer orderid){
		this.orderid = orderid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作者
	 */
	@Column(name ="EDITOR",nullable=true,length=100)
	public java.lang.String getEditor(){
		return this.editor;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作者
	 */
	public void setEditor(java.lang.String editor){
		this.editor = editor;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MENU_ID")
	public FrontMenuEntity getMenu() {
		return menu;
	}

	public void setMenu(FrontMenuEntity menu) {
		this.menu = menu;
	}
	@Column(name ="LINK_NAME",nullable=true,length=250)
	public java.lang.String getLinkname() {
		return linkname;
	}
	
	public void setLinkname(java.lang.String linkname) {
		this.linkname = linkname;
	}
}
