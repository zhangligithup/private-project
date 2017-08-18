package com.foodregulation.dao.mapper;

import java.util.Map;

import com.foodregulation.dao.entity.Notice;

public interface NoticeMapper {
	
    int deleteNotice(Integer id);

    int insertNotice(Notice record);

    Notice findNotice(Integer id);

    int updateNotice(Notice record);

    Map<String,Object> selectPdfDataById(Integer id);
}