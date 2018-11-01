package com.foodregulation.serviceImpl.samplingInspection;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.SamplingTask;
import com.foodregulation.dao.mapper.SamplingTaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.SamplingInspection;
import com.foodregulation.dao.mapper.SamplingInspectionMapper;
import com.foodregulation.service.samplingInspection.SamplingInspectionService;

@Service
public class SamplingInspectionServiceImpl implements SamplingInspectionService {

    @Autowired
    SamplingInspectionMapper samplingInspectionMapper;

    @Autowired
    SamplingTaskMapper samplingTaskMapper;


    @Override
    public Integer getSamplingInspectionListCount(SamplingInspection samplingInspection) {
        return samplingInspectionMapper.getSamplingInspectionListCount(samplingInspection);
    }


    @Override
    public List<SamplingInspection> getSamplingInspectionList(SamplingInspection samplingInspection, Integer pageIndex, Integer pageSize) {
        return samplingInspectionMapper.getSamplingInspectionList(samplingInspection, pageIndex, pageSize);
    }


    @Override
    public Integer deleteSamplingInspectionById(Long samplingInspectionId) {
        return samplingInspectionMapper.deleteByPrimaryKey(samplingInspectionId);
    }

    /**
     * 新增抽样检查
     *
     * @param samplingInspection
     * @return
     */
    @Override
    public Integer addSamplingInspection(SamplingInspection samplingInspection) {
        return samplingInspectionMapper.insert(samplingInspection);
    }

    /**
     * 根据ID查询抽样检查
     *
     * @param id
     * @return
     */
    @Override
    public SamplingInspection getSamplingInspectionById(Long id) {
        return samplingInspectionMapper.selectByPrimaryKey(id);
    }

    /**
     * 修改抽样检查
     *
     * @param samplingInspection
     * @return
     */
    @Override
    public Integer updateSamplingInspection(SamplingInspection samplingInspection) {
        return samplingInspectionMapper.updateByPrimaryKeySelective(samplingInspection);
    }

    /**
     * 抽样检查任务列表
     *
     * @param map
     * @return
     */
    @Override
    public  List<Map<String,Object>> findSampTaskList(Map<String, Object> map) {
        return samplingTaskMapper.findSampTaskList(map);
    }


    /**
     * 抽样检查任务数量
     *
     * @param map
     * @return
     */
    @Override
    public long findSampTaskListTotal(Map<String, Object> map) {
        return samplingTaskMapper.findSampTaskListTotal(map);
    }


    /**
     * 新增抽样检查任务
     *
     * @param samplingTask
     * @return
     */
    @Override
    public int addSampTaskList(List<SamplingTask> samplingTask) {
        return samplingTaskMapper.insertList(samplingTask);
    }

    /**
     * 删除抽样检查任务
     *
     * @param id
     * @return
     */
    @Override
    public int delSampTask(long id) {
        return samplingTaskMapper.deleteByPrimaryKey(id);
    }
}
