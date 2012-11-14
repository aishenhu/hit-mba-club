package com.mbaclub.news.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.NewsTag;

/**
 * A data access object (DAO) providing persistence and search support for
 * NewsTag entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.NewsTag
 * @author MyEclipse Persistence Tools
 */

public class NewsTagDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(NewsTagDAO.class);
	// property constants
	public static final String THE_SORT = "theSort";
	public static final String NAME = "name";

	public void save(NewsTag transientInstance) {
		log.debug("saving NewsTag instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(NewsTag persistentInstance) {
		log.debug("deleting NewsTag instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NewsTag findById(java.lang.Long id) {
		log.debug("getting NewsTag instance with id: " + id);
		try {
			NewsTag instance = (NewsTag) getSession().get(
					"com.mbaclub.news.pojo.NewsTag", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(NewsTag instance) {
		log.debug("finding NewsTag instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.NewsTag").add(
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
		log.debug("finding NewsTag instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from NewsTag as model where model."
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

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all NewsTag instances");
		try {
			String queryString = "from NewsTag";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public NewsTag merge(NewsTag detachedInstance) {
		log.debug("merging NewsTag instance");
		try {
			NewsTag result = (NewsTag) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NewsTag instance) {
		log.debug("attaching dirty NewsTag instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NewsTag instance) {
		log.debug("attaching clean NewsTag instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}