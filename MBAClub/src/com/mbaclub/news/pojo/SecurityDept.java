package com.mbaclub.news.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * SecurityDept entity. @author MyEclipse Persistence Tools
 */

public class SecurityDept implements java.io.Serializable {

	// Fields

	private Long id;
	private SecurityDept securityDept;
	private Integer theSort;
	private String descn;
	private String name;
	private Set securityDepts = new HashSet(0);
	private Set securityUsers = new HashSet(0);

	// Constructors

	/** default constructor */
	public SecurityDept() {
	}

	/** minimal constructor */
	public SecurityDept(Long id) {
		this.id = id;
	}

	/** full constructor */
	public SecurityDept(Long id, SecurityDept securityDept, Integer theSort,
			String descn, String name, Set securityDepts, Set securityUsers) {
		this.id = id;
		this.securityDept = securityDept;
		this.theSort = theSort;
		this.descn = descn;
		this.name = name;
		this.securityDepts = securityDepts;
		this.securityUsers = securityUsers;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SecurityDept getSecurityDept() {
		return this.securityDept;
	}

	public void setSecurityDept(SecurityDept securityDept) {
		this.securityDept = securityDept;
	}

	public Integer getTheSort() {
		return this.theSort;
	}

	public void setTheSort(Integer theSort) {
		this.theSort = theSort;
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

	public Set getSecurityDepts() {
		return this.securityDepts;
	}

	public void setSecurityDepts(Set securityDepts) {
		this.securityDepts = securityDepts;
	}

	public Set getSecurityUsers() {
		return this.securityUsers;
	}

	public void setSecurityUsers(Set securityUsers) {
		this.securityUsers = securityUsers;
	}

}