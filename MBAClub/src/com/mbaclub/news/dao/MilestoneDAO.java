package com.mbaclub.news.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.Milestone;

/**
 * A data access object (DAO) providing persistence and search support for
 * Milestone entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.Milestone
 * @author MyEclipse Persistence Tools
 */

public class MilestoneDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MilestoneDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String IMAGE = "image";
	public static final String MORE_URL = "moreUrl";

	public void save(Milestone transientInstance) {
		log.debug("saving Milestone instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Milestone persistentInstance) {
		log.debug("deleting Milestone instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Milestone findById(java.lang.Long id) {
		log.debug("getting Milestone instance with id: " + id);
		try {
			Milestone instance = (Milestone) getSession().get(
					"com.mbaclub.news.pojo.Milestone", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Milestone instance) {
		log.debug("finding Milestone instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.Milestone").add(
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
		log.debug("finding Milestone instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Milestone as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByImage(Object image) {
		return findByProperty(IMAGE, image);
	}

	public List findByMoreUrl(Object moreUrl) {
		return findByProperty(MORE_URL, moreUrl);
	}

	public List<Milestone> findAll() {
		log.debug("finding all Milestone instances");
		try {
			String queryString = "from Milestone as m order by m.eventDate desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Milestone merge(Milestone detachedInstance) {
		log.debug("merging Milestone instance");
		try {
			Milestone result = (Milestone) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Milestone instance) {
		log.debug("attaching dirty Milestone instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Milestone instance) {
		log.debug("attaching clean Milestone instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/**
	 * 根据页码也大小得到
	 * 
	 * @param page
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Milestone> getMilestones(int frist, int count) {
		log.debug("finding Milestone by page instances");
		try {
			String queryString = "from Milestone as m order by m.eventDate desc";
			Query queryObject = getSession().createQuery(queryString)
					.setFirstResult(frist).setMaxResults(count);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all by page failed", re);
			throw re;
		}
	}
}