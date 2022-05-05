package com.example.demo.controller;

import com.example.demo.entity.Customer;
import com.example.demo.mapper.CustomerMapper;
import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private CustomerService customerService;

    @PostMapping("/update")//更新
    public Integer save(@RequestBody Customer customer){
        return customerService.save(customer);
    }

    @PostMapping("/add")//新增
    public Integer add(@RequestBody Customer customer){
        return customerService.add(customer);
    }

    @GetMapping("/find")//查找
    public ArrayList<Customer> find(Customer customer) {
        return customerService.find(customer);
    }

    @GetMapping("/delete")//删除
    public Integer delete(String cusID){
        return customerMapper.deleteById(cusID);
    }

    @PostMapping("/login")
    public Integer login(@RequestBody Customer customer) {
        return customerService.login(customer);
    }
}
