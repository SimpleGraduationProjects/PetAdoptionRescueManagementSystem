package com.pets.mapper;

import com.pets.entity.Pet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 */
public interface PetMapper {

    /**
     * 新增的动物
     * @param pet 新增的动物
     * @return int
     * */
    int addPet(Pet pet);

    /**
     * 删除动物
     * @param id 动物的id
     * @return int
     * */
    int deletePet(Integer id);

    /**
     * 更新动物的信息
     * @param pet 更新的动物信息
     * @return int
     * */
    int updatePet(Pet pet);

    /**
     * 更新宠物领养救助的状态
     * @param pet 更新的宠物领养救助信息
     * @return int
     * */
    int updateState(Pet pet);
    /**
     * 查询所有的动物
     * @return list
     * */
    List<Pet> getPets();

    /**
     * 查询所有的动物
     * @param state 宠物领养救助现在的状态
     * @return list
     * */
    List<Pet> findByState(Integer state);

    /**
     * 根据动物id查询信息
     * @param id 用户id
     * @return pet
     * */
    Pet findById(Integer id);
    /**
     * 根据动物名查询用户信息
     * @param petType 宠物领养救助类型
     * @return pet
     * */
    List<Pet> findByPetType(String petType);

    /**
     * 批量删除
     * @param ids id的集合
     * */
    void deleteBatch(@Param("ids")List<Integer>ids);
}
