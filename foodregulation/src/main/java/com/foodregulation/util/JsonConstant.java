package com.foodregulation.util;

import org.json.JSONObject;

public class JsonConstant {
    //public static final JSONObject REVIEWSTATUS =  new JSONObject("{\"0\":\"未核准\",\"1\":\"核准中\",\"2\":\"已核准\"}");//审核状态
    public static String paramJson(String paramIn) {
        for (int i = 0; i < paramIn.length(); i++) {
            if (paramIn.charAt(i) == '=') {
                paramIn = paramIn.replaceAll("=", "\":\"");
            }
            if (paramIn.charAt(i) == '&') {
                paramIn = paramIn.replaceAll("&", "\",\"");
            }
        }
        String output = "{\"" + paramIn + "\"}";
        return output;
    }
}
