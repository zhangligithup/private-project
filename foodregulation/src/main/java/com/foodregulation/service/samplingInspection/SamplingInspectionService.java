package com.foodregulation.service.samplingInspection;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.SamplingInspection;
import com.foodregulation.dao.entity.SamplingTask;


public interface SamplingInspectionService {

    /**
    * @Title: getSamplingInspectionListCount
    * @author dengxiaolong
    * @Description: 获取抽样检查数量
    * @date 2016年11月13日 下午7:41:33
    */
    public Integer getSamplingInspectionListCount(SamplingInspection samplingInspection);


    /**
    * @Title: getSamplingInspectionList
    * @author dengxiaolong
    * @Description: 获取抽样检查列表
    * @date 2016年11月13日 下午7:41:41
    */
    public List<SamplingInspection> getSamplingInspectionList(SamplingInspection samplingInspection, Integer pageIndex, Integer pageSize);


    /**
    * @Title: deleteSamplingInspectionById
    * @author dengxiaolong
    * @Description: 根据ID删除抽样检查
    * @date 2016年11月13日 下午7:43:39
    */
    public Integer deleteSamplingInspectionById(Long samplingInspectionId);

    /**
     * 新增抽样检查
     * @param samplingInspection
     * @return
             */
    public Integer addSamplingInspection(SamplingInspection samplingInspection);

    /**
     * 根据ID查询抽样检查
     * @param id
     * @return
     */
    public SamplingInspection getSamplingInspectionById(Long id);

    /**
     * 修改抽样检查
     * @param samplingInspection
     * @return
     */
    public Integer updateSamplingInspection(SamplingInspection samplingInspection);


    /**
     * 抽样检查任务列表
     * @param map
     * @return
     */
    List<Map<String,Object>> findSampTaskList(Map<String,Object> map);

    /**
     * 抽样检查任务数量
     * @param map
     * @return
     */
    long findSampTaskListTotal(Map<String,Object> map);


    /**
     * 新增抽样检查任务
     * @param samplingTask
     * @return
     */
    public int addSampTaskList(List<SamplingTask> samplingTask);

    /**
     * 删除抽样检查任务
     * @param id
     * @return
     */
    public int delSampTask(long id);

}
