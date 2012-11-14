package com.mbaclub.news.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbaclub.news.dao.SecurityUserDAO;
import com.mbaclub.news.pojo.SecurityUser;

/**
 * 用户申请
 * 
 * @author Administrator
 * 
 */
public class Register extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Register() {
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
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String info = request.getParameter("infor");
		String truename = request.getParameter("truename");
		System.out.println("Register Servlet....");
		System.out.println("username...." + username);
		System.out.println("password...." + password);
		System.out.println("email...." + email);
		System.out.println("company...." + company);
		System.out.println("info...." + info);
		SecurityUserDAO userDao = new SecurityUserDAO();
		SecurityUser user = new SecurityUser();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setDuty(company);
		user.setDescn(info);
		user.setTruename(truename);
		// 状态2为为审核状态
		user.setStatus((short) 2);
		user.setBirthday(new Timestamp(System.currentTimeMillis()));
		userDao.save(user);
		response.sendRedirect(request.getContextPath() + "/registerResult.jsp");
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
