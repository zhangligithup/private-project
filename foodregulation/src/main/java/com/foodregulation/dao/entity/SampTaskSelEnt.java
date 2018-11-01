package com.foodregulation.dao.entity;

import java.io.Serializable;

/**
 * Created by JamesBond on 2017/1/1.
 */
public class SampTaskSelEnt  implements Serializable {
    private Integer enterpriseId;
    private String batch;
    private String enterpriseType;

    public Integer getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Integer enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getEnterpriseType() {
        return enterpriseType;
    }

    public void setEnterpriseType(String enterpriseType) {
        this.enterpriseType = enterpriseType;
    }
}
