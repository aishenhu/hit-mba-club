package com.mbaclub.news.util;

import com.mbaclub.news.dao.CompanyDAO;
import com.mbaclub.news.dao.NewsDAO;
import com.mbaclub.news.pojo.Company;
import com.mbaclub.news.pojo.News;
import com.mbaclub.news.pojo.UrlInfo;

public class UrlUtil {
	/**
	 * 根据分类得到不同的显示界面Url
	 * 
	 * @param category
	 * @return
	 */
	public static UrlInfo getNewsUrl(int category) {
		switch (category) {
		case NewsDAO.NEWS_CATEGORY_ACTIVITY:
			return new UrlInfo("活动发布", "activities.jsp");
		case NewsDAO.NEWS_CATEGORY_INFO_EXCHANGE:
			return new UrlInfo("信息交流", "information.jsp");
		case NewsDAO.NEWS_CATEGORY_REVIEW_MINI:
		case NewsDAO.NEWS_CATEGORY_REVIEW:
			return new UrlInfo("活动回顾", "review.jsp");
		case NewsDAO.NEWS_CATEGORY_SCHOOL:
			return new UrlInfo("校园在线", "school.jsp");
		default:
			return new UrlInfo("", "");
		}
	}

	/**
	 * 得到发布管理的URL
	 * 
	 * @param type
	 *            类型
	 * @return
	 */
	public static UrlInfo getPublishManagerUrl(int type) {
		switch (type) {
		case 0:
			return new UrlInfo("活动发布", "", NewsDAO.NEWS_CATEGORY_ACTIVITY);
		case 1:
			return new UrlInfo("活动回顾（大图）", "", NewsDAO.NEWS_CATEGORY_REVIEW_NORMAL);
		case 2:
			return new UrlInfo("会员单位", "", CompanyDAO.CATEGORY_TYPE_MEMBER);
		case 3:
			return new UrlInfo("合作企业", "", CompanyDAO.CATEGORY_TYPE_ENTERPRISE);
		case 4:
			return new UrlInfo("信息交流", "", NewsDAO.NEWS_CATEGORY_INFO_EXCHANGE);
		case 5:
			return new UrlInfo("精彩会员", "");
		case 6:
			return new UrlInfo("校园在线", "", NewsDAO.NEWS_CATEGORY_SCHOOL);
		case 7:
			return new UrlInfo("活动回顾（小图）", "", NewsDAO.NEWS_CATEGORY_REVIEW_MINI);
		default:
			return new UrlInfo("", "");
		}
	}
	
	/**
	 * 得到一个合法的地址
	 * 
	 * @param url
	 * @return
	 */
	public static String getLegalUrl(String url) {
		if (url == null || "".equals(url)) {
			return "无";
		}
		if (url.startsWith("http:") || url.startsWith("https:")) {
			return url;
		} else {
			return "http://" + url;
		}
	}
}
