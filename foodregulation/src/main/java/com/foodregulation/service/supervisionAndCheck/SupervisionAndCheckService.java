package com.foodregulation.service.supervisionAndCheck;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.InspectionRecord;
import com.foodregulation.dao.entity.Notice;
import com.foodregulation.dao.entity.Proposal;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.entity.SupervisionAndCheckTask;


public interface SupervisionAndCheckService {
	
	List<SupervisionAndCheck> selectSupervisionCheck(Map<String,Object> param);
	
	int selectSupervisionCheckTotal(Map<String,Object> param);
	
	int add(SupervisionAndCheck supervisionAndCheck);
	
	SupervisionAndCheck selectByPrimaryKey(Integer id);
	
	int del(Integer id);
	
	int update(SupervisionAndCheck supervisionAndCheck);
	
	/**
	 * 添加现场检查笔录
	 * @Title: insertInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param record
	 * @return
	 */
	int insertInspectionRecord(InspectionRecord record);
	
	/**
	 * 查看现场检查笔录
	 * @Title: findInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	InspectionRecord findInspectionRecord(Integer id);
	/**
	 * 删除现场检查笔录
	 * @Title: findInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	int deleteInspectionRecord(Integer id);
	/**
	 * 修改现场检查笔录
	 * @Title: updateInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param record
	 * @return
	 */
	int updateInspectionRecord(InspectionRecord record);
	/**
	 * 删除监督意见书
	 * @Title: deleteProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	int deleteProposal(Integer id);
	/**
	 * 添加监督意见书
	 * @Title: insertProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param record
	 * @return
	 */
    int insertProposal(Proposal record);
    /**
     * 查询监督意见书
     * @Title: findProposal
     * @Description: TODO
     * @author: kongjiang
     * @param id
     * @return
     */
    Proposal findProposal(Integer id);
    /**
     * 修改监督意见书
     * @Title: updateProposal
     * @Description: TODO
     * @author: kongjiang
     * @param record
     * @return
     */
    int updateProposal(Proposal record);
    /**
     * 删除责令整改通知书
     * @Title: deleteNotice
     * @Description: TODO
     * @author: kongjiang
     * @param id
     * @return
     */
    int deleteNotice(Integer id);
    /**
     * 添加责令整改通知书
     * @Title: insertNotice
     * @Description: TODO
     * @author: kongjiang
     * @param record
     * @return
     */
    int insertNotice(Notice record);
    /**
     * 查询责令整改通知书
     * @Title: findNotice
     * @Description: TODO
     * @author: kongjiang
     * @param id
     * @return
     */
    Notice findNotice(Integer id);
    /**
     * 修改责令整改通知书
     * @Title: updateNotice
     * @Description: TODO
     * @author: kongjiang
     * @param record
     * @return
     */
    int updateNotice(Notice record);
    
    /**
     * 添加监督任务
     * @param record
     * @return
     */
    int insert(SupervisionAndCheckTask record);
    
    /**
     * 查询监督检查任务列表
     * @param param
     * @return
     */
    List<SupervisionAndCheckTask> selectSupervisionCheckTask(Map<String,Object> param);
	
    /**
     * 查询监督检查任务总数
     * @param param
     * @return
     */
	int selectSupervisionCheckTaskTotal(Map<String,Object> param);
	
	/**
	 * 根据id查询监督检查任务
	 * @param id
	 * @return
	 */
	SupervisionAndCheckTask selectSupervisionCheckTaskById(Integer id);
	
	int delSupervisionAndCheckTaskById(Integer id);
	
    /**
     * 查询现场检查笔录生成pdf所需数据
     * @param id
     * @return
     */
    Map<String,Object> selectInspectionRecordPdfDataById(Integer id);
    /**
     * 查询监督检查意见生成pdf所需数据
     * @param id
     * @return
     */
    Map<String,Object> selectProposalPdfDataById(Integer id);
    
    /**
     * 查询责令整改通知生成pdf所需数据
     * @param id
     * @return
     */
    Map<String,Object> selectNoticePdfDataById(Integer id);
}

