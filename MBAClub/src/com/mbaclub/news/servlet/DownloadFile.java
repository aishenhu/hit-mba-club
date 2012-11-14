package com.mbaclub.news.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Vector;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 下载文件
 * 
 * @author Administrator
 * 
 */
public class DownloadFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DownloadFile() {
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
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

	/**
	 * 批量下载
	 * 
	 * @param request
	 * @param response
	 * @param v
	 *            存储下载文件的数组
	 * @throws IOException
	 */
	private void download(HttpServletRequest request,
			HttpServletResponse response, Vector v) throws IOException {
		PrintWriter out = response.getWriter();
		File dir_file = new File(this.getServletContext().getRealPath("/")
				+ "/files/");
		int dir_l = dir_file.getAbsolutePath().length();
		response.setContentType("application/zip");
		response.setHeader("Content-Disposition",
				"attachment;filename=\"downloadname.rar\"");

		ZipOutputStream zipout = new ZipOutputStream(new Writer2Stream(out));
		zipout
				.setComment("Download selected files \nas one WinRAR file:\ndownloadname.rar");
		zipout.setLevel(1);
		for (int i = 0; i < v.size(); i++) {
			File f = (File) v.get(i);
			if (f.canRead()) {
				zipout.putNextEntry(new ZipEntry(f.getAbsolutePath().substring(
						dir_l + 1)));
				BufferedInputStream fr = new BufferedInputStream(
						new FileInputStream(f));
				int b;
				while ((b = fr.read()) != -1)
					zipout.write(b);
				fr.close();
				zipout.closeEntry();
			}
		}
		zipout.finish();
		out.flush();
	}

	/**
	 * Writer 转化为流
	 * 
	 * @author Administrator
	 * 
	 */
	private class Writer2Stream extends OutputStream {
		private Writer out;

		public Writer2Stream(Writer w) {
			super();
			out = w;
		}

		public void write(int i) throws IOException {
			out.write(i);
		}

		public void write(byte[] b) throws IOException {
			for (int j = 0; j < b.length; j++) {
				int n = b[j];
				// Convert byte to ubyte
				n = ((n >>> 4) & 0xF) * 16 + (n & 0xF);
				out.write(n);
			}
		}

		public void write(byte[] b, int off, int len) throws IOException {
			for (int j = off; j < off + len; j++) {
				int n = b[j];
				n = ((n >>> 4) & 0xF) * 16 + (n & 0xF);
				out.write(n);
			}
		}
	}
}
