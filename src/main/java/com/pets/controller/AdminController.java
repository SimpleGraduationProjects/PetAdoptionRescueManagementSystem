package com.pets.controller;

import com.pets.entity.Admin;
import com.pets.service.AdminService;
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
import java.text.ParseException;
import java.util.List;

/**
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;


    @RequestMapping("admins.action")
    @ResponseBody
    public Message getAdmins(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);
        List<Admin> admins = adminService.getAdmins();
        // startPage后面紧跟的这个查询就是一个分页查询
        System.out.println(admins+"admins");
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page=new PageInfo(admins,2);
        return Message.success().add("pageInfo",page);
    }

    /**
     * 用户添加操作
     * @param admin
     * @return
     */
    @RequestMapping("add.action")
    @ResponseBody
    public Message addAdmin(Admin admin){
        if(StringUtils.isEmpty(admin.getAdminName())){
            return Message.error("请填写账号");
        }
        if(StringUtils.isEmpty(admin.getAdminPwd())){
            return Message.error("请填写密码");
        }
        if(StringUtils.isEmpty(admin.getTelephone())){
            return Message.error("请填写手机号");
        }
        if(StringUtils.isEmpty(admin.getEmail())){
            return Message.error("请填写邮箱");
        }
        if(StringUtils.isEmpty(admin.getRealName())){
            return Message.error("请填写真实姓名");
        }
        if(StringUtils.isEmpty(admin.getBirthday())){
            return Message.error("请选择生日");
        }
        if(adminService.findByAdminName(admin.getAdminName())!=null){
            return Message.error("该账号已存在");
        }
        int i = adminService.addAdmin(admin);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 管理员删除操作
     * @param id
     * @return
     */
    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteAdmin(Integer id){
        int i = adminService.deleteAdmin(id);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }


    /**
     * 管理员更新信息
     * @param admin
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("edit.action")
    @ResponseBody
    public Message editAdmin(Admin admin,MultipartFile file, HttpServletRequest request){
        if(StringUtils.isEmpty(admin.getAdminName())){
            return Message.error("请填写账号");
        }
        if(StringUtils.isEmpty(admin.getAdminPwd())){
            return Message.error("请填写密码");
        }
        if(StringUtils.isEmpty(admin.getTelephone())){
            return Message.error("请填写手机号");
        }
        if(StringUtils.isEmpty(admin.getEmail())){
            return Message.error("请填写邮箱");
        }
        if(StringUtils.isEmpty(admin.getRealName())){
            return Message.error("请填写真实姓名");
        }
        if(StringUtils.isEmpty(admin.getBirthday())){
            return Message.error("请选择生日");
        }
        Admin byAdminName = adminService.findByAdminName(admin.getAdminName());
        if(byAdminName!=null){
            if(!byAdminName.getId().equals(admin.getId())){
                return Message.error("该账号已存在");
            }
        }
        int i = adminService.updateAdmin(admin);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 根据id查询管理员信息
     * @param id
     * @return
     * @throws ParseException
     */
    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id) throws ParseException {
        Admin admin = adminService.findById(id);
        if(admin!=null){
            return Message.success().add("admin",admin);
        }else{
            return Message.fail();
        }
    }
    @RequestMapping("/findByName.action")
    @ResponseBody
    public Message findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,String adminName){
        PageHelper.startPage(pn,4);
        List<Admin> admins = adminService.findByName(adminName);
        if(admins!=null){
            PageInfo page = new PageInfo(admins,2);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }


    @RequestMapping("logout.action")
    public String logout(){
        return "admin/login";
    }

}
