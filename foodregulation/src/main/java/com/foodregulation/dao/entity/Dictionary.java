package com.foodregulation.dao.entity;

import java.io.Serializable;

public class Dictionary
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private Integer id;
  private String tDictionaryCode;
  private String tDictionaryName;
  private Integer tDictionaryType;
  private Integer tDictionaryTime;
  private Integer tDictionaryTimeUnit;
  private Integer tDictionaryNum;

  public Integer getId()
  {
    return this.id;
  }

  public void setId(Integer id)
  {
    this.id = id;
  }

  public String gettDictionaryCode()
  {
    return this.tDictionaryCode;
  }

  public void settDictionaryCode(String tDictionaryCode)
  {
    this.tDictionaryCode = tDictionaryCode;
  }

  public String gettDictionaryName()
  {
    return this.tDictionaryName;
  }

  public void settDictionaryName(String tDictionaryName)
  {
    this.tDictionaryName = tDictionaryName;
  }

  public Integer gettDictionaryType()
  {
    return this.tDictionaryType;
  }

  public void settDictionaryType(Integer tDictionaryType)
  {
    this.tDictionaryType = tDictionaryType;
  }

  public Integer gettDictionaryTime()
  {
    return this.tDictionaryTime;
  }

  public void settDictionaryTime(Integer tDictionaryTime)
  {
    this.tDictionaryTime = tDictionaryTime;
  }

  public Integer gettDictionaryTimeUnit()
  {
    return this.tDictionaryTimeUnit;
  }

  public void settDictionaryTimeUnit(Integer tDictionaryTimeUnit)
  {
    this.tDictionaryTimeUnit = tDictionaryTimeUnit;
  }

  public Integer gettDictionaryNum()
  {
    return this.tDictionaryNum;
  }

  public void settDictionaryNum(Integer tDictionaryNum)
  {
    this.tDictionaryNum = tDictionaryNum;
  }
}