package com.pets.controller;

import com.pets.entity.Apply;
import com.pets.service.ApplyService;
import com.pets.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * 志愿者申请控制器
 */
@Controller
@RequestMapping("apply")
public class ApplyController {

    @Autowired
    private ApplyService applyService;


    /**
     * 志愿者列表
     * @param pn
     * @return
     */
    @RequestMapping("applys.action")
    @ResponseBody
    public Message getBlog(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);
        List<Apply> applys = applyService.getApply();
        System.out.println(applys);
        // startPage后面紧跟的这个查询就是一个分页查询
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page=new PageInfo(applys,2);
        return Message.success().add("pageInfo",page);
    }

    /**
     * 添加志愿者
     * @param apply
     * @return
     */
    @RequestMapping("add.action")
    @ResponseBody
    public Message addApply(Apply apply){
        if(StringUtils.isEmpty(apply.getName())){
            return Message.error("请填写姓名");

        }
        if(StringUtils.isEmpty(apply.getTelephone())){
            return Message.error("请填写手机号");

        }
        if(StringUtils.isEmpty(apply.getAge())){
            return Message.error("请填写年龄");

        }
        if(StringUtils.isEmpty(apply.getEmail())){
            return Message.error("请填写邮箱");

        }
        if(StringUtils.isEmpty(apply.getMessage())){
            return Message.error("请填写理由");

        }
        apply.setApplyTime(new Date());
        apply.setState(2);
        int i = applyService.addApply(apply);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 删除志愿者申请
     * @param id
     * @return
     */
    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteApply(Integer id){
        int i = applyService.deleteApply(id);
        if(i>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("update.action")
    @ResponseBody
    public Message updateApply(Apply apply){
        if(applyService.updateApply(apply)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id){
        Apply apply=applyService.findById(id);
        if(apply!=null){
            return Message.success().add("apply",apply);
        }else{
            return Message.fail();
        }

    }

    @RequestMapping("findByState.action")
    @ResponseBody
    public Message findByTime(@RequestParam(defaultValue ="1",value = "pn") Integer pn,Integer state){
        PageHelper.startPage(pn,4);
        List<Apply> states = applyService.findByState(state);
        if(states!=null){
            PageInfo page=new PageInfo(states,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }


    /**
     * 审核
     * @return
     */
    @PostMapping("/exam_state")
    @ResponseBody
    public Message examState(Integer id,Integer state){
        Apply byId = applyService.findById(id);
        byId.setState(state);
        int i = applyService.updateApply(byId);
        if(i<=0){
            return Message.error("审核失败");
        }
        return Message.success();
    }

}
