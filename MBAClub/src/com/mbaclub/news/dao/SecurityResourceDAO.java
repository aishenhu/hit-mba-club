package com.mbaclub.news.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.SecurityResource;

/**
 * A data access object (DAO) providing persistence and search support for
 * SecurityResource entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.SecurityResource
 * @author MyEclipse Persistence Tools
 */

public class SecurityResourceDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityResourceDAO.class);
	// property constants
	public static final String DESCN = "descn";
	public static final String RES_TYPE = "resType";
	public static final String RES_STRING = "resString";
	public static final String NAME = "name";

	public void save(SecurityResource transientInstance) {
		log.debug("saving SecurityResource instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SecurityResource persistentInstance) {
		log.debug("deleting SecurityResource instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SecurityResource findById(java.lang.Long id) {
		log.debug("getting SecurityResource instance with id: " + id);
		try {
			SecurityResource instance = (SecurityResource) getSession().get(
					"com.mbaclub.news.pojo.SecurityResource", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SecurityResource instance) {
		log.debug("finding SecurityResource instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.SecurityResource").add(
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
		log.debug("finding SecurityResource instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SecurityResource as model where model."
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

	public List findByResType(Object resType) {
		return findByProperty(RES_TYPE, resType);
	}

	public List findByResString(Object resString) {
		return findByProperty(RES_STRING, resString);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all SecurityResource instances");
		try {
			String queryString = "from SecurityResource";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SecurityResource merge(SecurityResource detachedInstance) {
		log.debug("merging SecurityResource instance");
		try {
			SecurityResource result = (SecurityResource) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SecurityResource instance) {
		log.debug("attaching dirty SecurityResource instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SecurityResource instance) {
		log.debug("attaching clean SecurityResource instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}