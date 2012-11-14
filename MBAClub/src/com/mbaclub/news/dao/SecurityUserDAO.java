package com.mbaclub.news.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.SecurityUser;

/**
 * A data access object (DAO) providing persistence and search support for
 * SecurityUser entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.mbaclub.news.pojo.SecurityUser
 * @author MyEclipse Persistence Tools
 */

public class SecurityUserDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityUserDAO.class);
	/**
	 * 状态错误
	 */
	public static final int USER_STATUS_ERROR = 0xF1;
	/**
	 * 未审核
	 */
	public static final int USER_STATUS_NO_AUDIT = 0xF2;
	/**
	 * 状态冻结
	 */
	public static final int USER_STATUS_FROZEN = 0xF3;
	/**
	 * 状态正常
	 */
	public static final int USER_STATUS_NORMAL = 0xF4;
	// property constants
	public static final String USERNAME = "username";
	public static final String EMAIL = "email";
	public static final String DESCN = "descn";
	public static final String CODE = "code";
	public static final String TRUENAME = "truename";
	public static final String SEX = "sex";
	public static final String TEL = "tel";
	public static final String MOBILE = "mobile";
	public static final String DUTY = "duty";
	public static final String PASSWORD = "password";
	public static final String STATUS = "status";

	public void save(SecurityUser transientInstance) {
		log.debug("saving SecurityUser instance");
		Transaction t = getSession().beginTransaction();
		try {
			getSession().save(transientInstance);
			t.commit();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			t.rollback();
			throw re;
		}
	}

	public void delete(SecurityUser persistentInstance) {
		log.debug("deleting SecurityUser instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SecurityUser findById(java.lang.Long id) {
		log.debug("getting SecurityUser instance with id: " + id);
		try {
			SecurityUser instance = (SecurityUser) getSession().get(
					"com.mbaclub.news.pojo.SecurityUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SecurityUser instance) {
		log.debug("finding SecurityUser instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.SecurityUser").add(
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
		log.debug("finding SecurityUser instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SecurityUser as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByDescn(Object descn) {
		return findByProperty(DESCN, descn);
	}

	public List findByCode(Object code) {
		return findByProperty(CODE, code);
	}

	public List findByTruename(Object truename) {
		return findByProperty(TRUENAME, truename);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List findByMobile(Object mobile) {
		return findByProperty(MOBILE, mobile);
	}

	public List findByDuty(Object duty) {
		return findByProperty(DUTY, duty);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List<SecurityUser> findAll() {
		log.debug("finding all SecurityUser instances");
		try {
			String queryString = "from SecurityUser";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SecurityUser merge(SecurityUser detachedInstance) {
		log.debug("merging SecurityUser instance");
		try {
			SecurityUser result = (SecurityUser) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SecurityUser instance) {
		log.debug("attaching dirty SecurityUser instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SecurityUser instance) {
		log.debug("attaching clean SecurityUser instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/**
	 * 当前操作的用户
	 */
	private SecurityUser securityUser = null;

	/**
	 * 得到当前的验证用户
	 * 
	 * @return
	 */
	public SecurityUser getSecurityUser() {
		return securityUser;
	}

	/**
	 * 判断是否是系统用户
	 * 
	 * @param username
	 * @param password
	 * @return 返回0xF1代表非法用户，0xF2代表未审核, 0xF3代表冻结, 0xF4代表正常
	 */
	public int isUser(String username, String password) {
		try {
			String queryString = "from SecurityUser as u where u.username = ? and u.password = ?";
			Query queryObject = getSession().createQuery(queryString)
					.setString(0, username).setString(1, password);
			List<SecurityUser> list = queryObject.list();
			if (list == null || list.isEmpty()) {
				this.securityUser = null;
				return USER_STATUS_ERROR;
			}
			SecurityUser user = list.get(0);
			this.securityUser = user;
			if (user.getStatus() == 0) {
				// 冻结
				return USER_STATUS_FROZEN;
			}
			if (user.getStatus() == 2) {
				// 未审核
				return USER_STATUS_NO_AUDIT;
			}
			return USER_STATUS_NORMAL;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/**
	 * 检查是否存在该用户
	 * 
	 * @param username
	 * @return 如果存在则返回true，否则返回false
	 */
	public boolean hasUser(String username) {
		try {
			String queryString = "select count(u) from SecurityUser as u where u.username = ?";
			Query queryObject = getSession().createQuery(queryString)
					.setString(0, username);
			int result = Integer.parseInt(queryObject.uniqueResult() + "");
			return result > 0 ? true : false;
		} catch (Exception e) {
			return true;
		}
	}

	/**
	 * 判断用户是否的管理员
	 * 
	 * @param user
	 * @return
	 */
	public boolean isAdmin(SecurityUser user) {
		try {
			String queryString = "select role.name from SecurityRole as role, SecurityRoleUser as ruser where role.id = ruser.id.securityRole.id and ruser.id.securityUser.id = ?";
			Query queryObject = getSession().createQuery(queryString).setLong(
					0, user.getId());
			List list = queryObject.list();
			if (list != null && !list.isEmpty()) {
				return "ROLE_ADMIN".equals(list.get(0));
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 得到所有用户的总数
	 * 
	 * @return
	 */
	public int getCount() {
		log.debug("finding all SecurityUser instances");
		try {
			String queryString = "select count(su) from SecurityUser as su";
			Query queryObject = getSession().createQuery(queryString);
			return Integer.parseInt(queryObject.uniqueResult() + "");
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/**
	 * 得到新申请,并为审核的用户。status的值为3时则为新申请状态,1为正常状态，0为冻结状态
	 * 
	 * @return
	 */
	public List<SecurityUser> getNewUsers() {
		log.debug("finding getNewUsers instances");
		try {
			String queryString = "from SecurityUser as su where su.status = 2";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find getNewUsers failed", re);
			throw re;
		}
	}
}