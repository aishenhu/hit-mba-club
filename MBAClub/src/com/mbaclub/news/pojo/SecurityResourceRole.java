package com.mbaclub.news.pojo;

/**
 * SecurityResourceRole entity. @author MyEclipse Persistence Tools
 */

public class SecurityResourceRole implements java.io.Serializable {

	// Fields

	private SecurityResourceRoleId id;

	// Constructors

	/** default constructor */
	public SecurityResourceRole() {
	}

	/** full constructor */
	public SecurityResourceRole(SecurityResourceRoleId id) {
		this.id = id;
	}

	// Property accessors

	public SecurityResourceRoleId getId() {
		return this.id;
	}

	public void setId(SecurityResourceRoleId id) {
		this.id = id;
	}

}