package com.mbaclub.news.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbaclub.news.dao.CompanyDAO;
import com.mbaclub.news.dao.MemberDAO;
import com.mbaclub.news.dao.NewsCategoryDAO;
import com.mbaclub.news.dao.NewsDAO;
import com.mbaclub.news.pojo.Company;
import com.mbaclub.news.pojo.Member;
import com.mbaclub.news.pojo.News;
import com.mbaclub.news.pojo.SecurityUser;
import com.mbaclub.news.pojo.UrlInfo;
import com.mbaclub.news.util.UrlUtil;

public class Publish extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Publish() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		// String info = request.getParameter("publishInfo");
		String title = request.getParameter("title");
		String tags = request.getParameter("tags");
		String thumb = request.getParameter("thumb");
		String content = request.getParameter("content");
		// 是否是升级
		Boolean isModify = Boolean.parseBoolean(request.getParameter("modify"));
		int type = -1;
		try {
			type = Integer.parseInt(request.getParameter("type"));
		} catch (Exception e) {
			type = -1;
		}
		int thumbType = -1;
		try{
			// 0是小图，1是大图
			thumbType = Integer.parseInt(request.getParameter("thumbType"));
		} catch (Exception e) {
			thumbType = -1;
		}
		
		System.out.println("type = " + request.getParameter("type"));
		System.out.println("thumbType = " + request.getParameter("thumbType"));
		UrlInfo url = UrlUtil.getPublishManagerUrl(type);
		if (type == 0 || type == 1 || type == 4 || type == 6 || type == 7) {
			NewsDAO newsDao = new NewsDAO();
			com.mbaclub.news.pojo.News news = null;
			if(isModify) {
				try{
					news = newsDao.findById(Long.parseLong(request.getParameter("id")));
				}catch(Exception e){
					news = new News();
					// 设置为未审核
					news.setStatus(0);
					// 设置时间
					news.setUpdateDate(new Timestamp(System.currentTimeMillis()));
					// 设置初始点击量
					news.setHit(0);
				}
			} else {
				news = new News();
				// 设置为未审核
				news.setStatus(0);
				// 设置时间
				news.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				// 设置初始点击量
				news.setHit(0);
			}
			NewsCategoryDAO categoryDao = new NewsCategoryDAO();
			news.setName(title);
			// 设置标签
			news.setSource(tags);
			// 设置缩略图
			if (thumb != null)
				news.setImage(thumb);
			// 设置内容
			news.setContent(content);
			// 设置发布者
			news.setSecurityUser((SecurityUser) request.getSession()
					.getAttribute("User"));
			System.out.println(((SecurityUser) request.getSession()
					.getAttribute("User")).getUsername());
			// 设置分类
			if (thumbType == 0) {
				news.setNewsCategory(categoryDao.findById((long)NewsDAO.NEWS_CATEGORY_REVIEW_MINI));
			} else {
				news.setNewsCategory(categoryDao.findById((long)NewsDAO.NEWS_CATEGORY_REVIEW_NORMAL));
			}
			newsDao.save(news);
			response.getWriter().print(
					getServletContext().getContextPath() + "/admin/news.jsp?id="
							+ news.getId());
		} else if (type == 2 || type == 3) {
			CompanyDAO cDao = new CompanyDAO();
			Company c = new Company();
			c.setCategory(url.getCategoryId());
			c.setName(request.getParameter("companyname"));
			c.setUrl(request.getParameter("companypage"));
			c.setIntroduce(request.getParameter("companyinfo"));
			c.setLogo(request.getParameter("companylogo"));
			c.setOrderValue(cDao.getMaxOrderValue(url.getCategoryId()) + 1);
			cDao.save(c);
			response.getWriter().print(
					getServletContext().getContextPath()
							+ "/enterprise.jsp?method=" + (type - 1));
		} else if (type == 5) {
			MemberDAO mDao = new MemberDAO();
			Member m = new Member();
			m.setName(request.getParameter("username"));
			m.setCompany(request.getParameter("usercompany"));
			m.setSchool(request.getParameter("userschool"));
			m.setMotto(request.getParameter("usermotto"));
			m.setUrl(request.getParameter("userpage"));
			m.setIntroduce(request.getParameter("userinfo"));
			m.setImage(request.getParameter("companylogo"));
			mDao.save(m);
			response.getWriter().print(
					getServletContext().getContextPath() + "/member.jsp?id=" + m.getId());
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
