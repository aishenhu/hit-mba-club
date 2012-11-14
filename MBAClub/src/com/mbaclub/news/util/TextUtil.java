package com.mbaclub.news.util;

public class TextUtil {
	/**
	 * 过滤掉null，如果为null则显示无
	 * 
	 * @param text
	 * @return
	 */
	public static String filterNull(String text) {
		return text == null ? "无" : text;
	}
}
