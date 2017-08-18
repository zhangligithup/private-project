package com.foodregulation.controller.exam;

import com.alibaba.fastjson.JSONObject;
import com.foodregulation.dao.entity.*;
import com.foodregulation.service.exam.ExamRelationService;
import com.foodregulation.service.exam.ExamService;
import com.foodregulation.service.exam.ExaminationService;
import com.foodregulation.util.ResultUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @Description 试题
 * @Author yangchao
 * @Date 2016/12/18.
 */
@Controller
@RequestMapping("/exam")
public class ExamController {

    @Autowired
    ExamService examService;
    @Autowired
    ExaminationService examinationService;

    @Autowired
    ExamRelationService examRelationService;

    @RequestMapping("/exam")
    public String exam(){
        return "exam/exam";
    }

    @RequestMapping("/examination")
    public String examination(){
        return "exam/examination";
    }

    /**
     * 试题列表
     * @param request
     * @return
     */
    @RequestMapping("selectExam")
    @ResponseBody
    public List<Exam> selectExam(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("type", request.getParameter("type"));
        param.put("startNum", request.getParameter("startNum"));
        param.put("limit", request.getParameter("limit"));
        return examService.selectExam(param);
    }

    /**
     * 试题总数
     * @param request
     * @return
     */
    @RequestMapping("/selectExamTotal")
    @ResponseBody
    public long selectExamTotal(HttpServletRequest request){

        Map<String,Object> param = new HashMap<String,Object>();
        param.put("type", request.getParameter("type"));
        return examService.selectExamTotal(param);
    }

