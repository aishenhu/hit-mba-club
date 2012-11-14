package com.mbaclub.news.pojo;

import java.util.Date;

/**
 * Milestone entity. @author MyEclipse Persistence Tools
 */

public class Milestone implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String content;
	private Date eventDate;
	private String image;
	private String moreUrl;

	// Constructors

	/** default constructor */
	public Milestone() {
	}

	/** minimal constructor */
	public Milestone(String title, String content, Date eventDate) {
		this.title = title;
		this.content = content;
		this.eventDate = eventDate;
	}

	/** full constructor */
	public Milestone(String title, String content, Date eventDate,
			String image, String moreUrl) {
		this.title = title;
		this.content = content;
		this.eventDate = eventDate;
		this.image = image;
		this.moreUrl = moreUrl;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEventDate() {
		return this.eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMoreUrl() {
		return this.moreUrl;
	}

	public void setMoreUrl(String moreUrl) {
		this.moreUrl = moreUrl;
	}

}