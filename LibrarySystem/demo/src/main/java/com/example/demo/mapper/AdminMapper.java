package com.example.demo.mapper;

import com.example.demo.entity.Admin;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface AdminMapper {

    ArrayList<Admin> select(Admin admin);

    Integer insert(Admin admin);

    Integer update(Admin admin);

    Integer deleteById(String AdminID);

    ArrayList<Admin> login(String adminID);
}
