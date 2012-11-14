package com.mbaclub.news.pojo;

import com.mbaclub.news.dao.BaseHibernateDAO;
import com.mbaclub.news.pojo.SchoolImage;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * SchoolImage entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.SchoolImage
 * @author MyEclipse Persistence Tools
 */

public class SchoolImageDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SchoolImageDAO.class);
	// property constants
	public static final String IMAGE_PATH = "imagePath";
	public static final String INTRODUCE = "introduce";
	public static final String DESCRIBE = "describe";

	public void save(SchoolImage transientInstance) {
		log.debug("saving SchoolImage instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SchoolImage persistentInstance) {
		log.debug("deleting SchoolImage instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SchoolImage findById(java.lang.Long id) {
		log.debug("getting SchoolImage instance with id: " + id);
		try {
			SchoolImage instance = (SchoolImage) getSession().get(
					"com.mbaclub.news.pojo.SchoolImage", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SchoolImage instance) {
		log.debug("finding SchoolImage instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.SchoolImage").add(
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
		log.debug("finding SchoolImage instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SchoolImage as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByImagePath(Object imagePath) {
		return findByProperty(IMAGE_PATH, imagePath);
	}

	public List findByIntroduce(Object introduce) {
		return findByProperty(INTRODUCE, introduce);
	}

	public List findByDescribe(Object describe) {
		return findByProperty(DESCRIBE, describe);
	}

	public List findAll() {
		log.debug("finding all SchoolImage instances");
		try {
			String queryString = "from SchoolImage";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SchoolImage merge(SchoolImage detachedInstance) {
		log.debug("merging SchoolImage instance");
		try {
			SchoolImage result = (SchoolImage) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SchoolImage instance) {
		log.debug("attaching dirty SchoolImage instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SchoolImage instance) {
		log.debug("attaching clean SchoolImage instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}