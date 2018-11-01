package com.foodregulation.util;



import javax.servlet.http.HttpServletRequest;


public class StringUtils {

    // private final Logger logger = Logger.getLogger(getClass());
    /**
     * 一次性判断多个或单个对象为空。
     * @param objects
     * @return 只要有一个元素为Blank，则返回true
     */
    public static boolean isBlank(Object... objects) {
        Boolean result = false;
        for (Object object : objects) {
            if (object == null || "".equals(object.toString().trim()) || "null".equals(object.toString().trim())
                    || "[null]".equals(object.toString().trim()) || "[]".equals(object.toString().trim())) {
                result = true;
                break;
            }
        }
        return result;
    }


    /**
     * 一次性判断多个或单个对象不为空。
     * @param objects
     * @return 只要有一个元素不为Blank，则返回true
     */
    public static boolean isNotBlank(Object... objects) {
        return !isBlank(objects);
    }


    public static boolean isBlank(String... objects) {
        Object[] object = objects;
        return isBlank(object);
    }


    public static boolean isNotBlank(String... objects) {
        Object[] object = objects;
        return !isBlank(object);
    }


    public static boolean isBlank(String str) {
        Object object = str;
        return isBlank(object);
    }


    public static boolean isNotBlank(String str) {
        Object object = str;
        return !isBlank(object);
    }


    /**
     * 判断一个字符串在数组中存在几个
     * @param baseStr
     * @param strings
     * @return
     */
    public static int indexOf(String baseStr, String[] strings) {

        if (null == baseStr || baseStr.length() == 0 || null == strings)
            return 0;

        int i = 0;
        for (String string : strings) {
            boolean result = baseStr.equals(string);
            i = result ? ++i : i;
        }
        return i;
    }


    public static String trimToEmpty(Object str) {
        return (isBlank(str) ? "" : str.toString().trim());
    }


    public final static String getIpAddress(HttpServletRequest request) {
        // 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址

        String ip = request.getHeader("X-Forwarded-For");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");

            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");

            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");

            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");

            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();

            }
        } else if (ip.length() > 15) {
            String[] ips = ip.split(",");
            for (int index = 0; index < ips.length; index++) {
                String strIp = (String) ips[index];
                if (!("unknown".equalsIgnoreCase(strIp))) {
                    ip = strIp;
                    break;
                }
            }
        }
        return ip;
    }
}
