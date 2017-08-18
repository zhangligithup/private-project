package com.foodregulation.controller.administrative;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.CaseFrom;
import com.foodregulation.service.administrative.CasefromService;

/**
 * 案件来源类型
 */
@Controller
@RequestMapping("/casefrom")
public class CasefromController {


    @Autowired
    CasefromService casefromService;


    @RequestMapping("/casefrom")
    public String casefrom() {
        return "administrative/caseFrom";
    }


    /**
     * 案件来源显示
     */
    @RequestMapping("/selectCasefrom")
    @ResponseBody
    public List<CaseFrom> selectCasefrom(HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("startNum", request.getParameter("startNum"));
        params.put("limit", request.getParameter("limit"));
        List<CaseFrom> result = casefromService.selectCaseFrom(params);
        return result;
    }


    /**
     * 案件来源显示（总条数）
     */
    @RequestMapping("/selectCasefromTotal")
    @ResponseBody
    public int selectCasefromTotal(HttpServletRequest request) {
        return casefromService.selectCaseFromTotal();
    }


    /**
     * 案件来源添加
     */
    @RequestMapping("/insertCasefrom")
    @ResponseBody
    public int insertCasefrom(HttpServletRequest request, CaseFrom caseFrom) {
        int num = casefromService.insertCaseFrom(caseFrom);
        return num;
    }


    /**
     * 案件来源修改
     */
    @RequestMapping("/updateCasefrom")
    @ResponseBody
    public int updateCasefrom(HttpServletRequest request, CaseFrom caseFrom) {
        int num = casefromService.updateCaseFrom(caseFrom);
        return num;
    }


    /**
     * 案件来源修改--findone
     */
    @RequestMapping("/findCaseFrom")
    @ResponseBody
    public CaseFrom findCaseFrom(HttpServletRequest request, int caseFromId) {
        CaseFrom caseFrom = casefromService.findCaseFrom(caseFromId);
        return caseFrom;
    }


    /**
     * 案件来源删除
     */
    @RequestMapping("/deleteCasefrom")
    @ResponseBody
    public int deleteCasefrom(HttpServletRequest request, int caseFromId) {
        int num = casefromService.deleteCaseFrom(caseFromId);
        return num;
    }
}
