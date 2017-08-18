package com.foodregulation.serviceImpl.statistics;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.EnterpriseAreaStatistics;
import com.foodregulation.dao.entity.EnterpriseTypeStatistics;
import com.foodregulation.dao.mapper.EnterpriseInfoMapper;
import com.foodregulation.dao.mapper.ReportMapper;
import com.foodregulation.dao.mapper.SamplingInspectionMapper;
import com.foodregulation.dao.mapper.SupervisionAndCheckMapper;
import com.foodregulation.service.statistics.StatisticsServcice;

@Service
public class StatisticsServciceImpl implements StatisticsServcice {

    @Autowired
    EnterpriseInfoMapper enterpriseInfoMapper;

    @Autowired
    SupervisionAndCheckMapper supervisionCheckMapper;

    @Autowired
    SamplingInspectionMapper samplingInspectionMapper;

    @Autowired
    ReportMapper reportMapper;


    public Map<String, Integer> enterpriseTypeStatistics(Date startTime, Date endTime) {
        List<Map<String, Object>> list = enterpriseInfoMapper.enterpriseTypeStatistics(startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> m = list.get(i);
                map.put(String.valueOf(m.get("enterpriseType")), Integer.valueOf(String.valueOf(m.get("count"))));
            }

        }

        return map;
    }


    @Override
    public Map<String, Integer> enterpriseAreaStatistics(Date startTime, Date endTime) {
        List<Map<String, Object>> list = enterpriseInfoMapper.enterpriseAreaStatistics(startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> m = list.get(i);
                map.put(String.valueOf(m.get("address")), Integer.valueOf(String.valueOf(m.get("count"))));
            }
        }
        return map;
    }


    @Override
    public Map<String, Integer> jdjcStatistics(Date startTime, Date endTime) {
        List<Map<String, Object>> list = supervisionCheckMapper.jdjcStatistics(startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> m = list.get(i);
                map.put(String.valueOf(m.get("enterpriseType")), Integer.valueOf(String.valueOf(m.get("count"))));
            }

        }
        return map;
    }


    @Override
    public Map<String, Integer> samplingStatistics(Date startTime, Date endTime, String result) {
        EnterpriseTypeStatistics enterpriseTypeStatistics = new EnterpriseTypeStatistics();
        List<Map<String, Object>> list = samplingInspectionMapper.samplingStatistics(startTime, endTime, result);
        Map<String, Integer> map = new HashMap<String, Integer>();
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> m = list.get(i);
                map.put(String.valueOf(m.get("enterpriseType")), Integer.valueOf(String.valueOf(m.get("count"))));
            }

        }
        return map;
    }


    @Override
    public Map<String, Integer> reportAreaStatistics(String address, String reportTypeId, Date startTime, Date endTime) {
        EnterpriseAreaStatistics enterpriseAreaStatistics = new EnterpriseAreaStatistics();
        List<Map<String, Object>> list = reportMapper.reportAreaStatistics(address, reportTypeId, startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> m = list.get(i);
                map.put(String.valueOf(m.get("address")), Integer.valueOf(String.valueOf(m.get("count"))));
            }
        }
        return map;
    }


    @Override
    public Map<String, Integer> reportTypeStatistics(String address, String reportTypeId, Date startTime, Date endTime) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<Map<String, Object>> list = reportMapper.reportTypeStatistics(address, reportTypeId, startTime, endTime);
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> m = list.get(i);
                map.put(String.valueOf(m.get("report_type_id")), Integer.valueOf(String.valueOf(m.get("count"))));
            }
        }
        map.put("report_1", map.get("47") == null ? 0 : map.get("47"));
        map.put("report_2", map.get("48") == null ? 0 : map.get("48"));
        map.put("report_3", map.get("49") == null ? 0 : map.get("49"));
        map.put("report_4", map.get("50") == null ? 0 : map.get("50"));
        map.put("report_5", map.get("51") == null ? 0 : map.get("51"));
        map.put("report_6", map.get("52") == null ? 0 : map.get("52"));
        return map;
    }


    @Override
    public Map<String, Integer> enterpriseUnitStatistics(Date startTime, Date endTime) {
        List<Map<String, Object>> list = enterpriseInfoMapper.enterpriseUnitStatistics(startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> m = list.get(i);
            map.put(String.valueOf(m.get("department")), Integer.valueOf(String.valueOf(m.get("count"))));
        }
        map.put("unit_1", map.get("unit_1") == null ? 0 : map.get("unit_1"));
        map.put("unit_2", map.get("unit_2") == null ? 0 : map.get("unit_2"));
        map.put("unit_3", map.get("unit_3") == null ? 0 : map.get("unit_3"));
        map.put("unit_4", map.get("unit_4") == null ? 0 : map.get("unit_4"));
        map.put("unit_5", map.get("unit_5") == null ? 0 : map.get("unit_5"));
        map.put("unit_6", map.get("unit_6") == null ? 0 : map.get("unit_6"));
        map.put("unit_7", map.get("unit_7") == null ? 0 : map.get("unit_7"));
        map.put("unit_8", map.get("unit_8") == null ? 0 : map.get("unit_8"));
        map.put("unit_9", map.get("unit_9") == null ? 0 : map.get("unit_9"));
        map.put("unit_10", map.get("unit_10") == null ? 0 : map.get("unit_10"));
        map.put("unit_11", map.get("unit_11") == null ? 0 : map.get("unit_11"));
        map.put("unit_12", map.get("unit_12") == null ? 0 : map.get("unit_12"));
        map.put("unit_13", map.get("unit_13") == null ? 0 : map.get("unit_13"));
        map.put("unit_14", map.get("unit_14") == null ? 0 : map.get("unit_14"));
        map.put("unit_15", map.get("unit_15") == null ? 0 : map.get("unit_15"));
        map.put("unit_16", map.get("unit_16") == null ? 0 : map.get("unit_16"));
        map.put("unit_17", map.get("unit_17") == null ? 0 : map.get("unit_17"));
        return map;
    }


    @Override
    public Map<String, Integer> jdjcUnitStatistics(String enType, Date startTime, Date endTime) {
        List<Map<String, Object>> list = supervisionCheckMapper.jdjcUnitStatistics(enType, startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> m = list.get(i);
            map.put(String.valueOf(m.get("unitCode")), Integer.valueOf(String.valueOf(m.get("count"))));
        }
        return map;
    }


    @Override
    public Map<String, Integer> samplingUnitStatistics(Date startTime, Date endTime, String result) {
        List<Map<String, Object>> list = samplingInspectionMapper.samplingUnitStatistics(startTime, endTime, result);
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> m = list.get(i);
            map.put(String.valueOf(m.get("unitCode")), Integer.valueOf(String.valueOf(m.get("count"))));
        }
        return map;
    }


    @Override
    public Map<String, Integer> reportUnitStatistics(String address, String reportTypeId, Date startTime, Date endTime) {
        List<Map<String, Object>> list = reportMapper.reportUnitStatistics(address, reportTypeId, startTime, endTime);
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> m = list.get(i);
            map.put(String.valueOf(m.get("supervisory")), Integer.valueOf(String.valueOf(m.get("count"))));
        }
        map.put("unit_1", map.get("unit_1") == null ? 0 : map.get("unit_1"));
        map.put("unit_2", map.get("unit_2") == null ? 0 : map.get("unit_2"));
        map.put("unit_3", map.get("unit_3") == null ? 0 : map.get("unit_3"));
        map.put("unit_4", map.get("unit_4") == null ? 0 : map.get("unit_4"));
        map.put("unit_5", map.get("unit_5") == null ? 0 : map.get("unit_5"));
        map.put("unit_6", map.get("unit_6") == null ? 0 : map.get("unit_6"));
        map.put("unit_7", map.get("unit_7") == null ? 0 : map.get("unit_7"));
        map.put("unit_8", map.get("unit_8") == null ? 0 : map.get("unit_8"));
        map.put("unit_9", map.get("unit_9") == null ? 0 : map.get("unit_9"));
        map.put("unit_10", map.get("unit_10") == null ? 0 : map.get("unit_10"));
        map.put("unit_11", map.get("unit_11") == null ? 0 : map.get("unit_11"));
        map.put("unit_12", map.get("unit_12") == null ? 0 : map.get("unit_12"));
        map.put("unit_13", map.get("unit_13") == null ? 0 : map.get("unit_13"));
        map.put("unit_14", map.get("unit_14") == null ? 0 : map.get("unit_14"));
        map.put("unit_15", map.get("unit_15") == null ? 0 : map.get("unit_15"));
        map.put("unit_16", map.get("unit_16") == null ? 0 : map.get("unit_16"));
        map.put("unit_17", map.get("unit_17") == null ? 0 : map.get("unit_17"));
        return map;
    }
}
