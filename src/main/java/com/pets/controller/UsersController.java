package com.pets.controller;

import com.pets.entity.AdoptAnimal;
import com.pets.entity.Users;
import com.pets.service.AdoptAnimalService;
import com.pets.service.UsersService;
import com.pets.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户信息控制器
 */
@Controller
@RequestMapping("user")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private AdoptAnimalService adoptAnimalService;

    @RequestMapping("users.action")
    @ResponseBody
    public Message getUsers(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,10);
        List<Users> users = usersService.getUsers();
        System.out.println(users);
        PageInfo page=new PageInfo(users,2);
        return Message.success().add("pageInfo",page);
    }

    /**
     * 用户添加信息
     * @param users
     * @return
     */
    @RequestMapping("add.action")
    @ResponseBody
    public Message add(Users users){
        if(StringUtils.isEmpty(users.getUserName())){
            return Message.error("请填写用户名");
        }
        if(StringUtils.isEmpty(users.getPassword())){
            return Message.error("请填写密码");
        }
        if(StringUtils.isEmpty(users.getTelephone())){
            return Message.error("请填写手机号");
        }
        if(StringUtils.isEmpty(users.getEmail())){
            return Message.error("请填写邮箱");
        }
        if(usersService.findByUserName(users.getUserName())!=null){
            return Message.error("用户名已存在");
        }
        if(usersService.addUser(users)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 删除用户信息
     * @param id
     * @return
     */
    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteUsers(Integer id){
        if(usersService.deleteUser(id)<=0){
            return Message.fail();
        }else{
            return Message.success();
        }
    }

    /***
     * 修改用户信息操作
     * @param users
     * @param request
     * @return
     */
    @RequestMapping("edit.action")
    @ResponseBody
    public Message editUser(Users users,HttpServletRequest request){
        if(StringUtils.isEmpty(users.getUserName())){
            return Message.error("请填写用户名");
        }
        if(StringUtils.isEmpty(users.getPassword())){
            return Message.error("请填写密码");
        }
        if(StringUtils.isEmpty(users.getTelephone())){
            return Message.error("请填写手机号");
        }
        if(StringUtils.isEmpty(users.getEmail())){
            return Message.error("请填写邮箱");
        }
        Users byUserName = usersService.findByUserName(users.getUserName());
        if(byUserName!=null){
            if(!byUserName.getId().equals(users.getId())){
                return Message.error("用户名已存在");
            }
        }
        if(usersService.updateUser(users)>0){
            Users user=usersService.findById(users.getId());
            request.getSession().setAttribute("user",user);
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("updatePic.action")
    @ResponseBody
    public Message updatePic(MultipartFile file,HttpServletRequest request){
        Users user=(Users) request.getSession().getAttribute("user");
        if(file!=null){
            String load = FileLoad.load(file,request);
            user.setPic(load);
        }
        if(usersService.updateUser(user)>0){
            Users users = usersService.findById(user.getId());
            request.getSession().setAttribute("user",users);
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 根据用户id查询用户
     * @param id
     * @return
     */
    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id){
        Users user = usersService.findById(id);
        if(user!=null){
            return Message.success().add("user",user);
        }else{
            return Message.fail();
        }
    }


    /**
     * 根据用户名查询
     * @param userName
     * @param pn
     * @return
     */
    @RequestMapping("findByName.action")
    @ResponseBody
    public Message findByName(String userName,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        List<Users> users = usersService.findByName(userName);
        if(users!=null){
            PageInfo page=new PageInfo(users,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }
    }


    /**
     * 登录操作功能
     * @param users
     * @param request
     * @return
     */
    @RequestMapping("login.action")
    @ResponseBody
    public Message login(Users users, HttpServletRequest request){
        if(StringUtils.isEmpty(users.getUserName())){
            return Message.error("请填写账号");
        }
        if(StringUtils.isEmpty(users.getPassword())){
            return Message.error("请填写密码");
        }
        Users user = usersService.loginUser(users);
        if(user!=null){
            request.getSession().setAttribute("user",user);
            List<AdoptAnimal> adoptAnimalsList = adoptAnimalService.findByUserId(user.getId());
            request.getSession().setAttribute("adoptRecordList",adoptAnimalsList);
            return Message.success().add("user",user);
        }else{
            return Message.error("该账号还没注册,请先去注册");
        }
    }

    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping("logout.action")
    @ResponseBody
    public Message logout(HttpServletRequest request){
        request.getSession().invalidate();
        return Message.success();
    }

}
