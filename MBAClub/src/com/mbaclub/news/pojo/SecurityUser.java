package com.mbaclub.news.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * SecurityUser entity. @author MyEclipse Persistence Tools
 */

public class SecurityUser implements java.io.Serializable {

	// Fields

	private Long id;
	private SecurityDept securityDept;
	private String username;
	private String email;
	private String descn;
	private String code;
	private String truename;
	private Short sex;
	private Timestamp birthday;
	private String tel;
	private String mobile;
	private String duty;
	private String password;
	private Short status;
	private Set securityRoleUsers = new HashSet(0);
	private Set newses = new HashSet(0);

	// Constructors

	/** default constructor */
	public SecurityUser() {
	}

	/** minimal constructor */
	public SecurityUser(Long id) {
		this.id = id;
	}

	/** full constructor */
	public SecurityUser(Long id, SecurityDept securityDept, String username,
			String email, String descn, String code, String truename,
			Short sex, Timestamp birthday, String tel, String mobile,
			String duty, String password, Short status, Set securityRoleUsers,
			Set newses) {
		this.id = id;
		this.securityDept = securityDept;
		this.username = username;
		this.email = email;
		this.descn = descn;
		this.code = code;
		this.truename = truename;
		this.sex = sex;
		this.birthday = birthday;
		this.tel = tel;
		this.mobile = mobile;
		this.duty = duty;
		this.password = password;
		this.status = status;
		this.securityRoleUsers = securityRoleUsers;
		this.newses = newses;
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

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescn() {
		return this.descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTruename() {
		return this.truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public Short getSex() {
		return this.sex;
	}

	public void setSex(Short sex) {
		this.sex = sex;
	}

	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Set getSecurityRoleUsers() {
		return this.securityRoleUsers;
	}

	public void setSecurityRoleUsers(Set securityRoleUsers) {
		this.securityRoleUsers = securityRoleUsers;
	}

	public Set getNewses() {
		return this.newses;
	}

	public void setNewses(Set newses) {
		this.newses = newses;
	}

}