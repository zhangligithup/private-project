package com.foodregulation.serviceImpl.supervisionAndCheck;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.InspectionRecord;
import com.foodregulation.dao.entity.Notice;
import com.foodregulation.dao.entity.Proposal;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.entity.SupervisionAndCheckTask;
import com.foodregulation.dao.mapper.InspectionRecordMapper;
import com.foodregulation.dao.mapper.NoticeMapper;
import com.foodregulation.dao.mapper.ProposalMapper;
import com.foodregulation.dao.mapper.SupervisionAndCheckMapper;
import com.foodregulation.dao.mapper.SupervisionAndCheckTaskMapper;
import com.foodregulation.service.supervisionAndCheck.SupervisionAndCheckService;
@Service
public class SupervisionAndCheckServiceImpl implements SupervisionAndCheckService{
	@Autowired
	SupervisionAndCheckMapper supervisionCheckMapper;
	@Autowired
	InspectionRecordMapper inspectionRecordMapper;
	@Autowired
	ProposalMapper proposalMapper;
	@Autowired
	NoticeMapper noticeMapper;
	@Autowired
	SupervisionAndCheckTaskMapper supervisionAndCheckTaskMapper;

	@Override
	public List<SupervisionAndCheck> selectSupervisionCheck(Map<String, Object> param) {
		return supervisionCheckMapper.selectSupervisionCheck(param);
	}

	@Override
	public int selectSupervisionCheckTotal(Map<String, Object> param) {
		return supervisionCheckMapper.selectSupervisionCheckTotal(param);
	}

	@Override
	public int add(SupervisionAndCheck supervisionAndCheck) {
		return supervisionCheckMapper.insertSelective(supervisionAndCheck);
	}

	@Override
	public SupervisionAndCheck selectByPrimaryKey(Integer id) {
		return supervisionCheckMapper.selectByPrimaryKey(id);
	}

	@Override
	public int del(Integer id) {
		return supervisionCheckMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(SupervisionAndCheck supervisionAndCheck) {
		return supervisionCheckMapper.updateByPrimaryKeySelective(supervisionAndCheck);
	}

	@Override
	public int insertInspectionRecord(InspectionRecord record) {
		return inspectionRecordMapper.insertInspectionRecord(record);
	}

	@Override
	public InspectionRecord findInspectionRecord(Integer id) {
		return inspectionRecordMapper.findInspectionRecord(id);
	}

	@Override
	public int deleteInspectionRecord(Integer id) {
		return inspectionRecordMapper.deleteInspectionRecord(id);
	}

	@Override
	public int updateInspectionRecord(InspectionRecord record) {
		return inspectionRecordMapper.updateInspectionRecord(record);
	}

	@Override
	public int deleteProposal(Integer id) {
		return proposalMapper.deleteProposal(id);
	}

	@Override
	public int insertProposal(Proposal record) {
		return proposalMapper.insertProposal(record);
	}

	@Override
	public Proposal findProposal(Integer id) {
		return proposalMapper.findProposal(id);
	}

	@Override
	public int updateProposal(Proposal record) {
		return proposalMapper.updateProposal(record);
	}

	@Override
	public int deleteNotice(Integer id) {
		return noticeMapper.deleteNotice(id);
	}

	@Override
	public int insertNotice(Notice record) {
		return noticeMapper.insertNotice(record);
	}

	@Override
	public Notice findNotice(Integer id) {
		return noticeMapper.findNotice(id);
	}

	@Override
	public int updateNotice(Notice record) {
		return noticeMapper.updateNotice(record);
	}

	@Override
	public int insert(SupervisionAndCheckTask record) {
		return supervisionAndCheckTaskMapper.insert(record);
	}

	@Override
	public List<SupervisionAndCheckTask> selectSupervisionCheckTask(Map<String, Object> param) {
		return supervisionAndCheckTaskMapper.selectSupervisionCheckTask(param);
	}

	@Override
	public int selectSupervisionCheckTaskTotal(Map<String, Object> param) {
		return supervisionAndCheckTaskMapper.selectSupervisionCheckTaskTotal(param);
	}

	@Override
	public SupervisionAndCheckTask selectSupervisionCheckTaskById(Integer id) {
		return supervisionAndCheckTaskMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delSupervisionAndCheckTaskById(Integer id) {
		return supervisionAndCheckTaskMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Map<String, Object> selectInspectionRecordPdfDataById(Integer id) {
		return inspectionRecordMapper.selectPdfDataById(id);
	}

	@Override
	public Map<String, Object> selectProposalPdfDataById(Integer id) {
		return proposalMapper.selectPdfDataById(id);
	}

	@Override
	public Map<String, Object> selectNoticePdfDataById(Integer id) {
		return noticeMapper.selectPdfDataById(id);
	}
}

