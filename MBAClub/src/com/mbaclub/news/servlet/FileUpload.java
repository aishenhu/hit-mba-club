package com.mbaclub.news.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.mbaclub.news.util.FileUtil;

/**
 * 文件上传
 * 
 * @author Administrator
 * 
 */
public class FileUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FileUpload() {
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
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String basePath = request.getContextPath()
				+ "/";
		int type = 3;// Integer.parseInt(request.getParameter("type") + "");
		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();

		// 上传初始化
		su.initialize(getServletConfig(), request, response);

		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
		su.setMaxFileSize(10000000);

		// 2.限制总上传数据的长度。
		su.setTotalMaxFileSize(20000000);

		// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		su.setAllowedFilesList("doc,txt,jpg,jpeg,png,bmp,rar,mid,waw,mp3,gif");

		boolean sign = false;
		String path = getServletContext().getRealPath("/")
				+ getFolderName(type);
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		String newFileName = "";
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
		try {
			su.setDeniedFilesList("exe,bat,jsp,htm,html");
			// 上传文件
			su.upload();

			for (int i = 0; i < su.getFiles().getCount(); i++) {
				com.jspsmart.upload.File f = su.getFiles().getFile(i);
				// 将上传文件保存到指定目录
				newFileName = FileUtil.getTimestampFilename() + "."
						+ f.getFileExt();
				System.out.println(path + "\\" + newFileName);
				f.saveAs(path + "\\" + newFileName, SmartUpload.SAVE_PHYSICAL);
				sign = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			sign = false;
		}
		if (sign == true) {
			out.println("<script>parent.callbackThumb('上传成功!', '../" + getFolderName(type) + "/" + newFileName + "');</script>");
			System.out.println("<script>parent.callbackThumb('上传成功!', '../"
					+ getFolderName(type) + "/" + newFileName + "');</script>");
		} else {
			out.println("<script>parent.callbackThumb('上传失败!','');</script>");
			System.out.println("上传失败");
		}
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
	 * 根据类型得到文件夹的名称
	 * 
	 * @param type
	 * @return
	 */
	private String getFolderName(int type) {
		switch (type) {
		case 3:
			return "company";
		case 5:
			return "member";
		default:
			return "assets";
		}
	}
}
