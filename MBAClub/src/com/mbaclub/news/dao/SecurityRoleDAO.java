package com.mbaclub.news.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.SecurityRole;

/**
 * A data access object (DAO) providing persistence and search support for
 * SecurityRole entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.SecurityRole
 * @author MyEclipse Persistence Tools
 */

public class SecurityRoleDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityRoleDAO.class);
	// property constants
	public static final String DESCN = "descn";
	public static final String NAME = "name";

	public void save(SecurityRole transientInstance) {
		log.debug("saving SecurityRole instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SecurityRole persistentInstance) {
		log.debug("deleting SecurityRole instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SecurityRole findById(java.lang.Long id) {
		log.debug("getting SecurityRole instance with id: " + id);
		try {
			SecurityRole instance = (SecurityRole) getSession().get(
					"com.mbaclub.news.pojo.SecurityRole", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SecurityRole instance) {
		log.debug("finding SecurityRole instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.SecurityRole").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding SecurityRole instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SecurityRole as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDescn(Object descn) {
		return findByProperty(DESCN, descn);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all SecurityRole instances");
		try {
			String queryString = "from SecurityRole";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SecurityRole merge(SecurityRole detachedInstance) {
		log.debug("merging SecurityRole instance");
		try {
			SecurityRole result = (SecurityRole) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SecurityRole instance) {
		log.debug("attaching dirty SecurityRole instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SecurityRole instance) {
		log.debug("attaching clean SecurityRole instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}