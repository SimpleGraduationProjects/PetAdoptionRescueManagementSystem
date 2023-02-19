package com.pets.controller;

import com.pets.entity.Admin;
import com.pets.service.AdminService;
import com.sun.javafx.collections.MappingChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * 登录控制器
 */
@RequestMapping("/admin/login")
@Controller
public class AdminLoginController {

    @Autowired
    private AdminService adminService;

    /**
     * 登录验证方法
     * @param admin
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("login.action")
    public Map<String,Object> login(Admin admin, HttpServletRequest request){
        Map<String, Object> ret = new HashMap<>();
        ret.put("type","error");
        if(StringUtils.isEmpty(admin.getAdminName())){
            ret.put("message","请填写账号");
            return ret;
        }
        if(StringUtils.isEmpty(admin.getAdminPwd())){
            ret.put("message","请填写密码");
            return ret;
        }
        Admin admin1 = adminService.loginAdmin(admin);
        if(admin1==null){
            ret.put("message","账号或密码错误");
            return ret;
        }
        request.getSession().setAttribute("admin",admin1);
        ret.put("type","success");
        ret.put("message","登录成功");
        return ret;
    }

}
