package com.foodregulation.util;



import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ResultUtil {
	
	     
     public static JSONObject jsonObject(String result, String msg, String name, Object data) {
    	 
    	JSONObject json = new JSONObject();
    	json.put("result", result);
		json.put("msg", msg);
		json.put(name, data);
		return json;
     }
     public static JSONObject jsonObject(String result, String msg) {
    	 
    	 JSONObject json = new JSONObject();
    	 json.put("result", result);
    	 json.put("msg", msg);
    	 return json;
     }
     
     public static JSONObject appJsonObject(boolean result, String msg, String name, Object data) {
    	 
     	JSONObject json = new JSONObject();
     	json.put("result", result);
 		json.put("msg", msg);
 		json.put(name, data);
 		return json;
      }
      public static JSONObject appJsonObject(boolean result, String msg) {
     	 
     	 JSONObject json = new JSONObject();
     	 json.put("result", result);
     	 json.put("msg", msg);
     	 return json;
      }
     
     /**
		* <p>
		* 	使用此方法必须满足以下几点：
		*   1、第一个参数必须传view跳转的路径
		*   2、其余的参数必须一一对应，一个key，一个view   也就是说str.length必须是双数
		*   3、因为用到for循环，查询大量数据时最好不要用。
		* </p>
		* @return ModelAndView 
		* @throws
		 */
		public static ModelAndView view(Object...str){
			ModelAndView view = null;
			for (int i = 0; i < str.length; i++) {
				if (i == 0) {
					view = new ModelAndView(String.valueOf(str[0]));
				}else{
					view.addObject(String.valueOf(str[i]), str[i+1]);
					if ((i+1) < str.length) {
						i++;
					}else{
						break;
					}
				}
			}
			return view;
		} 
		public static ModelAndView redirectView(String str){
			return new ModelAndView("redirect:/"+str);
		} 
}