package com.mbaclub.news.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbaclub.news.dao.SecurityRoleUserDAO;
import com.mbaclub.news.dao.SecurityUserDAO;
import com.mbaclub.news.pojo.SecurityUser;

public class UserAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserAction() {
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

		String action = request.getParameter("action");
		String id = request.getParameter("uid");
		Long uid = 0L;
		try {
			uid = Long.parseLong(id);
		} catch (Exception e) {
			uid = 0L;
		}
		SecurityUserDAO userDao = new SecurityUserDAO();
		SecurityUser user = userDao.findById(uid);

		if ("user_manager".equals(action)) {
			user.setStatus(Short.parseShort(request.getParameter("enabled-"
					+ user.getId())));
			userDao.save(user);
			SecurityRoleUserDAO roleDao = new SecurityRoleUserDAO();
			roleDao.changeRole(uid.intValue(), Integer.parseInt(request
					.getParameter("role")));
			response.sendRedirect("user-manager.jsp");
		} else if ("user_audit".equals(action)) {
			try {
				user.setStatus(Short
						.parseShort(request.getParameter("operate")));
			} catch (Exception e) {
				user.setStatus(Short.valueOf("3"));
			}
			userDao.save(user);
			response.sendRedirect("audituser.jsp");
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
