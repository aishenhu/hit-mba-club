package com.mbaclub.news.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mbaclub.news.pojo.News;

/**
 * A data access object (DAO) providing persistence and search support for News
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.mbaclub.news.pojo.News
 * @author MyEclipse Persistence Tools
 */

public class NewsDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(NewsDAO.class);
	// property constants
	public static final String SUBTITLE = "subtitle";
	public static final String LINK = "link";
	public static final String HIT = "hit";
	public static final String SUMMARY = "summary";
	public static final String NAME = "name";
	public static final String CONTENT = "content";
	public static final String SOURCE = "source";
	public static final String IMAGE = "image";
	public static final String STATUS = "status";
	public static final String HTML = "html";
	public static final String PAGE_SIZE = "pageSize";
	public static final String PAGE_TYPE = "pageType";

	/**
	 * 活动发布
	 */
	public static final int NEWS_CATEGORY_ACTIVITY = 1;
	/**
	 * 活动回顾,小图
	 */
	public static final int NEWS_CATEGORY_REVIEW_MINI = 2;
	/**
	 * 信息交流
	 */
	public static final int NEWS_CATEGORY_INFO_EXCHANGE = 3;
	/**
	 * 学校在线
	 */
	public static final int NEWS_CATEGORY_SCHOOL = 4;
	/**
	 * 活动回顾正常
	 */
	public static final int NEWS_CATEGORY_REVIEW_NORMAL = 5;
	/**
	 * 活动回顾
	 */
	public static final int NEWS_CATEGORY_REVIEW = 6;

	public void save(News transientInstance) {
		log.debug("saving News instance");
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

	public void delete(News persistentInstance) {
		log.debug("deleting News instance");
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

	public News findById(java.lang.Long id) {
		log.debug("getting News instance with id: " + id);
		try {
			News instance = (News) getSession().get(
					"com.mbaclub.news.pojo.News", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(News instance) {
		log.debug("finding News instance by example");
		try {
			List results = getSession().createCriteria(
					"com.mbaclub.news.pojo.News").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding News instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from News as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySubtitle(Object subtitle) {
		return findByProperty(SUBTITLE, subtitle);
	}

	public List findByLink(Object link) {
		return findByProperty(LINK, link);
	}

	public List findByHit(Object hit) {
		return findByProperty(HIT, hit);
	}

	public List findBySummary(Object summary) {
		return findByProperty(SUMMARY, summary);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findBySource(Object source) {
		return findByProperty(SOURCE, source);
	}

	public List findByImage(Object image) {
		return findByProperty(IMAGE, image);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByHtml(Object html) {
		return findByProperty(HTML, html);
	}

	public List findByPageSize(Object pageSize) {
		return findByProperty(PAGE_SIZE, pageSize);
	}

	public List findByPageType(Object pageType) {
		return findByProperty(PAGE_TYPE, pageType);
	}

	public List findAll() {
		log.debug("finding all News instances");
		try {
			String queryString = "from News";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public News merge(News detachedInstance) {
		log.debug("merging News instance");
		try {
			News result = (News) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(News instance) {
		log.debug("attaching dirty News instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(News instance) {
		log.debug("attaching clean News instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/**
	 * 按照分类拿到新闻
	 * 
	 * @param categoryId
	 * @return
	 */
	public List<News> getNewsByCategoryID(long categoryId) {
		try {
			String queryString = "";
			Query queryObject;
			if (categoryId == NEWS_CATEGORY_REVIEW) {
				queryString = "from News as news where news.newsCategory.id = ? or news.newsCategory.id = ? order by news.updateDate desc";
				queryObject = getSession().createQuery(queryString).setLong(
						0, NEWS_CATEGORY_REVIEW_NORMAL).setLong(1, NEWS_CATEGORY_REVIEW_MINI);
			} else {
				queryString = "from News as news where news.newsCategory.id = ? order by news.updateDate desc";
				queryObject = getSession().createQuery(queryString).setLong(
						0, categoryId);
			}
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("getNewsByCategoryID failed", re);
			throw re;
		}
	}

	/**
	 * 按照分类拿到新闻，指定条数，通过审核的
	 * 
	 * @param categoryId
	 * @param count
	 * @return
	 */
	public List<News> getNewsByCategoryID(long categoryId, int frist, int count) {
		try {
			String queryString = "";
			Query queryObject;
			if (categoryId == NEWS_CATEGORY_REVIEW) {
				queryString = "from News as news where news.status = 1 and (news.newsCategory.id = ? or news.newsCategory.id = ? ) order by news.updateDate desc";
				queryObject = getSession().createQuery(queryString).setLong(
						0, NEWS_CATEGORY_REVIEW_NORMAL).setLong(1, NEWS_CATEGORY_REVIEW_MINI).setFirstResult(frist).setMaxResults(count);
			} else {
				queryString = "from News as news where news.status = 1 and news.newsCategory.id = ? order by news.updateDate desc";
				queryObject = getSession().createQuery(queryString).setLong(
						0, categoryId).setFirstResult(frist).setMaxResults(count);
			}
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("getNewsByCategoryID failed", re);
			throw re;
		}
	}

	/**
	 * 按照分类拿到新闻，指定条数
	 * 
	 * @param categoryId
	 * @param count
	 * @return
	 */
	public List<News> getAllNewsByCategoryID(long categoryId, int frist,
			int count) {
		try {
			String queryString = "from News as news where news.newsCategory.id = ? order by news.updateDate desc";
			Query queryObject = getSession().createQuery(queryString).setLong(
					0, categoryId).setFirstResult(frist).setMaxResults(count);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("getNewsByCategoryID failed", re);
			throw re;
		}
	}

	/**
	 * 得到回顾的新闻，指定条数，得到审核之后的
	 * 
	 * @param categoryId
	 * @param count
	 * @return
	 */
	public List<News> getNewsReview(int frist, int count) {
		try {
			String queryString = "from News as news where (news.newsCategory.id = ? or news.newsCategory = ?) and news.status = 1 order by news.updateDate desc";
			Query queryObject = getSession().createQuery(queryString).setLong(
					0, NEWS_CATEGORY_REVIEW_MINI).setLong(1,
					NEWS_CATEGORY_REVIEW_NORMAL).setFirstResult(frist)
					.setMaxResults(count);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("getNewsReview failed", re);
			throw re;
		}
	}

	/**
	 * 得到回顾的新闻，指定条数
	 * 
	 * @param categoryId
	 * @param count
	 * @return
	 */
	public List<News> getAllNewsReview(int frist, int count) {
		try {
			String queryString = "from News as news where (news.newsCategory.id = ? or news.newsCategory = ?) order by news.updateDate desc";
			Query queryObject = getSession().createQuery(queryString).setLong(
					0, NEWS_CATEGORY_REVIEW_MINI).setLong(1,
					NEWS_CATEGORY_REVIEW_NORMAL).setFirstResult(frist)
					.setMaxResults(count);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("getNewsReview failed", re);
			throw re;
		}
	}

	/**
	 * 得到审核新闻的数量
	 * 
	 * @param categoryId
	 * @return
	 */
	public int getNewsCountByCategoryID(long categoryId) {
		try {
			String queryString = "select count(news) from News as news where news.status = 1 and news.newsCategory.id = ?";
			Query queryObject = getSession().createQuery(queryString).setLong(
					0, categoryId);
			return Integer.parseInt(queryObject.uniqueResult() + "");
		} catch (RuntimeException re) {
			log.error("getNewsCountByCategoryID failed", re);
			throw re;
		}
	}

	/**
	 * 得到审核和未审核的新闻的数量
	 * 
	 * @param categoryId
	 * @return
	 */
	public int getAllNewsCountByCategoryID(long categoryId) {
		try {
			String queryString = "select count(news) from News as news where news.newsCategory.id = ?";
			Query queryObject = getSession().createQuery(queryString).setLong(
					0, categoryId);
			return Integer.parseInt(queryObject.uniqueResult() + "");
		} catch (RuntimeException re) {
			log.error("getNewsCountByCategoryID failed", re);
			throw re;
		}
	}

	/**
	 * 增加浏览量
	 * 
	 * @param newsId
	 */
	public void addHit(long newsId) {
		try {
			News news = this.findById(newsId);
			news.setHit(news.getHit() + 1);
			this.save(news);
		} catch (RuntimeException re) {
			log.error("addHit failed", re);
			throw re;
		}
	}

	/**
	 * 得到所有未审核的新闻
	 * 
	 * @return
	 */
	public List<News> getAllNotAuditNews() {
		try {
			String queryString = "from News as news where news.status = 0 order by news.updateDate desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("getNewsCountByCategoryID failed", re);
			throw re;
		}
	}
}