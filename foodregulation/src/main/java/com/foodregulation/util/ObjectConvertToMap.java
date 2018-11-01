package com.foodregulation.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class ObjectConvertToMap {

	public static Map<String,String> getMapFromObject(Object o) throws IllegalArgumentException, IllegalAccessException{
		Class<? extends Object> clazz = o.getClass();
		//获取属性列表
		Field[] fields = clazz.getDeclaredFields();
		Map<String,String> map = new HashMap<String,String>();
		for(Field field:fields){
			String fieldName = field.getName();
			Object fieldValue = field.get(o); 
			map.put(fieldName, fieldValue==null?"":fieldValue.toString());
		}
		return map;
	}
	
}
