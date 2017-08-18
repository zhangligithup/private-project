package com.foodregulation.page;

import java.io.Serializable;
import java.util.List;


public class PageResultVo<T> implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 3965394517021433376L;

    private Integer errorCode;

    private String msg;

    private List<T> result;

    private Integer count;


    public Integer getErrorCode() {
        return errorCode;
    }


    public void setErrorCode(Integer errorCode) {
        this.errorCode = errorCode;
    }


    public String getMsg() {
        return msg;
    }


    public void setMsg(String msg) {
        this.msg = msg;
    }




    public List<T> getResult() {
        return result;
    }



    public void setResult(List<T> result) {
        this.result = result;
    }


    public Integer getCount() {
        return count;
    }


    public void setCount(Integer count) {
        this.count = count;
    }

}
