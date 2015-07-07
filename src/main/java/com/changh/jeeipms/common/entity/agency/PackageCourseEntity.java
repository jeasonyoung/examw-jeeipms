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
 * @Description: 关系表
 * @author failymiss
 * @date 2014-03-04 15:18:34
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_course_package", schema = "")
@SuppressWarnings("serial")
public class PackageCourseEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**课程*/
	private CourseEntity course;
	/**套餐*/
	private CoursePackageEntity coursePackage;
	
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
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PKG_ID")
	public CoursePackageEntity getCoursePackage() {
		return coursePackage;
	}

	public void setCoursePackage(CoursePackageEntity coursePackage) {
		this.coursePackage = coursePackage;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "COURSE_ID")
	public CourseEntity getCourse() {
		return course;
	}

	public void setCourse(CourseEntity course) {
		this.course = course;
	}
}
