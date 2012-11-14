package com.mbaclub.news.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 文件操作工具类
 * 
 * @author Administrator
 * 
 */
public class FileUtil {
	private static SimpleDateFormat f = new SimpleDateFormat(
			"yyyyMMddHHmmssSSS");

	/**
	 * 得到实践戳的文件名
	 * 
	 * @return
	 */
	public static synchronized String getTimestampFilename() {
		return f.format(new Date());
	}
}
