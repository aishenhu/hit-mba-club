package com.mbaclub.news.pojo;

/**
 * NewsConfig entity. @author MyEclipse Persistence Tools
 */

public class NewsConfig implements java.io.Serializable {

	// Fields

	private Long id;
	private Integer newsNeedAudit;
	private Integer commentNeedAudit;
	private Integer couldComment;
	private Integer categoryStrategy;
	private String templateName;

	// Constructors

	/** default constructor */
	public NewsConfig() {
	}

	/** minimal constructor */
	public NewsConfig(Long id) {
		this.id = id;
	}

	/** full constructor */
	public NewsConfig(Long id, Integer newsNeedAudit, Integer commentNeedAudit,
			Integer couldComment, Integer categoryStrategy, String templateName) {
		this.id = id;
		this.newsNeedAudit = newsNeedAudit;
		this.commentNeedAudit = commentNeedAudit;
		this.couldComment = couldComment;
		this.categoryStrategy = categoryStrategy;
		this.templateName = templateName;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getNewsNeedAudit() {
		return this.newsNeedAudit;
	}

	public void setNewsNeedAudit(Integer newsNeedAudit) {
		this.newsNeedAudit = newsNeedAudit;
	}

	public Integer getCommentNeedAudit() {
		return this.commentNeedAudit;
	}

	public void setCommentNeedAudit(Integer commentNeedAudit) {
		this.commentNeedAudit = commentNeedAudit;
	}

	public Integer getCouldComment() {
		return this.couldComment;
	}

	public void setCouldComment(Integer couldComment) {
		this.couldComment = couldComment;
	}

	public Integer getCategoryStrategy() {
		return this.categoryStrategy;
	}

	public void setCategoryStrategy(Integer categoryStrategy) {
		this.categoryStrategy = categoryStrategy;
	}

	public String getTemplateName() {
		return this.templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

}