package com.mbaclub.news.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * SecurityResource entity. @author MyEclipse Persistence Tools
 */

public class SecurityResource implements java.io.Serializable {

	// Fields

	private Long id;
	private String descn;
	private String resType;
	private String resString;
	private String name;
	private Set securityResourceRoles = new HashSet(0);

	// Constructors

	/** default constructor */
	public SecurityResource() {
	}

	/** minimal constructor */
	public SecurityResource(Long id) {
		this.id = id;
	}

	/** full constructor */
	public SecurityResource(Long id, String descn, String resType,
			String resString, String name, Set securityResourceRoles) {
		this.id = id;
		this.descn = descn;
		this.resType = resType;
		this.resString = resString;
		this.name = name;
		this.securityResourceRoles = securityResourceRoles;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescn() {
		return this.descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	public String getResType() {
		return this.resType;
	}

	public void setResType(String resType) {
		this.resType = resType;
	}

	public String getResString() {
		return this.resString;
	}

	public void setResString(String resString) {
		this.resString = resString;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getSecurityResourceRoles() {
		return this.securityResourceRoles;
	}

	public void setSecurityResourceRoles(Set securityResourceRoles) {
		this.securityResourceRoles = securityResourceRoles;
	}

}