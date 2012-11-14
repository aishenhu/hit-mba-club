package com.mbaclub.news.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.NewsCategory;

/**
 * A data access object (DAO) providing persistence and search support for
 * NewsCategory entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.NewsCategory
 * @author MyEclipse Persistence Tools
 */

public class NewsCategoryDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(NewsCategoryDAO.class);
	// property constants
	public static final String THE_SORT = "theSort";
	public static final String BIT_CODE = "bitCode";
	public static final String CHAR_CODE = "charCode";
	public static final String NAME = "name";
	public static final String STATUS = "status";

	public void save(NewsCategory transientInstance) {
		log.debug("saving NewsCategory instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(NewsCategory persistentInstance) {
		log.debug("deleting NewsCategory instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NewsCategory findById(java.lang.Long id) {
		log.debug("getting NewsCategory instance with id: " + id);
		try {
			NewsCategory instance = (NewsCategory) getSession().get(
					"com.mbaclub.news.pojo.NewsCategory", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(NewsCategory instance) {
		log.debug("finding NewsCategory instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.NewsCategory").add(
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
		log.debug("finding NewsCategory instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from NewsCategory as model where model."
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

	public List findByBitCode(Object bitCode) {
		return findByProperty(BIT_CODE, bitCode);
	}

	public List findByCharCode(Object charCode) {
		return findByProperty(CHAR_CODE, charCode);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all NewsCategory instances");
		try {
			String queryString = "from NewsCategory";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public NewsCategory merge(NewsCategory detachedInstance) {
		log.debug("merging NewsCategory instance");
		try {
			NewsCategory result = (NewsCategory) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NewsCategory instance) {
		log.debug("attaching dirty NewsCategory instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NewsCategory instance) {
		log.debug("attaching clean NewsCategory instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}