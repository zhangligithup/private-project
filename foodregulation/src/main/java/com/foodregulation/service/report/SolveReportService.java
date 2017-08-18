package com.foodregulation.service.report;

import com.foodregulation.dao.entity.SolveReport;

public interface SolveReportService {

	int handleReport(SolveReport solveReport);
	
	SolveReport findHandleReport(String reportId);
	
}
