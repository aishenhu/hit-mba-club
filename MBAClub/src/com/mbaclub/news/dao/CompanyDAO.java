package com.mbaclub.news.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.Company;

/**
 * A data access object (DAO) providing persistence and search support for
 * Company entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.Company
 * @author MyEclipse Persistence Tools
 */

public class CompanyDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(CompanyDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String INTRODUCE = "introduce";
	public static final String URL = "url";
	public static final String CATEGORY = "category";
	public static final String ORDER_VALUE = "orderValue";
	public static final String LOGO = "logo";

	/**
	 * 会员单位
	 */
	public static final int CATEGORY_TYPE_MEMBER = 1;
	/**
	 * 合作企业
	 */
	public static final int CATEGORY_TYPE_ENTERPRISE = 2;

	public void save(Company transientInstance) {
		log.debug("saving Company instance");
		org.hibernate.Transaction t = null;
		try {
			t = getSession().beginTransaction();
			getSession().save(transientInstance);
			t.commit();
			log.debug("save successful");
		} catch (RuntimeException re) {
			t.rollback();
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Company persistentInstance) {
		log.debug("deleting Company instance");
		org.hibernate.Transaction t = null;
		try {
			t = getSession().beginTransaction();
			getSession().delete(persistentInstance);
			t.commit();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			t.rollback();
			log.error("delete failed", re);
			throw re;
		}
	}

	public Company findById(java.lang.Long id) {
		log.debug("getting Company instance with id: " + id);
		try {
			Company instance = (Company) getSession().get(
					"com.mbaclub.news.pojo.Company", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Company instance) {
		log.debug("finding Company instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.Company").add(
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
		log.debug("finding Company instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Company as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByIntroduce(Object introduce) {
		return findByProperty(INTRODUCE, introduce);
	}

	public List findByUrl(Object url) {
		return findByProperty(URL, url);
	}

	public List findByCategory(Object category) {
		return findByProperty(CATEGORY, category);
	}

	public List findByOrderValue(Object orderValue) {
		return findByProperty(ORDER_VALUE, orderValue);
	}

	public List findByLogo(Object logo) {
		return findByProperty(LOGO, logo);
	}

	public List findAll() {
		log.debug("finding all Company instances");
		try {
			String queryString = "from Company";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Company merge(Company detachedInstance) {
		log.debug("merging Company instance");
		try {
			Company result = (Company) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Company instance) {
		log.debug("attaching dirty Company instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Company instance) {
		log.debug("attaching clean Company instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/**
	 * 得到所有企业名单
	 * 
	 * @param category
	 * @return
	 */
	public List<Company> getCompanys(int category) {
		try {
			String queryString = "from Company as c where c.category = ? order by c.orderValue asc";
			Query queryObject = getSession().createQuery(queryString)
					.setInteger(0, category);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 得到企业名单，没有缩略图的
	 * 
	 * @param category
	 * @return
	 */
	public List<Company> getCompanysNoImage(int category) {
		try {
			String queryString = "from Company as c where c.category = ? and c.logo is null order by c.orderValue";
			Query queryObject = getSession().createQuery(queryString)
					.setInteger(0, category);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 得到企业名单，有缩略图的
	 * 
	 * @param category
	 * @return
	 */
	public List<Company> getCompanysWithImage(int category) {
		try {
			String queryString = "from Company as c where c.category = ? and c.logo is not null order by c.orderValue";
			Query queryObject = getSession().createQuery(queryString)
					.setInteger(0, category);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 得到指定类型的的数量
	 * 
	 * @return
	 */
	public int getAllCount(int category) {
		try {
			String queryString = "select count(c) from Company as c where c.category = ?";
			Query queryObject = getSession().createQuery(queryString)
					.setInteger(0, category);
			return Integer.parseInt(queryObject.uniqueResult() + "");
		} catch (RuntimeException re) {
			throw re;
		}
	}
}