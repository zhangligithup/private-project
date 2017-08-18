package com.foodregulation.service.physical;

import com.foodregulation.dao.entity.EnterpriseUser;
import com.foodregulation.dao.entity.Physical;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * @Description 从业人员体检
 * @Author yangchao
 * @Date 2016/12/18.
 */
public interface PhysicalService {


    /**
     * 体检记录列表
     * @param map
     * @return
     */
    List<Physical> selectPhysical(Map<String,Object> map);

    /**
     * 体检记录数
     * @return
     */
    long selectPhysicalTotal(Map<String,Object> map);

    /**
     * 查找体检记录
     * @param id
     * @return
     */
    Physical findPhysical(Long id);

    /**
     * 新增体检记录
     * @return
     */
    public int addPhysical(Physical physical);


    /**
     * 修改体检记录
     * @param physical
     * @return
     */
    public int updatePhysical(Physical physical);


    /**
     * 删除体检记录
     * @param id
     * @return
     */
    public int delPhysical(Long id);
    
    
    EnterpriseUser selectEnterpriseUserByUsername(String userName);
    
    int addEnterpriseUser(EnterpriseUser enterpriseUser);
    
    EnterpriseUser selectEnterpriseUserById(int id);
}
