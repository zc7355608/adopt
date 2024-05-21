package com.it.adopt.service;

import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Pet;

import java.util.List;

public interface PetService {
//    PageInfo<Pet> pets(Integer pageNum, Integer pagesize);
    Pet findById(Integer id);
//    Integer create(Pet pet);
    PageInfo<Pet> listAllPets(Integer pageNum, Integer pageSize);
    int count();

    List<Pet> findByType(String type);

    int deleteById(Integer id);
    int add(Pet pet);
    int update(Pet pet);
//    int del(Integer id);
}
