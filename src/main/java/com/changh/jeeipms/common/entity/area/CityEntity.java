package com.changh.jeeipms.common.entity.area;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.jeecgframework.core.common.entity.IdEntity;

@Entity
@Table(name = "city")
public class CityEntity extends IdEntity implements java.io.Serializable {
	/**
	 * 区域代码
	 */
	private Integer cityId;
	/**
	 * 名称
	 */
	private String city;
	/**
	 * 父区域代码
	 */
	private Integer fatherId;
	
	@Column(name = "cityID", length = 11)
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	@Column(name = "city", length = 200)
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Column(name = "fatherID", length = 11)
	public Integer getFatherId() {
		return fatherId;
	}
	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}
	
	
}
