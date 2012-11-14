package com.mbaclub.news.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbaclub.news.dao.SecurityUserDAO;

/**
 * 用户登陆
 * 
 * @author Administrator
 * 
 */
public class Login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Login() {
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
//		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		System.out.println(username);
//		System.out.println(password);
		SecurityUserDAO userDao = new SecurityUserDAO();
		int result = userDao.isUser(username, password);
		if (result == SecurityUserDAO.USER_STATUS_ERROR) {
			request.setAttribute("result", "用户名或者密码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (result == SecurityUserDAO.USER_STATUS_FROZEN) {
			request.setAttribute("result", "用户名处于冻结");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (result == SecurityUserDAO.USER_STATUS_NO_AUDIT) {
			request.setAttribute("result", "用户名未审核");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (result == SecurityUserDAO.USER_STATUS_NORMAL) {
			System.out.println("用户名正常登陆");
			request.getSession()
					.setAttribute("User", userDao.getSecurityUser());
			boolean re = userDao.isAdmin(userDao.getSecurityUser());
			System.out.println("isAdmin = " + re);
			response.sendRedirect("user/index.jsp");
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
