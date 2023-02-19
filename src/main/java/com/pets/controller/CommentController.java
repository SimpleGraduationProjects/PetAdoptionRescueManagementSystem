package com.pets.controller;

import com.pets.entity.Comment;
import com.pets.entity.Pet;
import com.pets.entity.Users;
import com.pets.service.CommentService;
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

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 评论控制器
 */
@Controller
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("comments.action")
    @ResponseBody
    public Message getComments(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        List<Comment> comments = commentService.getComments();
        PageInfo page=new PageInfo(comments,2);
        return Message.success().add("pageInfo",page);
    }

    @RequestMapping("comment.action")
    @ResponseBody
    public Message getComment(){
        List<Comment> comments = commentService.getComments();
        if(comments!=null){
            return Message.success().add("comment",comments);
        }else{
            return Message.fail();
        }

    }

    /**
     * 查看评论
     * @param pet_id
     * @return
     */
    @RequestMapping("petComments.action")
    @ResponseBody
    public Message getPetComment(Integer pet_id){
        List<Comment> comments = commentService.findByPetId(pet_id);
        if(comments!=null){
            return Message.success().add("comment",comments);
        }else{
            return Message.fail();
        }

    }

    /**
     * 添加评论
     * @param content
     * @param request
     * @return
     */
    @PostMapping("/add.action")
    @ResponseBody
    public Message addComment(String content, HttpServletRequest request){
        if(StringUtils.isEmpty(content)){
           return Message.error("请填写评论内容");
        }
        Comment comment=new Comment();
        Users user = (Users)request.getSession().getAttribute("user");
        Pet pet =(Pet) request.getSession().getAttribute("pet");
        comment.setUser(user);
        comment.setPet(pet);
        comment.setContent(content);
        comment.setCommentTime(new Date());
        if(commentService.addComment(comment)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 删除评论操作
     * @param id
     * @return
     */
    @RequestMapping("/delete.action")
    @ResponseBody
    public Message deleteComment(Integer id){
        try {
            commentService.deleteComment(id);
        }catch (Exception e){
            return Message.error("删除失败");
        }
        return Message.success();
    }

    @RequestMapping("/update.action")
    @ResponseBody
    public Message updateComment(Comment comment){
        if(commentService.updateComment(comment)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/findById.action")
    @ResponseBody
    public Message findById(Integer id){
        Comment comment1 = commentService.findById(id);
        if(comment1!=null){
            return Message.success().add("comment",comment1);
        }else{
            return Message.fail();
        }
    }


    @RequestMapping("/findByName.action")
    @ResponseBody
    public Message findByName(String name){
        PageHelper.startPage(1,4);
        List<Comment> comments = commentService.findByName(name);
        if(comments!=null){
            PageInfo page=new PageInfo(comments,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }
    }
}
