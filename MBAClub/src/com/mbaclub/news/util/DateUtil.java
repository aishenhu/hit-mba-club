package com.mbaclub.news.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	private final static SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");
	private final static SimpleDateFormat datetimeFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	/**
	 * 得到日期的格式
	 * 
	 * @param date
	 * @return
	 */
	public static String getDate(Date date) {
		return dateFormat.format(date);
	}

	/**
	 * 得到日期的格式
	 * 
	 * @param date
	 * @return
	 */
	public static String getDate(Timestamp timestamp) {
		return dateFormat.format(timestamp);
	}

	/**
	 * 得到日期和时间的格式
	 * 
	 * @param date
	 * @return
	 */
	public static String getDatetime(Date date) {
		return datetimeFormat.format(date);
	}

	/**
	 * 得到日期和时间的格式
	 * 
	 * @param date
	 * @return
	 */
	public static String getDatetime(Timestamp timestamp) {
		return datetimeFormat.format(timestamp);
	}

}
