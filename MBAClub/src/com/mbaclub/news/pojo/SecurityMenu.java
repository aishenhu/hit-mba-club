package com.mbaclub.news.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * SecurityMenu entity. @author MyEclipse Persistence Tools
 */

public class SecurityMenu implements java.io.Serializable {

	// Fields

	private Long id;
	private SecurityMenu securityMenu;
	private String url;
	private Integer theSort;
	private String qtip;
	private String descn;
	private String name;
	private String image;
	private Set securityMenus = new HashSet(0);
	private Set securityMenuRoles = new HashSet(0);

	// Constructors

	/** default constructor */
	public SecurityMenu() {
	}

	/** minimal constructor */
	public SecurityMenu(Long id) {
		this.id = id;
	}

	/** full constructor */
	public SecurityMenu(Long id, SecurityMenu securityMenu, String url,
			Integer theSort, String qtip, String descn, String name,
			String image, Set securityMenus, Set securityMenuRoles) {
		this.id = id;
		this.securityMenu = securityMenu;
		this.url = url;
		this.theSort = theSort;
		this.qtip = qtip;
		this.descn = descn;
		this.name = name;
		this.image = image;
		this.securityMenus = securityMenus;
		this.securityMenuRoles = securityMenuRoles;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SecurityMenu getSecurityMenu() {
		return this.securityMenu;
	}

	public void setSecurityMenu(SecurityMenu securityMenu) {
		this.securityMenu = securityMenu;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getTheSort() {
		return this.theSort;
	}

	public void setTheSort(Integer theSort) {
		this.theSort = theSort;
	}

	public String getQtip() {
		return this.qtip;
	}

	public void setQtip(String qtip) {
		this.qtip = qtip;
	}

	public String getDescn() {
		return this.descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set getSecurityMenus() {
		return this.securityMenus;
	}

	public void setSecurityMenus(Set securityMenus) {
		this.securityMenus = securityMenus;
	}

	public Set getSecurityMenuRoles() {
		return this.securityMenuRoles;
	}

	public void setSecurityMenuRoles(Set securityMenuRoles) {
		this.securityMenuRoles = securityMenuRoles;
	}

}