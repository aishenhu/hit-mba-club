package com.mbaclub.news.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * NewsTag entity. @author MyEclipse Persistence Tools
 */

public class NewsTag implements java.io.Serializable {

	// Fields

	private Long id;
	private Integer theSort;
	private String name;
	private Set newsNewstags = new HashSet(0);

	// Constructors

	/** default constructor */
	public NewsTag() {
	}

	/** minimal constructor */
	public NewsTag(Long id, String name) {
		this.id = id;
		this.name = name;
	}

	/** full constructor */
	public NewsTag(Long id, Integer theSort, String name, Set newsNewstags) {
		this.id = id;
		this.theSort = theSort;
		this.name = name;
		this.newsNewstags = newsNewstags;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getTheSort() {
		return this.theSort;
	}

	public void setTheSort(Integer theSort) {
		this.theSort = theSort;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getNewsNewstags() {
		return this.newsNewstags;
	}

	public void setNewsNewstags(Set newsNewstags) {
		this.newsNewstags = newsNewstags;
	}

}