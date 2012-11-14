package com.mbaclub.news.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.SecurityDept;

/**
 * A data access object (DAO) providing persistence and search support for
 * SecurityDept entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.SecurityDept
 * @author MyEclipse Persistence Tools
 */

public class SecurityDeptDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityDeptDAO.class);
	// property constants
	public static final String THE_SORT = "theSort";
	public static final String DESCN = "descn";
	public static final String NAME = "name";

	public void save(SecurityDept transientInstance) {
		log.debug("saving SecurityDept instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SecurityDept persistentInstance) {
		log.debug("deleting SecurityDept instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SecurityDept findById(java.lang.Long id) {
		log.debug("getting SecurityDept instance with id: " + id);
		try {
			SecurityDept instance = (SecurityDept) getSession().get(
					"com.mbaclub.news.pojo.SecurityDept", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SecurityDept instance) {
		log.debug("finding SecurityDept instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.SecurityDept").add(
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
		log.debug("finding SecurityDept instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SecurityDept as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTheSort(Object theSort) {
		return findByProperty(THE_SORT, theSort);
	}

	public List findByDescn(Object descn) {
		return findByProperty(DESCN, descn);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all SecurityDept instances");
		try {
			String queryString = "from SecurityDept";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SecurityDept merge(SecurityDept detachedInstance) {
		log.debug("merging SecurityDept instance");
		try {
			SecurityDept result = (SecurityDept) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SecurityDept instance) {
		log.debug("attaching dirty SecurityDept instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SecurityDept instance) {
		log.debug("attaching clean SecurityDept instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}