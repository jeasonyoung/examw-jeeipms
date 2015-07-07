package com.changh.jeeipms.common.entity.content;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 导航菜单
 * @author failymiss
 * @date 2013-09-10 09:34:32
 * @version V1.0   
 *
 */
@Entity
@Table(name = "f_menu", schema = "")
@SuppressWarnings("serial")
public class FrontMenuEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**中文名称*/
	private java.lang.String cnname;
	/**英文名称*/
	private java.lang.String enname;
	/**上级菜单*/
	private java.lang.String parentmenuid;
	/**菜单地址*/
	private java.lang.String menuurl;
	/**菜单图片*/
	private java.lang.String imageurl;
	/**推荐排序*/
	private java.lang.Integer menuorder;
	/**0:显示1:不显示*/
	private java.lang.Integer status;
	/**菜单介绍*/
	private java.lang.String description;
	/**添加时间*/
	private java.util.Date addtime;
	
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
	 *@return: java.lang.String  中文名称
	 */
	@Column(name ="CNNAME",nullable=false,length=50)
	public java.lang.String getCnname(){
		return this.cnname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  中文名称
	 */
	public void setCnname(java.lang.String cnname){
		this.cnname = cnname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  英文名称
	 */
	@Column(name ="ENNAME",nullable=true,length=50)
	public java.lang.String getEnname(){
		return this.enname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  英文名称
	 */
	public void setEnname(java.lang.String enname){
		this.enname = enname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  上级菜单
	 */
	@Column(name ="PARENTMENUID",nullable=true,length=32)
	public java.lang.String getParentmenuid(){
		return this.parentmenuid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  上级菜单
	 */
	public void setParentmenuid(java.lang.String parentmenuid){
		this.parentmenuid = parentmenuid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  菜单地址
	 */
	@Column(name ="MENUURL",nullable=true,length=100)
	public java.lang.String getMenuurl(){
		return this.menuurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  菜单地址
	 */
	public void setMenuurl(java.lang.String menuurl){
		this.menuurl = menuurl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  菜单图片
	 */
	@Column(name ="IMAGEURL",nullable=true,length=100)
	public java.lang.String getImageurl(){
		return this.imageurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  菜单图片
	 */
	public void setImageurl(java.lang.String imageurl){
		this.imageurl = imageurl;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  推荐排序
	 */
	@Column(name ="MENUORDER",nullable=true,precision=10,scale=0)
	public java.lang.Integer getMenuorder(){
		return this.menuorder;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  推荐排序
	 */
	public void setMenuorder(java.lang.Integer menuorder){
		this.menuorder = menuorder;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  0:显示1:不显示
	 */
	@Column(name ="STATUS",nullable=true,precision=5,scale=0)
	public java.lang.Integer getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  0:显示1:不显示
	 */
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  菜单介绍
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=65535)
	public java.lang.String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  菜单介绍
	 */
	public void setDescription(java.lang.String description){
		this.description = description;
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
}
