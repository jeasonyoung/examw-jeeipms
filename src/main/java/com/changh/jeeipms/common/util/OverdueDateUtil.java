package com.changh.jeeipms.common.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
/**
 * 
 * @author Administrator
 *
 */
public class OverdueDateUtil {
	public static Date getOverdueDate(int month)
	{
		GregorianCalendar c = new GregorianCalendar();
		c.add(Calendar.MONTH, month);
		Date d = c.getTime();
		c.add(Calendar.MONTH, 0-month);
		return  d;
	}
}
