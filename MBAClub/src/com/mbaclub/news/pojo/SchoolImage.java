package com.mbaclub.news.pojo;

import java.sql.Timestamp;

/**
 * SchoolImage entity. @author MyEclipse Persistence Tools
 */

public class SchoolImage implements java.io.Serializable {

	// Fields

	private Long id;
	private String imagePath; 
	private Timestamp createTime;
	private String introduce;
	private String describe;

	// Constructors

	/** default constructor */
	public SchoolImage() {
	}

	/** minimal constructor */
	public SchoolImage(String imagePath, Timestamp createTime) {
		this.imagePath = imagePath;
		this.createTime = createTime;
	}

	/** full constructor */
	public SchoolImage(String imagePath, Timestamp createTime,
			String introduce, String describe) {
		this.imagePath = imagePath;
		this.createTime = createTime;
		this.introduce = introduce;
		this.describe = describe;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

}