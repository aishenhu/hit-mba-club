package com.mbaclub.news.dao;

import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.SecurityRoleUser;
import com.mbaclub.news.pojo.SecurityRoleUserId;

/**
 * A data access object (DAO) providing persistence and search support for
 * SecurityRoleUser entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.SecurityRoleUser
 * @author MyEclipse Persistence Tools
 */

public class SecurityRoleUserDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityRoleUserDAO.class);

	// property constants

	public void save(SecurityRoleUser transientInstance) {
		log.debug("saving SecurityRoleUser instance");
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

	public void delete(SecurityRoleUser persistentInstance) {
		log.debug("deleting SecurityRoleUser instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SecurityRoleUser findById(com.mbaclub.news.pojo.SecurityRoleUserId id) {
		log.debug("getting SecurityRoleUser instance with id: " + id);
		try {
			SecurityRoleUser instance = (SecurityRoleUser) getSession().get(
					"com.mbaclub.news.pojo.SecurityRoleUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SecurityRoleUser instance) {
		log.debug("finding SecurityRoleUser instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.SecurityRoleUser").add(
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
		log.debug("finding SecurityRoleUser instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SecurityRoleUser as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all SecurityRoleUser instances");
		try {
			String queryString = "from SecurityRoleUser";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SecurityRoleUser merge(SecurityRoleUser detachedInstance) {
		log.debug("merging SecurityRoleUser instance");
		try {
			SecurityRoleUser result = (SecurityRoleUser) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SecurityRoleUser instance) {
		log.debug("attaching dirty SecurityRoleUser instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SecurityRoleUser instance) {
		log.debug("attaching clean SecurityRoleUser instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/**
	 * 改用一个用户的角色
	 * 
	 * @param uid
	 * @param roleid
	 */
	public int changeRole(long uid, long roleid) {
		org.hibernate.Transaction t = null;
		try {
			t = getSession().beginTransaction();
			String queryString = "update SecurityRoleUser as ru set ru.id.securityRole.id = ? where ru.id.securityUser.id = ?";
			Query queryObject = getSession().createQuery(queryString) 
					.setLong(0, roleid).setLong(1, uid);
			int result = queryObject.executeUpdate();
			t.commit();
			if(result == 0) {
				SecurityUserDAO udao = new SecurityUserDAO();
				SecurityRoleDAO rdao = new SecurityRoleDAO();
				SecurityRoleUser ru = new SecurityRoleUser(new SecurityRoleUserId(udao.findById(uid), rdao.findById(roleid)));
				this.save(ru);
				return 1;
			}
			return result;
		} catch (RuntimeException re) {
			t.rollback();
			log.error("find all failed", re);
			throw re;
		}
	}
}