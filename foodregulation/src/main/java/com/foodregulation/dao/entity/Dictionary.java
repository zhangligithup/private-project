package com.foodregulation.dao.entity;

public class Dictionary {

    private Integer id;

    /**
     * 字典code
     */
    private String tDictionaryCode;

    /**
     * 字典名称
     */
    private String tDictionaryName;

    /**
     * 字典类型
     */
    private Integer tDictionaryType;

    private Integer tDictionaryTime;

    private Integer tDictionaryTimeUnit;

    private Integer tDictionaryNum;


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String gettDictionaryCode() {
        return tDictionaryCode;
    }


    public void settDictionaryCode(String tDictionaryCode) {
        this.tDictionaryCode = tDictionaryCode;
    }


    public String gettDictionaryName() {
        return tDictionaryName;
    }


    public void settDictionaryName(String tDictionaryName) {
        this.tDictionaryName = tDictionaryName;
    }



    public Integer gettDictionaryType() {
        return tDictionaryType;
    }



    public void settDictionaryType(Integer tDictionaryType) {
        this.tDictionaryType = tDictionaryType;
    }



    public Integer gettDictionaryTime() {
        return tDictionaryTime;
    }



    public void settDictionaryTime(Integer tDictionaryTime) {
        this.tDictionaryTime = tDictionaryTime;
    }



    public Integer gettDictionaryTimeUnit() {
        return tDictionaryTimeUnit;
    }



    public void settDictionaryTimeUnit(Integer tDictionaryTimeUnit) {
        this.tDictionaryTimeUnit = tDictionaryTimeUnit;
    }



    public Integer gettDictionaryNum() {
        return tDictionaryNum;
    }



    public void settDictionaryNum(Integer tDictionaryNum) {
        this.tDictionaryNum = tDictionaryNum;
    }




}
