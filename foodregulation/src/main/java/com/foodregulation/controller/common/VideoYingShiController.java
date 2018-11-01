package com.foodregulation.controller.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.foodregulation.util.HttpClientUtil;
import com.foodregulation.util.StringUtils;

@Controller
@RequestMapping("video")
public class VideoYingShiController {
	private static final String appKey = "5fc7ecfa0a564c4c8e037ddc2b52c3d2";
	private static final String appSecret = "ab742738a78d08819c33455d0e928d19";
	private static String accessToken = "";
	private // 拼接返回字符串数组
	List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
	// 具体过期时间
	private static long expireTime = System.currentTimeMillis();

	private String[] name0 = { "第一幼儿园", "第二幼儿园", "第三幼儿园", "临港幼儿园", "一场幼儿园", "三场幼儿园", "四场幼儿园", "五场幼儿园", "六场幼儿园", "七场幼儿园",
			"八场幼儿园", "九场幼儿园", "十场幼儿园", "柳赞中心幼儿园", "柳赞小精灵幼儿园", "幸福花园幼儿园", "冀东西区幼儿园", "石油馨苑幼儿园", "渤海家园幼儿园", "北大培文幼儿园",
			"碧海云天幼儿园", "铂瑞幼儿园", "大拇指幼儿园", "格林幼儿园", "金色摇篮幼儿园", "金娃幼儿园", "童之梦幼儿园", "蒙氏双语幼儿园", "11场幼儿园", "八场中心幼儿园" };
	private String[] name1 = { "新立小学", "南堡二小", "南堡三小" };
	private String[] name2 = { "景山学校", "职教中心", "八场中学", "柳赞中小学", "南堡实验中学", "第三中学", "曹妃甸区第一中学" };
	private String[] name3 = { "华北理工大学", "唐山工业职业技术学院", "曹妃甸区实验中专", "实验中专" };
	private String[] name4 = { "曹妃岛酒店" };
	private String[] name8 = { "民政服务中心" };

	public static String getYingShiToken() {
		// 检查是否过期
		if (StringUtils.isBlank(accessToken) || System.currentTimeMillis() >= expireTime) {
			// 获取accessToken
			Map<String, String> map = new HashMap<String, String>();
			map.put("appKey", appKey);
			map.put("appSecret", appSecret);
			String result = HttpClientUtil.doPost("https://open.ys7.com/api/lapp/token/get", map, "utf-8", null);
			JSONObject jsonObject = JSONObject.parseObject(result);
			accessToken = jsonObject.getJSONObject("data").getString("accessToken");
			expireTime = jsonObject.getJSONObject("data").getLongValue("expireTime");
		}
		return accessToken;
	}

	@RequestMapping("video")
	public String video() {
		return "video/menus";
	}

	@RequestMapping("getVidelList")
	@ResponseBody
	public Map<String, List<Map<String, String>>> getVidelList(String tag, String likeName) {
		String[] arry = null;
		switch (tag) {
		case "0":
			arry = name0;
			break;
		case "1":
			arry = name1;
			break;
		case "2":
			arry = name2;
			break;
		case "3":
			arry = name3;
			break;
		case "4":
			arry = name4;
			break;
		case "8":
			arry = name8;
			break;
		}
		SortedMap<String, List<Map<String, String>>> result = new TreeMap<String, List<Map<String, String>>>();
		if (resultList.size() == 0) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("accessToken", getYingShiToken());
			// 循环获取设备列表
			int pageStart = 0;
			int pageSize = 50;
			Map<String, String> nameMap = new HashMap<String, String>();
			while (true) {
				map.put("pageStart", pageStart + "");
				map.put("pageSize", pageSize + "");
				pageStart++;
				String resultStr = HttpClientUtil.doPost("https://open.ys7.com/api/lapp/device/list", map, "utf-8",
						null);
				JSONObject jsonObject = JSONObject.parseObject(resultStr);
				JSONArray jsonArray = jsonObject.getJSONArray("data");
				if (jsonArray != null && jsonArray.size() > 0) {
					for (int i = 0; i < jsonArray.size(); i++) {
						JSONObject temp = jsonArray.getJSONObject(i);
						String deviceName = temp.getString("deviceName");
						nameMap.put(temp.getString("deviceSerial"), deviceName);
					}
				}
				if (jsonArray == null || jsonArray.size() < 50) {
					break;
				}
			}

			// 获取直播列表
			pageStart = 0;
			Map<String, String> urlMap = new HashMap<String, String>();
			while (true) {
				map.put("pageStart", pageStart + "");
				map.put("pageSize", pageSize + "");
				pageStart++;
				String resultStr = HttpClientUtil.doPost("https://open.ys7.com/api/lapp/live/video/list", map, "utf-8",
						null);
				JSONObject jsonObject = JSONObject.parseObject(resultStr);
				JSONArray jsonArray = jsonObject.getJSONArray("data");
				if (jsonArray != null && jsonArray.size() > 0) {
					for (int i = 0; i < jsonArray.size(); i++) {
						JSONObject temp = jsonArray.getJSONObject(i);
						urlMap.put(temp.getString("deviceSerial"),
								temp.getString("liveAddress") + "," + temp.getString("rtmp"));
					}
				}
				if (jsonArray == null || jsonArray.size() < 50) {
					break;
				}
			}

			// 拼接设备名称及直播地址
			SortedMap<String, String> sortedMap = new TreeMap<String, String>();
			if (nameMap.size() > 0) {
				Set<String> keySet = nameMap.keySet();
				for (String key : keySet) {
					// 检查直播列表是否有此设备
					if (urlMap.get(key) != null) {
						sortedMap.put(nameMap.get(key), urlMap.get(key));
					}
				}
			}

			if (sortedMap.size() > 0) {
				Set<String> keySet = sortedMap.keySet();
				for (String key : keySet) {
					Map<String, String> tempMap = new HashMap<String, String>();
					tempMap.put("name", key);
					tempMap.put("liveAddress", sortedMap.get(key).split(",")[0]);
					tempMap.put("rtmp", sortedMap.get(key).split(",")[1]);
					resultList.add(tempMap);
				}
			}
		}
		for (String temp : arry) {
			if (StringUtils.isNotBlank(likeName)) {
				if (temp.indexOf(likeName) > -1) {
					List<Map<String, String>> tempList = new ArrayList<Map<String, String>>();
					for (Map<String, String> tempMap : resultList) {
						if (tempMap.get("name").indexOf(temp) == 0) {
							tempList.add(tempMap);
						}
					}
					result.put(temp, tempList);
				}
			} else {
				List<Map<String, String>> tempList = new ArrayList<Map<String, String>>();
				for (Map<String, String> tempMap : resultList) {
					if (tempMap.get("name").indexOf(temp) == 0) {
						tempList.add(tempMap);
					}
				}
				result.put(temp, tempList);
			}
		}
		return result;
	}

	@RequestMapping("videoShow")
	public String videoShow(HttpServletRequest request) {
		String tag = request.getParameter("tag");
		request.setAttribute("tag", tag);
		String url = "";
		switch (tag) {
		case "0":
			url = "video/h5";
			break;
		case "1":
			url = "video/h5";
			break;
		case "2":
			url = "video/h5";
			break;
		case "3":
			url = "video/h5";
			break;
		case "4":
			url = "video/h5";
			break;
		case "8":
			url = "video/h5";
			break;
		case "5":
			url = "video/introduce";
			break;
		case "6":
			url = "video/system";
			break;
		case "7":
			url = "video/complain";
			break;
		}
		return url;
	}
}
