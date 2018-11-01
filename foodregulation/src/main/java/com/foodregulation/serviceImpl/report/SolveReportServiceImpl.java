package com.foodregulation.serviceImpl.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.SolveReport;
import com.foodregulation.dao.mapper.ReportMapper;
import com.foodregulation.dao.mapper.SolveReportMapper;
import com.foodregulation.service.report.SolveReportService;

@Service
public class SolveReportServiceImpl implements SolveReportService{
	
	@Autowired
	SolveReportMapper solveReportMapper;
	@Autowired
	ReportMapper reportMapper;

	@Override
	public int handleReport(SolveReport solveReport) {
		int num = reportMapper.updateReportStatus(solveReport.getReportId()+"");
		if(num>0){
			num = solveReportMapper.insertSelective(solveReport);
		}
		return num;
	}

	@Override
	public SolveReport findHandleReport(String reportId) {
		return solveReportMapper.findHandleReport(reportId);
	}

	
	

}
