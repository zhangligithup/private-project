package com.foodregulation.service.Dictionary;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.Dictionary;


public interface DictionaryService {

    /**
    * @Title: getDictionaryByType
    * @author dengxiaolong
    * @Description: 根据类型获取字典信息
    * @date 2016年11月13日 下午5:35:24
    */
    public List<Dictionary> getDictionaryByType(Integer type);


    Dictionary getDictionaryByCode(String tDictionaryCode);


    public List<Dictionary> getDictionaryList(Integer pageIndex, Integer pageSize, Integer type);


    public Long getDictionaryListCount(Integer type);


    public Integer deleteDictionary(Integer id);


    public Integer updateDictionary(Dictionary dictionary);


    public Integer saveDictionary(Dictionary dictionary);
    
    Dictionary selectByPrimaryKey(Integer id);
    
    int selectEnterpriseTypeIdByEnterpriseUserId(Integer personId);
}
