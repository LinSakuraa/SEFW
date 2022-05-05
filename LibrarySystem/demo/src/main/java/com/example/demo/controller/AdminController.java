package com.example.demo.controller;

import com.example.demo.entity.Admin;
import com.example.demo.mapper.AdminMapper;
import com.example.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private AdminService adminService;

    @PostMapping("/update")//更新
    public Integer save(@RequestBody Admin admin){
        return adminService.save(admin);
    }

    @PostMapping("/add")//新增
    public Integer add(@RequestBody Admin admin){
        return adminService.add(admin);
    }

    @GetMapping("/find")
    public ArrayList<Admin> find(Admin admin) {
        return adminService.find(admin);
    }

    @GetMapping("/delete")
    public Integer delete(String adminID){
        return adminMapper.deleteById(adminID);
    }

    @PostMapping( "/login")
    public Integer login(@RequestBody Admin admin) {
        return adminService.login(admin);
    }
}
