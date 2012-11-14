package com.mbaclub.news.pojo;

/**
 * SecurityRoleUser entity. @author MyEclipse Persistence Tools
 */

public class SecurityRoleUser implements java.io.Serializable {

	// Fields

	private SecurityRoleUserId id;

	// Constructors

	/** default constructor */
	public SecurityRoleUser() {
	}

	/** full constructor */
	public SecurityRoleUser(SecurityRoleUserId id) {
		this.id = id;
	}

	// Property accessors

	public SecurityRoleUserId getId() {
		return this.id;
	}

	public void setId(SecurityRoleUserId id) {
		this.id = id;
	}

}