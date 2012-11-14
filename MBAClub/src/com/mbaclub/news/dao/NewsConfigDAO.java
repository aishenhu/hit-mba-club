package com.mbaclub.news.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.NewsConfig;

/**
 * A data access object (DAO) providing persistence and search support for
 * NewsConfig entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.NewsConfig
 * @author MyEclipse Persistence Tools
 */

public class NewsConfigDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(NewsConfigDAO.class);
	// property constants
	public static final String NEWS_NEED_AUDIT = "newsNeedAudit";
	public static final String COMMENT_NEED_AUDIT = "commentNeedAudit";
	public static final String COULD_COMMENT = "couldComment";
	public static final String CATEGORY_STRATEGY = "categoryStrategy";
	public static final String TEMPLATE_NAME = "templateName";

	public void save(NewsConfig transientInstance) {
		log.debug("saving NewsConfig instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(NewsConfig persistentInstance) {
		log.debug("deleting NewsConfig instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NewsConfig findById(java.lang.Long id) {
		log.debug("getting NewsConfig instance with id: " + id);
		try {
			NewsConfig instance = (NewsConfig) getSession().get(
					"com.mbaclub.news.pojo.NewsConfig", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(NewsConfig instance) {
		log.debug("finding NewsConfig instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.NewsConfig").add(
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
		log.debug("finding NewsConfig instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from NewsConfig as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByNewsNeedAudit(Object newsNeedAudit) {
		return findByProperty(NEWS_NEED_AUDIT, newsNeedAudit);
	}

	public List findByCommentNeedAudit(Object commentNeedAudit) {
		return findByProperty(COMMENT_NEED_AUDIT, commentNeedAudit);
	}

	public List findByCouldComment(Object couldComment) {
		return findByProperty(COULD_COMMENT, couldComment);
	}

	public List findByCategoryStrategy(Object categoryStrategy) {
		return findByProperty(CATEGORY_STRATEGY, categoryStrategy);
	}

	public List findByTemplateName(Object templateName) {
		return findByProperty(TEMPLATE_NAME, templateName);
	}

	public List findAll() {
		log.debug("finding all NewsConfig instances");
		try {
			String queryString = "from NewsConfig";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public NewsConfig merge(NewsConfig detachedInstance) {
		log.debug("merging NewsConfig instance");
		try {
			NewsConfig result = (NewsConfig) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NewsConfig instance) {
		log.debug("attaching dirty NewsConfig instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NewsConfig instance) {
		log.debug("attaching clean NewsConfig instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}