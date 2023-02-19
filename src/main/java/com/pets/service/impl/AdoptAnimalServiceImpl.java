package com.pets.service.impl;

import com.pets.entity.AdoptAnimal;
import com.pets.entity.Users;
import com.pets.mapper.AdoptAnimalMapper;
import com.pets.mapper.UsersMapper;
import com.pets.service.AdoptAnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.util.List;

/**
 */
@Service
public class AdoptAnimalServiceImpl implements AdoptAnimalService {

    @Autowired
    private AdoptAnimalMapper adoptAnimalMapper;

    @Autowired
    private UsersMapper usersMapper;
    @Override
    public int addAdoptAnimal(AdoptAnimal animal) {
        int i = adoptAnimalMapper.addAdoptAnimal(animal);
        return i;
    }

    @Override
    public int deleteAdoptAnimal(Integer id) {
        int i = adoptAnimalMapper.deleteAdoptAnimal(id);
        return i;
    }

    @Override
    public int updateAdoptAnimal(AdoptAnimal animal) {
        int i = adoptAnimalMapper.updateAdoptAnimal(animal);
        return i;
    }

    @Override
    public int updateAdoptState(AdoptAnimal adopt) throws MessagingException {
        String email = adopt.getUser().getEmail();
        int state=adopt.getState();
//        MailUtil.sendMail(email,state);
        int i = adoptAnimalMapper.updateAdoptState(adopt);
        return i;
    }

    @Override
    public void updateRelationUser(Integer user_id) {
        adoptAnimalMapper.updateRelationUser(user_id);
    }

    @Override
    public void updateRelationPet(Integer pet_id) {
        adoptAnimalMapper.updateRelationPet(pet_id);
    }

    @Override
    public List<AdoptAnimal> getAdoptAnimals() {
        List<AdoptAnimal> adoptAnimals = adoptAnimalMapper.getAdoptAnimals();
        return adoptAnimals;
    }

    @Override
    public List<AdoptAnimal> findByState(Integer state) {
        List<AdoptAnimal> byState = adoptAnimalMapper.findByState(state);
        return byState;
    }

    @Override
    public AdoptAnimal findById(Integer id) {
        AdoptAnimal byId = adoptAnimalMapper.findById(id);
        return byId;
    }

    @Override
    public List<AdoptAnimal> findByAdoptTime(String adoptTime) {
        List<AdoptAnimal> byAdoptTime = adoptAnimalMapper.findByAdoptTime(adoptTime);
        return byAdoptTime;
    }

    @Override
    public List<AdoptAnimal> findByName(List<Users> users,Integer state) {
        List<AdoptAnimal> byName = adoptAnimalMapper.findByName(users,state);
        return byName;
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        adoptAnimalMapper.deleteBatch(ids);
    }

    @Override
    public List<AdoptAnimal> findByUserId(Integer userId) {
        return adoptAnimalMapper.findByUserId(userId);
    }
}
