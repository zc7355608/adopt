package com.it.adopt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.adopt.bean.Pet;
import com.it.adopt.mapper.PetMapper;
import com.it.adopt.service.PetService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetServiceImpl implements PetService {

    @Resource
    private PetMapper mapper;

    @Override
    public Pet findById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Pet> listAllPets(Integer pageNum, Integer pageSize) {
        //查之前开启分页
        PageHelper.startPage(pageNum, pageSize);
        //查询所有宠物信息
        List<Pet> pets = mapper.selectByState(Byte.valueOf((byte)0));
        //封装为PageInfo对象
        PageInfo<Pet> pageInfo = new PageInfo<>(pets, 3);
        return pageInfo;
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public List<Pet> findByType(String type) {
        return mapper.selectByPetType(type);
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(Pet pet) {
        return mapper.insert(pet);
    }

    @Override
    public int update(Pet pet) {
        return mapper.updateByPrimaryKey(pet);
    }
}
