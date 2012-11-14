package com.mbaclub.news.pojo;

/**
 * SecurityMenuRole entity. @author MyEclipse Persistence Tools
 */

public class SecurityMenuRole implements java.io.Serializable {

	// Fields

	private SecurityMenuRoleId id;

	// Constructors

	/** default constructor */
	public SecurityMenuRole() {
	}

	/** full constructor */
	public SecurityMenuRole(SecurityMenuRoleId id) {
		this.id = id;
	}

	// Property accessors

	public SecurityMenuRoleId getId() {
		return this.id;
	}

	public void setId(SecurityMenuRoleId id) {
		this.id = id;
	}

}