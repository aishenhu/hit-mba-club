package com.mbaclub.news.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * NewsCategory entity. @author MyEclipse Persistence Tools
 */

public class NewsCategory implements java.io.Serializable {

	// Fields

	private Long id;
	private NewsCategory newsCategory;
	private Integer theSort;
	private Long bitCode;
	private String charCode;
	private String name;
	private Integer status;
	private Set newses = new HashSet(0);
	private Set newsCategories = new HashSet(0);

	// Constructors

	/** default constructor */
	public NewsCategory() {
	}

	/** minimal constructor */
	public NewsCategory(Long id) {
		this.id = id;
	}

	/** full constructor */
	public NewsCategory(Long id, NewsCategory newsCategory, Integer theSort,
			Long bitCode, String charCode, String name, Integer status,
			Set newses, Set newsCategories) {
		this.id = id;
		this.newsCategory = newsCategory;
		this.theSort = theSort;
		this.bitCode = bitCode;
		this.charCode = charCode;
		this.name = name;
		this.status = status;
		this.newses = newses;
		this.newsCategories = newsCategories;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public NewsCategory getNewsCategory() {
		return this.newsCategory;
	}

	public void setNewsCategory(NewsCategory newsCategory) {
		this.newsCategory = newsCategory;
	}

	public Integer getTheSort() {
		return this.theSort;
	}

	public void setTheSort(Integer theSort) {
		this.theSort = theSort;
	}

	public Long getBitCode() {
		return this.bitCode;
	}

	public void setBitCode(Long bitCode) {
		this.bitCode = bitCode;
	}

	public String getCharCode() {
		return this.charCode;
	}

	public void setCharCode(String charCode) {
		this.charCode = charCode;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getNewses() {
		return this.newses;
	}

	public void setNewses(Set newses) {
		this.newses = newses;
	}

	public Set getNewsCategories() {
		return this.newsCategories;
	}

	public void setNewsCategories(Set newsCategories) {
		this.newsCategories = newsCategories;
	}

}