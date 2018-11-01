package com.foodregulation.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil
{
	
	public static final String FORMAT_DEFAULT = "yyyy-MM-dd HH:mm:ss";
	
	public static final String FORMAT_DEFAULT_MIN = "yyyy-MM-dd HH:mm";

	public static final String SIMPLE_FORMAT_DEFAULT = "yyyy-MM-dd";

	public static final String FORMAT_NBT_LOG = "yyyyMMddHHmmssss";

	public static Date getFormatDate(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d=null;
		try {
			d = simpleDateFormat.parse(simpleDateFormat.format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}
	
	public static String getDateToStr(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(date);	
	}

	public static String getDateToStr1(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		return simpleDateFormat.format(date);	
	}
	public static String getDateToStr2(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return simpleDateFormat.format(date);	
	}

//	public static String getFormatToStr(String str) {
//		String s=null;
//		if(ToolsUtil.isEmpty(str)){
//			return null;
//		}else{
//			try {
//				Date d=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(str);
//				 s=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			return s;
//			 
//		}
//	}
	
	public static String getMonthOneDayTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		 //获取前月的第一天
       Calendar   cal_1=Calendar.getInstance();//获取当前日期
       cal_1.add(Calendar.MONTH, 0);
       cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
      return format.format(cal_1.getTime()) + " 00:00:00";
	}

	public static java.util.Date stringToDate(String strDate, String pattern) {
		if (strDate == null || strDate.trim().length() <= 0)
			return null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.parse(strDate);
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static String dateToString(java.util.Date date, String pattern) {
		if (date == null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	public static Date dateAddMinutes(Date date, int minutes) {
		if (date == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, minutes);
		return cal.getTime();
	}

	public static Date dateAddHours(Date date, int hours) {
		if (date == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, hours);
		return cal.getTime();
	}

	public static Date dateAddDays(Date date, int addDays) {
		if (date == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, addDays);
		return cal.getTime();
	}

	public static Date dateAddMonths(Date date, int addMonths) {
		if (date == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, addMonths);
		return cal.getTime();
	}

	public static Date dateAddMonths(Date date, double months) {
		if (date == null)
			return null;
		int addMonths = (int) Math.ceil(months);
		int addDays = (int) Math.round((months - addMonths) * 31);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, addMonths);
		cal.add(Calendar.DATE, addDays);
		return cal.getTime();
	}

	public static Date dateAddYears(Date date, int addYears) {
		if (date == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, addYears);
		return cal.getTime();
	}

	public static boolean isDate(String strDate, String pattern) {
		if (strDate == null || strDate.trim().length() <= 0)
			return false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			sdf.parse(strDate);
			return true;
		} catch (ParseException e) {
			return false;
		}
	}

	public static int getIntervalOfDay(Date d1, Date d2) {
		int elapsed = 0;
		boolean isAfter = false;
		Date temp;
		if (d1.after(d2)) {
			temp = d1;
			d1 = d2;
			d2 = temp;
			isAfter = true;
		}

		while (d1.before(d2)) {
			d1 = dateAddDays(d1, 1);
			elapsed++;
		}
		if (isAfter)
			elapsed = 0 - elapsed;
		return elapsed;
	}

	/**
	 * Elapsed days based on current time
	 * 
	 * @param date
	 *            Date
	 * 
	 * @return int number of days
	 */
	public static int getElapsedDays(Date date) {
		return elapsed(date, Calendar.DATE);
	}

	/**
	 * Elapsed days based on two Date objects
	 * 
	 * @param d1
	 *            Date
	 * @param d2
	 *            Date
	 * 
	 * @return int number of days
	 */
	public static int getElapsedDays(Date d1, Date d2) {
		return elapsed(d1, d2, Calendar.DATE);
	}

	/**
	 * Elapsed months based on current time
	 * 
	 * @param date
	 *            Date
	 * 
	 * @return int number of months
	 */
	public static int getElapsedMonths(Date date) {
		return elapsed(date, Calendar.MONTH);
	}

	/**
	 * Elapsed months based on two Date objects
	 * 
	 * @param d1
	 *            Date
	 * @param d2
	 *            Date
	 * 
	 * @return int number of months
	 */
	public static int getElapsedMonths(Date d1, Date d2) {
		return elapsed(d1, d2, Calendar.MONTH);
	}

	/**
	 * Elapsed years based on current time
	 * 
	 * @param date
	 *            Date
	 * 
	 * @return int number of years
	 */
	public static int getElapsedYears(Date date) {
		return elapsed(date, Calendar.YEAR);
	}

	/**
	 * Elapsed years based on two Date objects
	 * 
	 * @param d1
	 *            Date
	 * @param d2
	 *            Date
	 * 
	 * @return int number of years
	 */
	public static int getElapsedYears(Date d1, Date d2) {
		return elapsed(d1, d2, Calendar.YEAR);
	}

	/**
	 * All elaspsed types
	 * 
	 * @param g1
	 *            GregorianCalendar
	 * @param g2
	 *            GregorianCalendar
	 * @param type
	 *            int (Calendar.FIELD_NAME)
	 * 
	 * @return int number of elapsed "type"
	 */
	private static int elapsed(GregorianCalendar g1, GregorianCalendar g2,
			int type) {
		GregorianCalendar gc1, gc2;
		int elapsed = 0;
		// Create copies since we will be clearing/adding
		if (g2.after(g1)) {
			gc2 = (GregorianCalendar) g2.clone();
			gc1 = (GregorianCalendar) g1.clone();
		} else {
			gc2 = (GregorianCalendar) g1.clone();
			gc1 = (GregorianCalendar) g2.clone();
		}
		if (type == Calendar.MONTH || type == Calendar.YEAR) {
			gc1.clear(Calendar.DATE);
			gc2.clear(Calendar.DATE);
		}
		if (type == Calendar.YEAR) {
			gc1.clear(Calendar.MONTH);
			gc2.clear(Calendar.MONTH);
		}
		while (gc1.before(gc2)) {
			gc1.add(type, 1);
			elapsed++;
		}
		return elapsed;
	}

	/**
	 * All elaspsed types based on date and current Date
	 * 
	 * @param date
	 *            Date
	 * @param type
	 *            int (Calendar.FIELD_NAME)
	 * 
	 * @return int number of elapsed "type"
	 */
	private static int elapsed(Date date, int type) {
		return elapsed(date, new Date(), type);
	}

	/**
	 * All elaspsed types
	 * 
	 * @param d1
	 *            Date
	 * @param d2
	 *            Date
	 * @param type
	 *            int (Calendar.FIELD_NAME)
	 * 
	 * @return int number of elapsed "type"
	 */
	private static int elapsed(Date d1, Date d2, int type) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(d1);
		GregorianCalendar g1 = new GregorianCalendar(cal.get(Calendar.YEAR),
				cal.get(Calendar.MONTH), cal.get(Calendar.DATE));
		cal.setTime(d2);
		GregorianCalendar g2 = new GregorianCalendar(cal.get(Calendar.YEAR),
				cal.get(Calendar.MONTH), cal.get(Calendar.DATE));
		return elapsed(g1, g2, type);
	}

	public static int getDaysOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return getMonthDateCount(cal);
	}

	public static Date getFormatDate() {
		Date now = new Date();
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = bartDateFormat.format(now);
		try {
			now = bartDateFormat.parse(strDate);
		} catch (ParseException e) {
			// //e.printStackTrace();
		}
		return now;
	}

	/**
	 * 閿熺煫纰夋嫹鎸囬敓鏂ゆ嫹閿熼摪浠界鎷烽敓鏂ゆ嫹閿熸枻鎷�
	 * 
	 * @param cal
	 * @return
	 */
	protected static int getMonthDateCount(Calendar cal) {
		Calendar cal2 = (Calendar) cal.clone();
		cal2.add(Calendar.MONTH, 1);
		cal2.set(Calendar.DAY_OF_MONTH, 1);
		cal2.add(Calendar.DAY_OF_MONTH, -1);
		return cal2.get(Calendar.DAY_OF_MONTH);
	}

	public Date getRandomDate(String beginDate, String endDate) {
		try {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date start = format.parse(beginDate);
			Date end = format.parse(endDate);
			if (start.getTime() >= end.getTime()) {
				return null;
			}
			long date = random(start.getTime(), end.getTime());
			return new Date(date);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return null;
	}

	/**
	 * 返回指定日期是一年中的第几周，第一周的编号为1，以周一作为每周的第一天。
	 * 
	 * @param source
	 * @return
	 * @see #getWeekOfYear(Date)
	 * @throws ParseException
	 */
	public static int getWeekOfYear(String source) {
		Date d = stringToDate(source);
		if (null==d) {
			return -1;
		}
		return getWeekOfYear(d);
	}
	/**
	 * 返回指定日期是一年中的第几周，第一周的编号为1，以周一作为每周的第一天。
	 * 
	 * @param source
	 * @return
	 * @see Calendar
	 * @throws ParseException
	 */
	public static int getWeekOfYear(Date d) {
		Calendar calendar = Calendar.getInstance();
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.setMinimalDaysInFirstWeek(4);
		calendar.setTime(d);
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}

	/**
	 * 将字符串表示的日期、时间串转换为{@link java.util.Date}。
	 * <p>
	 * 支持的格式见：{@link FORMAT_DEFAULT}、 {@link SIMPLE_FORMAT_DEFAULT}、
	 * {@link FORMAT_NBT_LOG};
	 * </p>
	 * 
	 * @param source
	 * @return 
	 */
	public static Date stringToDate(String source) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_DEFAULT);
		Date d = null;
		try {
			d = sdf.parse(source);
		} catch (ParseException e) {
			sdf = new SimpleDateFormat(FORMAT_DEFAULT_MIN);
			try {
				d = sdf.parse(source);
			} catch (ParseException e1) {
				sdf = new SimpleDateFormat(SIMPLE_FORMAT_DEFAULT);
				try {
					d = sdf.parse(source);
				} catch (ParseException e2) {
					e2.printStackTrace(System.out);
				}
			}
		}
		return d;
	}

	private static long random(long begin, long end) {
		long rtn = begin + (long) (Math.random() * (end - begin));
		if (rtn == begin || rtn == end) {
			return random(begin, end);
		}
		return rtn;
	}

    /**
     * 获取给定某天所在的周中的周几对应的日期
     * @param date  给定日期
     * @param calendarDayValue Calendar.MONDAY -->> Calendar.SUNDAY 周一到周日
     * @return      日期
     * @throws Exception
     */
    public static Date getDayInWeekByDay(Date date,int calendarDayValue){
        Calendar c = Calendar.getInstance();
        c.setFirstDayOfWeek(Calendar.MONDAY);
        c.setTime(date);
        c.set(Calendar.DAY_OF_WEEK,calendarDayValue);
        Date d = c.getTime();
        return d;
    }
}