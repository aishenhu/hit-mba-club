package com.mbaclub.news.pojo;

/**
 * NewsNewstagId entity. @author MyEclipse Persistence Tools
 */

public class NewsNewstagId implements java.io.Serializable {

	// Fields

	private News news;
	private NewsTag newsTag;

	// Constructors

	/** default constructor */
	public NewsNewstagId() {
	}

	/** full constructor */
	public NewsNewstagId(News news, NewsTag newsTag) {
		this.news = news;
		this.newsTag = newsTag;
	}

	// Property accessors

	public News getNews() {
		return this.news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public NewsTag getNewsTag() {
		return this.newsTag;
	}

	public void setNewsTag(NewsTag newsTag) {
		this.newsTag = newsTag;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof NewsNewstagId))
			return false;
		NewsNewstagId castOther = (NewsNewstagId) other;

		return ((this.getNews() == castOther.getNews()) || (this.getNews() != null
				&& castOther.getNews() != null && this.getNews().equals(
				castOther.getNews())))
				&& ((this.getNewsTag() == castOther.getNewsTag()) || (this
						.getNewsTag() != null
						&& castOther.getNewsTag() != null && this.getNewsTag()
						.equals(castOther.getNewsTag())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getNews() == null ? 0 : this.getNews().hashCode());
		result = 37 * result
				+ (getNewsTag() == null ? 0 : this.getNewsTag().hashCode());
		return result;
	}

}