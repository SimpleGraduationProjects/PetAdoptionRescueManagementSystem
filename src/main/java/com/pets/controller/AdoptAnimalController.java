package com.pets.controller;

import com.pets.entity.AdoptAnimal;
import com.pets.entity.Pet;
import com.pets.entity.Users;
import com.pets.service.AdoptAnimalService;
import com.pets.service.PetService;
import com.pets.service.UsersService;
import com.pets.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 */
@Controller
@RequestMapping("adopt")
public class AdoptAnimalController {

    @Autowired
    private AdoptAnimalService animalService;

    @Autowired
    private PetService petService;

    @Autowired
    private UsersService usersService;

    @RequestMapping("adopts.action")
    @ResponseBody
    public Message getAdoptAnimals(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        AdoptAnimal animal=new AdoptAnimal();
        List<AdoptAnimal> adoptAnimals = animalService.findByState(1);
        PageInfo page=new PageInfo(adoptAnimals,2);
        return Message.success().add("pageInfo",page);
    }


    /**
     * 同意列表操作
     * @param pn
     * @return
     */
    @RequestMapping("ByAgree.action")
    @ResponseBody
    public Message getAdoptStates(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,10);
        int state=2;
        List<AdoptAnimal> adoptAnimals = animalService.findByState(state);
        PageInfo page=new PageInfo(adoptAnimals,2);
        return Message.success().add("pageInfo",page);
    }

    /**
     * 不同意列表操作
     * @param pn
     * @return
     */
    @RequestMapping("ByDisAgree.action")
    @ResponseBody
    public Message getAdoptDisagress(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,10);
        int state=0;
        List<AdoptAnimal> adoptAnimals = animalService.findByState(state);
        PageInfo page=new PageInfo(adoptAnimals,2);
        return Message.success().add("pageInfo",page);
    }

    /**
     * 添加申请信息
     * @param request
     * @return
     */
    @RequestMapping("add.action")
    @ResponseBody
    public Message createAdopt(HttpServletRequest request){
        Pet pet = (Pet)request.getSession().getAttribute("pet");
        Users user = (Users)request.getSession().getAttribute("user");
        pet.setState(1);
        AdoptAnimal animal=new AdoptAnimal();
        animal.setUser(user);
        animal.setPet(pet);
        animal.setState(1);
        animal.setAdoptTime(new Date());
        int i = animalService.addAdoptAnimal(animal);
        int t=petService.updateState(pet);
        if(i>0&&t>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteAdopt(Integer id){
        if(animalService.deleteAdoptAnimal(id)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("update.action")
    @ResponseBody
    public Message updateAdoptAnimal(AdoptAnimal animal){
        if(animalService.updateAdoptAnimal(animal)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 不同意操作
     * @param id
     * @return
     * @throws MessagingException
     */
    @RequestMapping(value = "disAgree.action", method = RequestMethod.GET)
    @ResponseBody
    public Message updateAdoptState(Integer id) throws MessagingException {
        AdoptAnimal animal = animalService.findById(id);
        animal.setState(0);
        Pet pet = animal.getPet();
        pet.setState(0);
        int i = animalService.updateAdoptState(animal);
        int t=petService.updateState(pet);
        if(i>0&&t>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    /**
     * 同意操作
     * @param id
     * @return
     * @throws MessagingException
     */
    @RequestMapping(value = "agree.action",method = RequestMethod.GET)
    @ResponseBody
    public Message updateAdoptStates(Integer id) throws MessagingException {
        AdoptAnimal animal = animalService.findById(id);
        animal.setState(2);
        Pet pet = animal.getPet();
        pet.setState(2);
        int a = animalService.updateAdoptState(animal);
        int b=petService.updateState(pet);
        if(a>0&&b>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id){
        AdoptAnimal animal = animalService.findById(id);
        if(animal!=null){
            return Message.success().add("animal",animal);
        }else{
            return Message.fail();
        }
    }

    /**
     * 根据领养时间查询
     * @param adoptTime
     * @return
     * @throws ParseException
     */
    @RequestMapping("findByAdoptTime.action")
    @ResponseBody
    public Message findByAdoptTime(String adoptTime) throws ParseException {
        PageHelper.startPage(1,4);
        List<AdoptAnimal> adoptAnimals = animalService.findByAdoptTime(adoptTime);
        if(adoptAnimals!=null){
            PageInfo page=new PageInfo(adoptAnimals,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }

    @RequestMapping("findByName.action")
    @ResponseBody
    public Message findByName(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "userName") String userName,@RequestParam(value = "state") Integer state) throws ParseException {
        PageHelper.startPage(1,4);
        List<Users> users = usersService.findByName(userName);
        List<AdoptAnimal> adoptAnimals = animalService.findByName(users,state);
        if(adoptAnimals!=null){
            PageInfo page=new PageInfo(adoptAnimals,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }
}
