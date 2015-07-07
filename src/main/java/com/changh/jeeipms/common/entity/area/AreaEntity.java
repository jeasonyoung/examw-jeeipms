package com.changh.jeeipms.common.entity.area;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.jeecgframework.core.common.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 地区管理
 * @author failymiss
 * @date 2013-07-23 16:36:38
 * @version V1.0   
 *
 */
@Entity
@Table(name = "area", schema = "")
@Inheritance(strategy = InheritanceType.JOINED)
public class AreaEntity extends IdEntity implements java.io.Serializable {
	/**地区编码*/
	private java.lang.Integer areaid;
	/**地区名称*/
	private java.lang.String area;
	/**所属城市*/
	private java.lang.Integer fatherid;                                    
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  地区编码
	 */
	@Column(name ="AREAID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getAreaid(){
		return this.areaid;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  地区编码
	 */
	public void setAreaid(java.lang.Integer areaid){
		this.areaid = areaid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  地区名称
	 */
	@Column(name ="AREA",nullable=false,length=200)
	public java.lang.String getArea(){
		return this.area;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  地区名称
	 */
	public void setArea(java.lang.String area){
		this.area = area;
	}

	public java.lang.Integer getFatherid() {
		return fatherid;
	}
	@Column(name ="FATHERID",nullable=false,precision=10,scale=0)
	public void setFatherid(java.lang.Integer fatherid) {
		this.fatherid = fatherid;
	}
}
