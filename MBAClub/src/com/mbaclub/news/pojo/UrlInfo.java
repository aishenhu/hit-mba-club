package com.mbaclub.news.pojo;

/**
 * 网址的详细信息
 * 
 * @author Administrator
 * 
 */
public class UrlInfo {
	private String name = null;
	private String url = null;
	private int categoryId = 0;
	@Override
	public String toString() {
		return "UrlInfo [name=" + name + ", url=" + url + "]";
	}

	public UrlInfo(String name, String url) {
		super();
		this.name = name;
		this.url = url;
	}

	public UrlInfo(String name, String url, int categoryId) {
		super();
		this.name = name;
		this.url = url;
		this.categoryId = categoryId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
