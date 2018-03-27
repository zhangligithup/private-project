package com.foodregulation.util;

/**
 * Created by JamesBond on 2016/11/15.
 */
public enum SamplingType {



    SHIPINCHOUYANG(1,"食品安全抽样检验抽样单"),
    YAOPINANQUANCHOUYANG(2,"药品安全抽样检验单"),
    HUAZHUANGPINCHOUYANG(3,"化妆品安全抽样单"),
    YILIAOQIXIECHOUYANG(4,"医疗器械安全抽样单"),
    BAOJIANSHIPINCHOUYABF(5,"保健食品安全抽样单");

    private int type;
    private String name;

    private SamplingType(int type,String name){
        this.type=type;
        this.name=name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static String getName(int type) {
        for (SamplingType c : SamplingType .values()) {
            if (c.getType() == type) {
                return c.name;
            }
        }
        return null;
    }

    public static Integer getSamplingType(String entType){
        if(StringUtils.isBlank(entType)){
            return 1;
        }
        if("enterprise_1".equalsIgnoreCase(entType)||
                "enterprise_2".equalsIgnoreCase(entType)||
                "enterprise_3".equalsIgnoreCase(entType)||
                "enterprise_4".equalsIgnoreCase(entType)||
                "enterprise_6".equalsIgnoreCase(entType)){
            return 1;
        }

        if("enterprise_9".equalsIgnoreCase(entType)){
            return 2;
        }
        if("enterprise_8".equalsIgnoreCase(entType)){
            return 3;
        }
        if("enterprise_10".equalsIgnoreCase(entType)||
                "enterprise_11".equalsIgnoreCase(entType)){
            return 4;
        }
        if("enterprise_7".equalsIgnoreCase(entType)){
            return 5;
        }
        return 1;
    }
}
