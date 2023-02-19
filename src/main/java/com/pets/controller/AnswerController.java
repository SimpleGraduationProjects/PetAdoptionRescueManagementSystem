package com.pets.controller;

import com.pets.entity.Answer;
import com.pets.entity.Users;
import com.pets.service.AnswerService;
import com.pets.service.CommentService;
import com.pets.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 评论回复控制器
 */
@Controller
@RequestMapping("answer")
public class AnswerController {

    @Autowired
    private AnswerService answerService;
    @Autowired
    private CommentService commentService;

    /**
     * 一次评论操作
     * @param ids
     * @param content
     * @param request
     * @return
     */
    @RequestMapping("add.action")
    @ResponseBody
    public Message addAnswer(Integer ids,String content, HttpServletRequest request){
        if(StringUtils.isEmpty(content)){
            return Message.error("请填写回复内容");
        }
        Answer answer=new Answer();
        Users user = (Users)request.getSession().getAttribute("user");
        answer.setComment(commentService.findById(ids));
        answer.setAnswerTime(new Date());
        answer.setUser(user);
        answer.setContent(content);
        int i = answerService.addAnswer(answer);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 二级评论回复操作
     * @param id
     * @param content
     * @param comment_id
     * @param request
     * @return
     */
    @RequestMapping("replyAdd.action")
    @ResponseBody
    public Message replyAdd(Integer id,String content,Integer comment_id,HttpServletRequest request){
        if(StringUtils.isEmpty(content)){
            return Message.error("请填写回复内容");
        }
        Answer answer=new Answer();
        Users user = (Users)request.getSession().getAttribute("user");
        answer.setComment(commentService.findById(comment_id));
        answer.setAnswer(answerService.findById(id));
        answer.setAnswerTime(new Date());
        answer.setUser(user);
        answer.setContent(content);
        int i = answerService.addAnswers(answer);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }


    @RequestMapping("findByCommentId.action")
    @ResponseBody
    public Message findByCommentId(Integer comment_id){
        List<Answer> answers = answerService.findByCommentId(comment_id);
        System.out.println(answers);
        if(answers!=null){
            return Message.success().add("answer",answers);
        }else{
            return Message.fail();
        }
    }


    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id){
        Answer answer = answerService.findById(id);
        System.out.println(answer);
        if(answer!=null){
            return Message.success().add("answer",answer);
        }else{
            return Message.fail();
        }
    }

}
