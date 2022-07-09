package com.fygo.util;

import java.util.Date;

public class DateConverterHelper {
	public static java.sql.Date mapUtilDateToSqlDate(Date date) {
		return new java.sql.Date(date.getTime());
	}
}