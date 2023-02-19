package com.pets.controller;

import com.pets.entity.Blog;
import com.pets.service.BlogService;
import com.pets.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.List;

/**
 * 活动管理控制器
 */
@Controller
@RequestMapping("blog")
public class BlogController {

    @Autowired
    private BlogService blogService;


    @RequestMapping("blogs.action")
    @ResponseBody
    public Message getBlog(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);
        List<Blog> blogs = blogService.getBlogs();
        // startPage后面紧跟的这个查询就是一个分页查询
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page=new PageInfo(blogs,2);
        return Message.success().add("pageInfo",page);
    }

    /**
    * 这是传给前端的数据
    * */
    @RequestMapping("blog.action")
    public String getBlogs(ModelAndView modelAndView){
        List<Blog> blogs = blogService.getBlogs();
        modelAndView.addObject("blogs",blogs);
        return "blog";
    }

    /**
     * 添加活动信息
     * @param blog
     * @return
     */
    @RequestMapping("add.action")
    @ResponseBody
    public Message addBlog(Blog blog){
        if(StringUtils.isEmpty(blog.getTitle())){
            return Message.error("请填写活动标题");
        }
        if(StringUtils.isEmpty(blog.getActionTime())){
            return Message.error("请填写活动时间");
        }
        if(StringUtils.isEmpty(blog.getAddress())){
            return Message.error("请填写活动地址");
        }
        if(StringUtils.isEmpty(blog.getEvent())){
            return Message.error("请填写活动介绍");
        }
        if(StringUtils.isEmpty(blog.getPeoples())){
            return Message.error("请填写活动适合人群");
        }
        int i = blogService.addBlog(blog);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 删除活动信息
     * @param id
     * @return
     */
    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteBlog(Integer id){
        try {
            int i = blogService.deleteBlog(id);
        }catch (Exception e){
            return Message.error("删除失败,该活动已经有人申请,不可删除");
        }
        return Message.success();
    }

    /**
     * 更新活动信息
     * @param blog
     * @return
     */
    @RequestMapping("edit.action")
    @ResponseBody
    public Message editBlog(Blog blog){
        if(StringUtils.isEmpty(blog.getTitle())){
            return Message.error("请填写活动标题");
        }
        if(StringUtils.isEmpty(blog.getActionTime())){
            return Message.error("请填写活动时间");
        }
        if(StringUtils.isEmpty(blog.getAddress())){
            return Message.error("请填写活动地址");
        }
        if(StringUtils.isEmpty(blog.getEvent())){
            return Message.error("请填写活动介绍");
        }
        if(StringUtils.isEmpty(blog.getPeoples())){
            return Message.error("请填写活动适合人群");
        }
        if(blogService.updateBlog(blog)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 根据id查询活动信息
     * @param id
     * @return
     */
    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id){
        Blog blog = blogService.findById(id);
        if(blog!=null){
            return Message.success().add("blog",blog);
        }else{
            return Message.fail();
        }

    }

    /**
     * 根据活动时间查询活动信息
     * @param pn
     * @param actionTime
     * @return
     * @throws ParseException
     */
    @RequestMapping("findByTime.action")
    @ResponseBody
    public Message findByTime(@RequestParam(value = "pn",defaultValue = "1") Integer pn,@RequestParam("actionTime") String actionTime) throws ParseException {
        PageHelper.startPage(pn,4);
        List<Blog> blog= blogService.findByTime(actionTime);
        if(blog!=null){
            PageInfo page=new PageInfo(blog,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }

}
