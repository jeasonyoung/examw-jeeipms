package com.changh.jeeipms.common.entity.area;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.jeecgframework.core.common.entity.IdEntity;

@Entity
@Table(name = "province")
public class ProvinceEntity extends IdEntity implements java.io.Serializable {
	
	/**
	 * 区域代码
	 */
	private Integer provinceId;
	/**
	 * 名称
	 */
	private String province;
	/**
	 * 父区域代码
	 */
	private Integer fatherId;
	
	@Column(name = "provinceID", length = 11)
	public Integer getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	@Column(name = "province", length = 200)
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	@Column(name = "fatherID", length = 11)
	public Integer getFatherId() {
		return fatherId;
	}
	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}
	
	
}