    /**
     * 查找试题
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/findExam")
    @ResponseBody
    public Exam findExam(HttpServletRequest request,Long id){
        return examService.findExam(id);
    }


    /**
     * 新增试题
     * @param request
     * @param exam
     * @return
     */
    @RequestMapping("addExam")
    @ResponseBody
    public JSONObject addExam(HttpServletRequest request,Exam exam){
        boolean pageResult=false;
        try{
            if(StringUtils.isBlank(exam.getAnswer())){
                return ResultUtil.jsonObject("false","试题答案不能为空");
            }
            if(StringUtils.isBlank(exam.getExType())){
                return ResultUtil.jsonObject("false","试题类别不能为空");
            }
            int add= examService.addExam(exam);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }

    /**
     * 修改试题
     * @param request
     * @param exam
     * @return
     */
    @RequestMapping("updateExam")
    @ResponseBody
    public JSONObject updateExam(HttpServletRequest request,Exam exam){
        boolean pageResult=false;
        try{
            if(exam.getId()==null||exam.getId()==0){
                return ResultUtil.jsonObject("false","试题id为空");
            }
            if(StringUtils.isBlank(exam.getAnswer())){
                return ResultUtil.jsonObject("false","试题答案不能为空");
            }
            if(StringUtils.isBlank(exam.getContent())&&!"填空题".equals(exam.getExType())){
                return ResultUtil.jsonObject("false","试题内容不能为空");
            }
            if(StringUtils.isBlank(exam.getExType())){
                return ResultUtil.jsonObject("false","试题类别不能为空");
            }
            int add= examService.updateExam(exam);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }


    /**
     * 删除试题
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("delExam")
    @ResponseBody
    public JSONObject delExam(HttpServletRequest request,Long id){
        boolean pageResult=false;
        try{
            if(id==null||id==0){
                return ResultUtil.jsonObject("false","试题id为空");
            }
            int add= examService.delExam(id);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }

    /**
     * 试卷列表
     * @param request
     * @return
     */
    @RequestMapping("selectExamination")
    @ResponseBody
    public List<Examination> selectExamination(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("type", request.getParameter("type"));
        param.put("startNum", request.getParameter("startNum"));
        param.put("limit", request.getParameter("limit"));
        List<Examination> list = examinationService.selectExamination(param);
        return list;
    }

    /**
     * 试卷总数
     * @param request
     * @return
     */
    @RequestMapping("/selectExaminationTotal")
    @ResponseBody
    public long selectExaminationTotal(HttpServletRequest request){
        return examinationService.selectExaminationTotal();
    }

    /**
     * 试卷试题
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/findExamination")
    @ResponseBody
    public Examination findExamination(HttpServletRequest request,Long id){
        return examinationService.findExamination(id);
    }

    /**
     * 试题列表
     * @param request
     * @return
     */
    @RequestMapping("findExaminationList")
    @ResponseBody
    public List<Examination> findExaminationList(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();

        param.put("startNum", request.getParameter("startNum"));
        param.put("limit", request.getParameter("limit"));
        return examinationService.findExaminationList(param);
    }


    /**
     * 新增试卷
     * @param request
     * @param examination
     * @return
     */
    @RequestMapping("addExamination")
    @ResponseBody
    public JSONObject addExamination(HttpServletRequest request,Examination examination){
        boolean pageResult=false;
        try{
            if(StringUtils.isBlank(examination.getTemplateName())){
                return ResultUtil.jsonObject("false","试卷模版名称不能为空");
            }
            if(StringUtils.isBlank(examination.getChoiceCount())){
                return ResultUtil.jsonObject("false","选择题数量不能为空");
            }
            if(StringUtils.isBlank(examination.getChoiceScore())){
                return ResultUtil.jsonObject("false","选择题分数不能为空");
            }
            if(StringUtils.isBlank(examination.getChoiceTime())){
            	return ResultUtil.jsonObject("false","选择题答题时间不能为空");
            }
            if(StringUtils.isBlank(examination.getJudgmentCount())){
                return ResultUtil.jsonObject("false","判断题数量不能为空");
            }
            if(StringUtils.isBlank(examination.getJudgmentScore())){
                return ResultUtil.jsonObject("false","判断题分数不能为空");
            }
            if(StringUtils.isBlank(examination.getJudgmentTime())){
            	return ResultUtil.jsonObject("false","判断题答题时间不能为空");
            }
            if(StringUtils.isBlank(examination.getCompletionCount())){
                return ResultUtil.jsonObject("false","填空题数量不能为空");
            }
            if(StringUtils.isBlank(examination.getCompletionScore())){
                return ResultUtil.jsonObject("false","填空题分数不能为空");
            }
            if(StringUtils.isBlank(examination.getCompletionTime())){
            	return ResultUtil.jsonObject("false","填空题答题时间不能为空");
            }
            if(StringUtils.isNumeric(examination.getChoiceScore())
                    &&StringUtils.isNumeric(examination.getJudgmentScore())&&
                    StringUtils.isNumeric(examination.getCompletionScore())&&StringUtils.isNumeric(examination.getChoiceTime())
                    &&StringUtils.isNumeric(examination.getJudgmentTime())&&
                    StringUtils.isNumeric(examination.getCompletionTime())){

                String [] choice=examination.getChoiceCount().split(",");
                examination.setChoiceList(StringToLongLst(choice));
                String [] judgmentArr=examination.getJudgmentCount().split(",");
                examination.setJudgmentList(StringToLongLst(judgmentArr));
                String [] completeArr=examination.getCompletionCount().split(",");
                examination.setCompletionList(StringToLongLst(completeArr));

                examination.setChoiceCount(String.valueOf(choice.length));
                examination.setJudgmentCount(String.valueOf(judgmentArr.length));
                examination.setCompletionCount(String.valueOf(completeArr.length));


                Double xuanzef=Double.parseDouble(examination.getChoiceScore());
                Double panduanf=Double.parseDouble(examination.getJudgmentScore());
                Double tiankongf=Double.parseDouble(examination.getCompletionScore());
                
                Double xuanzet=Double.parseDouble(examination.getChoiceTime());
                Double panduant=Double.parseDouble(examination.getJudgmentTime());
                Double tiankongt=Double.parseDouble(examination.getCompletionTime());

                if(xuanzef<=0 || panduanf<=0 || tiankongf<=0||xuanzet<=0 || panduant<=0 || tiankongt<=0){
                    return ResultUtil.jsonObject("false","分数和时间不能小于等于0");
                }

                int add= examinationService.addExamination(examination);

                if(add>0){
                    List<ExamRelation> list=new ArrayList<ExamRelation>();
                    for(Long exId:examination.getChoiceList()){
                        ExamRelation record=new ExamRelation();
                        record.setExamid(exId);
                        record.setExaminationid(examination.getId());
                        list.add(record);
                    }

                    for(Long exId:examination.getJudgmentList()){
                        ExamRelation record=new ExamRelation();
                        record.setExamid(exId);
                        record.setExaminationid(examination.getId());
                        list.add(record);
                    }

                    for(Long exId:examination.getCompletionList()){
                        ExamRelation record=new ExamRelation();
                        record.setExamid(exId);
                        record.setExaminationid(examination.getId());
                        list.add(record);
                    }

                    examRelationService.insertList(list);

                    pageResult=true;
                }
            }else {
                return ResultUtil.jsonObject("false","分数和答题时间只能为数字");
            }



        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }

    public static List<Long> StringToLongLst(String[] inList){
        List<Long> iList =new ArrayList<Long>(inList.length);
        try{
            for(int i=0,j=inList.length;i<j;i++){
                iList.add(Long.parseLong(inList[i]));
            }
        }catch(Exception  e){
        }
        return iList;
    }

    /**
     * 修改试卷
     * @param request
     * @param examination
     * @return
     */
    @RequestMapping("updateExamination")
    @ResponseBody
    public JSONObject updateExamination(HttpServletRequest request,Examination examination){
        boolean pageResult=false;
        try{
            if(examination.getId()==null||examination.getId()==0){
                return ResultUtil.jsonObject("false","试卷id为空");
            }
            if(StringUtils.isBlank(examination.getTemplateName())){
                return ResultUtil.jsonObject("false","试卷模版名称不能为空");
            }
            if(StringUtils.isBlank(examination.getChoiceCount())){
                return ResultUtil.jsonObject("false","选择题数量不能为空");
            }
            if(StringUtils.isBlank(examination.getChoiceScore())){
                return ResultUtil.jsonObject("false","选择题分数不能为空");
            }
            if(StringUtils.isBlank(examination.getJudgmentCount())){
                return ResultUtil.jsonObject("false","判断题数量不能为空");
            }
            if(StringUtils.isBlank(examination.getJudgmentScore())){
                return ResultUtil.jsonObject("false","判断题分数不能为空");
            }
            if(StringUtils.isBlank(examination.getCompletionCount())){
                return ResultUtil.jsonObject("false","填空题数量不能为空");
            }
            if(StringUtils.isBlank(examination.getCompletionScore())){
                return ResultUtil.jsonObject("false","填空题分数不能为空");
            }
            int add= examinationService.updateExamination(examination);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }


    /**
     * 删除试卷
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("delExamination")
    @ResponseBody
    public JSONObject delExamination(HttpServletRequest request,Long id){
        boolean pageResult=false;
        try{
            if(id==null||id==0){
                return ResultUtil.jsonObject("false","试题id为空");
            }
            int add= examinationService.delExamination(id);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }

    @RequestMapping("publish")
    @ResponseBody
    public JSONObject publish(HttpServletRequest request,ExamPublish examPublish){
        boolean pageResult=false;
        try{

            if(StringUtils.isBlank(examPublish.getType())){
                return ResultUtil.appJsonObject(false,"发布类型不能为空");
            }
            if (CollectionUtils.isEmpty(examPublish.getList())) {

                if("1".equals(examPublish.getType())) {
                    return ResultUtil.appJsonObject(false, "企业不能为空");
                }
                if("2".equals(examPublish.getType())) {
                    return ResultUtil.appJsonObject(false,"监管单位不能为空");
                }

                return ResultUtil.appJsonObject(false,"发布目标不能为空");
            }


            for (Integer entId:examPublish.getList()){
                ExamPublish publish=new ExamPublish();
                BeanUtils.copyProperties(examPublish,publish);
                publish.setPersonCompanyId(entId);
                int ex=examinationService.existPublish(publish);
                if(ex>0){
                   continue;
                }

                int add=examinationService.insertPublish(publish);
                if(add>0) {
                    pageResult = true;
                }
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.appJsonObject(true,"成功");
    }


    /**
     * 查看结果总数
     * @param request
     * @return
     */
    @RequestMapping("/jumpScore")
    public String jumpScore(HttpServletRequest request,String url){
        return "exam/"+url;
    }


    /**
     * 从业人员查看结果总数
     * @param request
     * @return
     */
    @RequestMapping("/findCongYeScoreTotal")
    @ResponseBody
    public long findCongYeScoreTotal(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("examinationId",request.getParameter("examinationId"));
        param.put("enterpriseType",request.getParameter("enterpriseType"));
        param.put("enterpriseName",request.getParameter("enterpriseName"));
        return examinationService.findCongYeScoreTotal(param);
    }


    /**
     * 从业人员查看结果
     * @param request
     * @return
     */
    @RequestMapping("findCongYeScore")
    @ResponseBody
    public List<Map<String,Object>> findCongYeScore(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("examinationId",request.getParameter("examinationId"));
        param.put("enterpriseType",request.getParameter("enterpriseType"));
        param.put("enterpriseName",request.getParameter("enterpriseName"));
        param.put("startNum", request.getParameter("startNum"));
        param.put("limit", request.getParameter("limit"));
        return examinationService.findCongYeScore(param);
    }

    /**
     * 执法人员查看结果总数
     * @param request
     * @return
     */
    @RequestMapping("/findJianGuanScoreTotal")
    @ResponseBody
    public long findJianGuanScoreTotal(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("examinationId",request.getParameter("examinationId"));
        param.put("unitId",request.getParameter("unitId"));
        param.put("personName",request.getParameter("personName"));
        return examinationService.findJianGuanScoreTotal(param);
    }


    /**
     * 执法人员查看结果
     * @param request
     * @return
     */
    @RequestMapping("findJianGuanScore")
    @ResponseBody
    public List<Map<String,Object>> findJianGuanScore(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("examinationId",request.getParameter("examinationId"));
        param.put("unitId",request.getParameter("unitId"));
        param.put("personName",request.getParameter("personName"));
        param.put("startNum", request.getParameter("startNum"));
        param.put("limit", request.getParameter("limit"));
        return examinationService.findJianGuanScore(param);
    }


    @RequestMapping("answerExam")
    @ResponseBody
    public JSONObject answerExam(HttpServletRequest request,@RequestBody List<ExamRecord> list){
        boolean pageResult=false;
        try{
            if(CollectionUtils.isEmpty(list))
                return ResultUtil.appJsonObject(pageResult,"答案不能为空");

            for(ExamRecord record:list){
                if(null==record.getExamId()||0==record.getExamId()){
                    return ResultUtil.appJsonObject(pageResult,"试题id不能为空");
                }
                if(null==record.getExaminationId()||0==record.getExaminationId()){
                    return ResultUtil.appJsonObject(pageResult,"试卷id不能为空");
                }
                if(null==record.getOperatorId()||0==record.getOperatorId()){
                    return ResultUtil.appJsonObject(pageResult,"答题人id不能为空");
                }
            }

            int total=examRelationService.findTotalExam(list.get(0).getExaminationId());
            if(total!=list.size())
                return ResultUtil.appJsonObject(pageResult,"必须答完试卷所有试题");

            int add=examinationService.insertListRecord(list);
            if(add>0)
                pageResult=true;
        }catch (Exception ex){
            ex.printStackTrace();
        }


        return ResultUtil.appJsonObject(pageResult,"");
    }


}
