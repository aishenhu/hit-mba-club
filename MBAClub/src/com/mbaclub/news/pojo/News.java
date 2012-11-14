package com.mbaclub.news.pojo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class News implements java.io.Serializable {

	// Fields

	private Long id;
	private SecurityUser securityUser;
	private NewsCategory newsCategory;
	private String subtitle;
	private String link;
	private Integer hit;
	private String summary;
	private Timestamp updateDate;
	private String name;
	private String content;
	private String source;
	private String image;
	private Integer status;
	private String html;
	private Integer pageSize;
	private Integer pageType;
	private Set newsNewstags = new HashSet(0);
	private Set newsComments = new HashSet(0);

	// Constructors

	/** default constructor */
	public News() {
	}

	/** minimal constructor */
	public News(Long id) {
		this.id = id;
	}

	/** full constructor */
	public News(Long id, SecurityUser securityUser, NewsCategory newsCategory,
			String subtitle, String link, Integer hit, String summary,
			Timestamp updateDate, String name, String content, String source,
			String image, Integer status, String html, Integer pageSize,
			Integer pageType, Set newsNewstags, Set newsComments) {
		this.id = id;
		this.securityUser = securityUser;
		this.newsCategory = newsCategory;
		this.subtitle = subtitle;
		this.link = link;
		this.hit = hit;
		this.summary = summary;
		this.updateDate = updateDate;
		this.name = name;
		this.content = content;
		this.source = source;
		this.image = image;
		this.status = status;
		this.html = html;
		this.pageSize = pageSize;
		this.pageType = pageType;
		this.newsNewstags = newsNewstags;
		this.newsComments = newsComments;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SecurityUser getSecurityUser() {
		return this.securityUser;
	}

	public void setSecurityUser(SecurityUser securityUser) {
		this.securityUser = securityUser;
	}

	public NewsCategory getNewsCategory() {
		return this.newsCategory;
	}

	public void setNewsCategory(NewsCategory newsCategory) {
		this.newsCategory = newsCategory;
	}

	public String getSubtitle() {
		return this.subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Integer getHit() {
		return this.hit;
	}

	public void setHit(Integer hit) {
		this.hit = hit;
	}

	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Timestamp getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
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

	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getHtml() {
		return this.html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public Integer getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageType() {
		return this.pageType;
	}

	public void setPageType(Integer pageType) {
		this.pageType = pageType;
	}

	public Set getNewsNewstags() {
		return this.newsNewstags;
	}

	public void setNewsNewstags(Set newsNewstags) {
		this.newsNewstags = newsNewstags;
	}

	public Set getNewsComments() {
		return this.newsComments;
	}

	public void setNewsComments(Set newsComments) {
		this.newsComments = newsComments;
	}

}