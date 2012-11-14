package com.mbaclub.news.pojo;

/**
 * NewsNewstag entity. @author MyEclipse Persistence Tools
 */

public class NewsNewstag implements java.io.Serializable {

	// Fields

	private NewsNewstagId id;

	// Constructors

	/** default constructor */
	public NewsNewstag() {
	}

	/** full constructor */
	public NewsNewstag(NewsNewstagId id) {
		this.id = id;
	}

	// Property accessors

	public NewsNewstagId getId() {
		return this.id;
	}

	public void setId(NewsNewstagId id) {
		this.id = id;
	}

}