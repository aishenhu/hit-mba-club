package com.mbaclub.news.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * SecurityRole entity. @author MyEclipse Persistence Tools
 */

public class SecurityRole implements java.io.Serializable {

	// Fields

	private Long id;
	private String descn;
	private String name;
	private Set securityRoleUsers = new HashSet(0);
	private Set securityResourceRoles = new HashSet(0);
	private Set securityMenuRoles = new HashSet(0);

	// Constructors

	/** default constructor */
	public SecurityRole() {
	}

	/** minimal constructor */
	public SecurityRole(Long id, String name) {
		this.id = id;
		this.name = name;
	}

	/** full constructor */
	public SecurityRole(Long id, String descn, String name,
			Set securityRoleUsers, Set securityResourceRoles,
			Set securityMenuRoles) {
		this.id = id;
		this.descn = descn;
		this.name = name;
		this.securityRoleUsers = securityRoleUsers;
		this.securityResourceRoles = securityResourceRoles;
		this.securityMenuRoles = securityMenuRoles;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getSecurityRoleUsers() {
		return this.securityRoleUsers;
	}

	public void setSecurityRoleUsers(Set securityRoleUsers) {
		this.securityRoleUsers = securityRoleUsers;
	}

	public Set getSecurityResourceRoles() {
		return this.securityResourceRoles;
	}

	public void setSecurityResourceRoles(Set securityResourceRoles) {
		this.securityResourceRoles = securityResourceRoles;
	}

	public Set getSecurityMenuRoles() {
		return this.securityMenuRoles;
	}

	public void setSecurityMenuRoles(Set securityMenuRoles) {
		this.securityMenuRoles = securityMenuRoles;
	}

}