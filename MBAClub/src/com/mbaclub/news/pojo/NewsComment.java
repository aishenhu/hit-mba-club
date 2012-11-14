package com.mbaclub.news.pojo;

import java.sql.Timestamp;

/**
 * NewsComment entity. @author MyEclipse Persistence Tools
 */

public class NewsComment implements java.io.Serializable {

	// Fields

	private Long id;
	private News news;
	private String username;
	private Timestamp updateDate;
	private String ip;
	private String name;
	private String content;
	private Integer status;

	// Constructors

	/** default constructor */
	public NewsComment() {
	}

	/** minimal constructor */
	public NewsComment(Long id) {
		this.id = id;
	}

	/** full constructor */
	public NewsComment(Long id, News news, String username,
			Timestamp updateDate, String ip, String name, String content,
			Integer status) {
		this.id = id;
		this.news = news;
		this.username = username;
		this.updateDate = updateDate;
		this.ip = ip;
		this.name = name;
		this.content = content;
		this.status = status;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public News getNews() {
		return this.news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Timestamp getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}