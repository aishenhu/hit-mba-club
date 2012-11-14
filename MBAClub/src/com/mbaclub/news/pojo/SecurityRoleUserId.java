package com.mbaclub.news.pojo;

/**
 * SecurityRoleUserId entity. @author MyEclipse Persistence Tools
 */

public class SecurityRoleUserId implements java.io.Serializable {

	// Fields

	private SecurityUser securityUser;
	private SecurityRole securityRole;

	// Constructors

	/** default constructor */
	public SecurityRoleUserId() {
	}

	/** full constructor */
	public SecurityRoleUserId(SecurityUser securityUser,
			SecurityRole securityRole) {
		this.securityUser = securityUser;
		this.securityRole = securityRole;
	}

	// Property accessors

	public SecurityUser getSecurityUser() {
		return this.securityUser;
	}

	public void setSecurityUser(SecurityUser securityUser) {
		this.securityUser = securityUser;
	}

	public SecurityRole getSecurityRole() {
		return this.securityRole;
	}

	public void setSecurityRole(SecurityRole securityRole) {
		this.securityRole = securityRole;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SecurityRoleUserId))
			return false;
		SecurityRoleUserId castOther = (SecurityRoleUserId) other;

		return ((this.getSecurityUser() == castOther.getSecurityUser()) || (this
				.getSecurityUser() != null
				&& castOther.getSecurityUser() != null && this
				.getSecurityUser().equals(castOther.getSecurityUser())))
				&& ((this.getSecurityRole() == castOther.getSecurityRole()) || (this
						.getSecurityRole() != null
						&& castOther.getSecurityRole() != null && this
						.getSecurityRole().equals(castOther.getSecurityRole())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getSecurityUser() == null ? 0 : this.getSecurityUser()
						.hashCode());
		result = 37
				* result
				+ (getSecurityRole() == null ? 0 : this.getSecurityRole()
						.hashCode());
		return result;
	}

}