package com.mbaclub.news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbaclub.news.dao.CompanyDAO;
import com.mbaclub.news.pojo.Company;

public class CompanyManagerAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CompanyManagerAction() {
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
		CompanyDAO dao = new CompanyDAO();

		if ("top".equals(action)) {
			int type = 2;
			try {
				type = Integer.parseInt(request.getParameter("type")) - 1;
			} catch (Exception e) {
				type = 2;
			}
			int id = 0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch (Exception e) {
				id = 0;
			}
			List<Company> list = dao.getCompanys(type);
			int count = 1;
			for (Company c : list) {
				if (c.getId() == id) {
					c.setOrderValue(0);
				} else {
					c.setOrderValue(count++);
				}
				dao.save(c);
			}
			response.sendRedirect("publish-manager.jsp?type=" + (type + 1));
		} else if ("delete".equals(action)) {
			long id = 0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch (Exception e) {
				id = 0;
			}
			dao.delete(dao.findById(id));
			response.sendRedirect("publish-manager.jsp?type="
					+ request.getParameter("type"));
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
