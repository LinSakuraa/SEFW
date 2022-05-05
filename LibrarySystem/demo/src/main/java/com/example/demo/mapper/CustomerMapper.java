package com.example.demo.mapper;

import com.example.demo.entity.Customer;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CustomerMapper {

    ArrayList<Customer> select(Customer customer);
    Integer insert(Customer customer);
    Integer update(Customer customer);
    Integer deleteById(String cusID);
    ArrayList<Customer> login(String cusID);
}
