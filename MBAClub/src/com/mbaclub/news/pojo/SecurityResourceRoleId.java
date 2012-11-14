package com.mbaclub.news.pojo;

/**
 * SecurityResourceRoleId entity. @author MyEclipse Persistence Tools
 */

public class SecurityResourceRoleId implements java.io.Serializable {

	// Fields

	private SecurityRole securityRole;
	private SecurityResource securityResource;

	// Constructors

	/** default constructor */
	public SecurityResourceRoleId() {
	}

	/** full constructor */
	public SecurityResourceRoleId(SecurityRole securityRole,
			SecurityResource securityResource) {
		this.securityRole = securityRole;
		this.securityResource = securityResource;
	}

	// Property accessors

	public SecurityRole getSecurityRole() {
		return this.securityRole;
	}

	public void setSecurityRole(SecurityRole securityRole) {
		this.securityRole = securityRole;
	}

	public SecurityResource getSecurityResource() {
		return this.securityResource;
	}

	public void setSecurityResource(SecurityResource securityResource) {
		this.securityResource = securityResource;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SecurityResourceRoleId))
			return false;
		SecurityResourceRoleId castOther = (SecurityResourceRoleId) other;

		return ((this.getSecurityRole() == castOther.getSecurityRole()) || (this
				.getSecurityRole() != null
				&& castOther.getSecurityRole() != null && this
				.getSecurityRole().equals(castOther.getSecurityRole())))
				&& ((this.getSecurityResource() == castOther
						.getSecurityResource()) || (this.getSecurityResource() != null
						&& castOther.getSecurityResource() != null && this
						.getSecurityResource().equals(
								castOther.getSecurityResource())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getSecurityRole() == null ? 0 : this.getSecurityRole()
						.hashCode());
		result = 37
				* result
				+ (getSecurityResource() == null ? 0 : this
						.getSecurityResource().hashCode());
		return result;
	}

}