package com.mbaclub.news.pojo;

/**
 * SecurityMenuRoleId entity. @author MyEclipse Persistence Tools
 */

public class SecurityMenuRoleId implements java.io.Serializable {

	// Fields

	private SecurityRole securityRole;
	private SecurityMenu securityMenu;

	// Constructors

	/** default constructor */
	public SecurityMenuRoleId() {
	}

	/** full constructor */
	public SecurityMenuRoleId(SecurityRole securityRole,
			SecurityMenu securityMenu) {
		this.securityRole = securityRole;
		this.securityMenu = securityMenu;
	}

	// Property accessors

	public SecurityRole getSecurityRole() {
		return this.securityRole;
	}

	public void setSecurityRole(SecurityRole securityRole) {
		this.securityRole = securityRole;
	}

	public SecurityMenu getSecurityMenu() {
		return this.securityMenu;
	}

	public void setSecurityMenu(SecurityMenu securityMenu) {
		this.securityMenu = securityMenu;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SecurityMenuRoleId))
			return false;
		SecurityMenuRoleId castOther = (SecurityMenuRoleId) other;

		return ((this.getSecurityRole() == castOther.getSecurityRole()) || (this
				.getSecurityRole() != null
				&& castOther.getSecurityRole() != null && this
				.getSecurityRole().equals(castOther.getSecurityRole())))
				&& ((this.getSecurityMenu() == castOther.getSecurityMenu()) || (this
						.getSecurityMenu() != null
						&& castOther.getSecurityMenu() != null && this
						.getSecurityMenu().equals(castOther.getSecurityMenu())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getSecurityRole() == null ? 0 : this.getSecurityRole()
						.hashCode());
		result = 37
				* result
				+ (getSecurityMenu() == null ? 0 : this.getSecurityMenu()
						.hashCode());
		return result;
	}

}