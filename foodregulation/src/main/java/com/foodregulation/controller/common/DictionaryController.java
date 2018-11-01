package com.foodregulation.controller.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.Dictionary;
import com.foodregulation.service.Dictionary.DictionaryService;

/**
 * @author dxl
 * 字典查询controller
 */
@Controller
@RequestMapping("/dictionary")
public class DictionaryController {

    @Autowired
    DictionaryService dictionaryService;



    @RequestMapping("/getDictionary")
    @ResponseBody
    public List<Dictionary> getDictionary(HttpServletRequest request, Integer type) {
        List<Dictionary> list = dictionaryService.getDictionaryByType(type);
        return list;
    }


    @RequestMapping("/getDictionaryByCode")
    @ResponseBody
    public Dictionary getDictionaryByCode(String tDictionaryCode) {
        return dictionaryService.getDictionaryByCode(tDictionaryCode);
    }


    @RequestMapping("address")
    public String showAddress() {
        return "dictionary/addressDictionary";
    }


    @RequestMapping("enterprise")
    public String showEnterprise() {
        return "dictionary/enterpriseDictionary";
    }


    @RequestMapping("unit")
    public String showUnit() {
        return "dictionary/unitDictionary";
    }


    @RequestMapping("economic")
    public String showeEonomic() {
        return "dictionary/economicDictionary";
    }


    @RequestMapping("check")
    public String showeCheck() {
        return "dictionary/checkDictionary";
    }


    @RequestMapping("sampling")
    public String showeSampling() {
        return "dictionary/samplingDictionary";
    }


    @RequestMapping("/getDictionaryList")
    @ResponseBody
    public List<Dictionary> getDictionaryList(Integer pageIndex, Integer pageSize, Integer type) {
        return dictionaryService.getDictionaryList(pageIndex, pageSize, type);
    }


    @RequestMapping("/getDictionaryListCount")
    @ResponseBody
    public Long getDictionaryListCount(Integer type) {
        return dictionaryService.getDictionaryListCount(type);
    }


    @RequestMapping("/deleteDictionary")
    @ResponseBody
    public Integer deleteDictionary(Integer id) {
        return dictionaryService.deleteDictionary(id);
    }


    @RequestMapping("/updateDictionary")
    @ResponseBody
    public Integer updateDictionary(HttpServletRequest request, Dictionary dictionary) {
        Integer res = dictionaryService.updateDictionary(dictionary);
        dictionary = dictionaryService.selectByPrimaryKey(dictionary.getId());
        if (dictionary.gettDictionaryType() == 0) {
            List<Dictionary> addressList = dictionaryService.getDictionaryByType(0);
            request.getSession().setAttribute("addressList", addressList);
        } else if (dictionary.gettDictionaryType() == 1) {
            // 保存企业类别到session
            List<Dictionary> enterpriseTypeList = dictionaryService.getDictionaryByType(1);
            request.getSession().setAttribute("enterpriseTypeList", enterpriseTypeList);
        } else if (dictionary.gettDictionaryType() == 2) {
            /*
             * 1.查询所有单位,监管单位 2.保存到session域
             */
            List<Dictionary> unitList = dictionaryService.getDictionaryByType(2);
            request.getSession().setAttribute("unitList", unitList);
        } else if (dictionary.gettDictionaryType() == 5) {
            // 保存经济类型到session
            List<Dictionary> economicTypeList = dictionaryService.getDictionaryByType(5);
            request.getSession().setAttribute("economicTypeList", economicTypeList);
        } else if (dictionary.gettDictionaryType() == 6) {
            // 保存检查频次到session
            List<Dictionary> checkFrequencyList = dictionaryService.getDictionaryByType(6);
            request.getSession().setAttribute("checkFrequencyList", checkFrequencyList);
        }
        return res;
    }


    @RequestMapping("/saveDictionary")
    @ResponseBody
    public Integer saveDictionary(HttpServletRequest request, Dictionary dictionary) {
        Integer res = dictionaryService.saveDictionary(dictionary);
        if (dictionary.gettDictionaryType() == 0) {
            List<Dictionary> addressList = dictionaryService.getDictionaryByType(0);
            request.getSession().setAttribute("addressList", addressList);
        } else if (dictionary.gettDictionaryType() == 1) {
            // 保存企业类别到session
            List<Dictionary> enterpriseTypeList = dictionaryService.getDictionaryByType(1);
            request.getSession().setAttribute("enterpriseTypeList", enterpriseTypeList);
        } else if (dictionary.gettDictionaryType() == 2) {
            /*
             * 1.查询所有单位,监管单位 2.保存到session域
             */
            List<Dictionary> unitList = dictionaryService.getDictionaryByType(2);
            request.getSession().setAttribute("unitList", unitList);
        } else if (dictionary.gettDictionaryType() == 5) {
            // 保存经济类型到session
            List<Dictionary> economicTypeList = dictionaryService.getDictionaryByType(5);
            request.getSession().setAttribute("economicTypeList", economicTypeList);
        } else if (dictionary.gettDictionaryType() == 6) {
            // 保存检查频次到session
            List<Dictionary> checkFrequencyList = dictionaryService.getDictionaryByType(6);
            request.getSession().setAttribute("checkFrequencyList", checkFrequencyList);
        }
        return res;
    }
}
