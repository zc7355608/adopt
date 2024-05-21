package com.it.adopt.mapper;

import com.it.adopt.bean.Pet;
import java.util.List;

public interface PetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Pet row);

    Pet selectByPrimaryKey(Integer id);

    List<Pet> selectByPetType(String type);

    List<Pet> selectByState(Byte state);

    List<Pet> selectAll();
    int count();

    int updateByPrimaryKey(Pet row);
}