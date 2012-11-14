package com.mbaclub.news.util;

import java.util.List;

/**
 * @author ppy 2008-10-18 14:3:56 totalRecords 总记录数 list 保存分页的数据 pageNo 当前页
 *         pageSize 页大小 query 保存用户查询的字符串 pageAction 操作分页的Servlet或Action(struts)
 *         method (struts中Action对应的method)
 */
public class PageBean {
	private int totalRecords;
	private List list;
	private int pageNo;
	private int pageSize;
	private String query;
	private String pageAction;
	private String method;

	public void setPageAction(String pageAction) {
		this.pageAction = pageAction;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	/**
	 * 取得总页数的方法 return
	 * totalRecords%pageSize==0?(totalRecords/pageSize):(totalRecords
	 * /pageSize+1)
	 * 
	 * @return
	 */
	public int getTotalPages() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	/**
	 * 得到首页
	 * 
	 * @return
	 */
	public int getTopPage() {
		return 1;
	}

	/**
	 * 得到上一页
	 * 
	 * @return
	 */
	public int getPreviousPageNo() {
		if (pageNo <= 1)
			return 1;
		else
			return (pageNo - 1);
	}

	/**
	 * 得到下一页
	 * 
	 * @return
	 */
	public int getNextPageNo() {
		if (pageNo >= getTotalPages()) {
			return getTotalPages() == 0 ? 1 : getTotalPages();
		} else {
			return pageNo + 1;
		}
	}

	/**
	 * 得到尾页
	 * 
	 * @return
	 */
	public int getBottomPageNo() {
		return getTotalRecords() == 0 ? 1 : getTotalPages();
	}

	/**
	 * 页面分页导航的链接 方式一
	 * 
	 * @return
	 */
	public String getPageToolBar1() {
		String str = "";
		str += "<li class=\"fl\"><a class=\"button\" href='" + pageAction
				+ "?method=" + method + "&userQuery=" + query + "&pageNo="
				+ getPreviousPageNo() + "&pageSize=" + pageSize
				+ "'>上一页</a></li>";
		str += "<li class=\"fl\"><a class=\"button\" href='" + pageAction
				+ "?method=" + method + "&userQuery=" + query + "&pageNo="
				+ getNextPageNo() + "&pageSize=" + pageSize + "'>下一页</a></li>";
		return str;
	}

	/**
	 * 是否是首页
	 * 
	 * @return
	 */
	public boolean isTopPage() {
		return pageNo == getTopPage();
	}

	/**
	 * 是否是尾页
	 * 
	 * @return
	 */
	public boolean isBottoomPage() {
		return pageNo == getBottomPageNo();
	}

	/**
	 * 得到首页
	 * 
	 * @return
	 */
	public String getTopPageBar() {
		String str = "<li class=\"fl\"><a class=\"button\" href='" + pageAction
				+ "?method=" + method + "&userQuery=" + query + "&pageNo="
				+ getTopPage() + "&pageSize=" + pageSize + "'>首页</a></li>";
		return str;
	}

	/**
	 * 得到尾页
	 * 
	 * @return
	 */
	public String getBottomPageBar() {
		String str = "<li class=\"fl\"><a class=\"button\" href='" + pageAction
				+ "?method=" + method + "&userQuery=" + query + "&pageNo="
				+ getBottomPageNo() + "&pageSize=" + pageSize + "'>尾页</a></li>";
		return str;
	}

	// 页面分页导航的链接 方式二
	public String getPageToolBar2() {
		String str = "";
		int pageSplit = (pageNo / 5) * 5;
		for (int i = pageSplit - 1; i < (pageSplit + 6); i++) {
			if (i <= 0) {
			} else if (pageNo == i) {
				str += i + " ";
			} else if (i > getTotalPages()) {
			} else {
				str += "<a href='" + pageAction + "?method=" + method
						+ "&userQuery=" + query + "&pageNo=" + i + "&pageSize="
						+ pageSize + "'>" + i + "</a>" + " ";
			}
		}
		return str;
	}
}
