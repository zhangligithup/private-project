package com.foodregulation.serviceImpl.report;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.mapper.ReportMapper;
import com.foodregulation.dao.mapper.SolveReportMapper;
import com.foodregulation.service.report.ReportService;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	ReportMapper reportMapper;
	@Autowired
	SolveReportMapper solveReportMapper;

	@Override
	public List<Report> selectReport(Map<String, Object> map) {
		return reportMapper.selectReport(map);
	}

	@Override
	public int deleteReport(Integer reportId) {
		solveReportMapper.deleteHandleReport(reportId+"");//不知道咋写了
		return reportMapper.deleteReport(reportId);
	}

	@Override
	public int insertReport(Report record) {
		return reportMapper.insertReport(record);
	}

	@Override
	public Report findReport(Integer reportId) {
		return reportMapper.findReport(reportId);
	}

	@Override
	public int updateReport(Report record) {
		return reportMapper.updateReport(record);
	}

	@Override
	public int selectReportTotal(Map<String, Object> map) {
		return reportMapper.selectReportTotal(map);
	}

	

}
