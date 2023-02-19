package com.pets.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 */
@Controller
public class FileLoad {


    public static String load(MultipartFile file, HttpServletRequest request) {
        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            //1.设置文件存放物理路径，为当前工程目录下的../../img/upload
            ServletContext sc = request.getSession().getServletContext();
            String realPath = sc.getRealPath("/images/");
            file.transferTo(new File(realPath + picName + substring));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = picName + substring;

        return name;
    }
}
