package com.mbaclub.news.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.Member;

/**
 * A data access object (DAO) providing persistence and search support for
 * Member entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.Member
 * @author MyEclipse Persistence Tools
 */

public class MemberDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(MemberDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String COMPANY = "company";
	public static final String SCHOOL = "school";
	public static final String MOTTO = "motto";
	public static final String URL = "url";
	public static final String INTRODUCE = "introduce";
	public static final String IMAGE = "image";

	public void save(Member transientInstance) {
		log.debug("saving Member instance");
		Transaction t = null;
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

	public void delete(Member persistentInstance) {
		log.debug("deleting Member instance");
		Transaction t = null;
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

	public Member findById(java.lang.Long id) {
		log.debug("getting Member instance with id: " + id);
		try {
			Member instance = (Member) getSession().get(
					"com.mbaclub.news.pojo.Member", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Member instance) {
		log.debug("finding Member instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.Member").add(
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
		log.debug("finding Member instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Member as model where model."
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

	public List findByCompany(Object company) {
		return findByProperty(COMPANY, company);
	}

	public List findBySchool(Object school) {
		return findByProperty(SCHOOL, school);
	}

	public List findByMotto(Object motto) {
		return findByProperty(MOTTO, motto);
	}

	public List findByUrl(Object url) {
		return findByProperty(URL, url);
	}

	public List findByIntroduce(Object introduce) {
		return findByProperty(INTRODUCE, introduce);
	}

	public List findByImage(Object image) {
		return findByProperty(IMAGE, image);
	}

	public List<Member> findAll() {
		log.debug("finding all Member instances");
		try {
			String queryString = "from Member as m order by m.orderValue asc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Member merge(Member detachedInstance) {
		log.debug("merging Member instance");
		try {
			Member result = (Member) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Member instance) {
		log.debug("attaching dirty Member instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Member instance) {
		log.debug("attaching clean Member instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/**
	 * 得到带图像的精彩会员
	 * 
	 * @return
	 */
	public List<Member> getMemberWithImage() {
		try {
			String queryString = "from Member as m where m.image is not null order by m.name desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/**
	 * 得到带不图像的精彩会员
	 * 
	 * @return
	 */
	public List<Member> getMemberWithNoImage() {
		try {
			String queryString = "from Member as m where m.image is null order by m.name desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
}