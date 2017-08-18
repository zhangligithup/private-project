package com.foodregulation.dao.mapper;

import java.util.Map;

import com.foodregulation.dao.entity.Proposal;

public interface ProposalMapper {
	
    int deleteProposal(Integer id);

    int insertProposal(Proposal record);

    Proposal findProposal(Integer id);

    int updateProposal(Proposal record);
    
    Map<String,Object> selectPdfDataById(Integer id);
}