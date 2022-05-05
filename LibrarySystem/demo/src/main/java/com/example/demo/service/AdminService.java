package com.example.demo.service;

import com.example.demo.entity.Admin;
import com.example.demo.entity.Customer;
import com.example.demo.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public Integer save(Admin admin) {
        if(admin.getAdminID() != null) {
            return adminMapper.update(admin);
        } else {
            return 0;
        }
    }

    public Integer add(Admin admin) {
        if(admin.getAdminID() != null) {
            return adminMapper.insert(admin);
        } else {
            return 0;
        }
    }

    public ArrayList<Admin> find(Admin admin) {
        return adminMapper.select(admin);
    }

    public Integer login(Admin admin) {
        Admin adm = admin;
        //ArrayList<Customer> List = customerMapper.login(cus.getCusID());
        //if(List.isEmpty()) {
        //  return 0;
        //}
        //Customer cus1 = List.get(0);
        if(adm.getAdminID() == null) {
            return 0;
        }
        else
        {
            ArrayList<Admin> adm0=adminMapper.login(adm.getAdminID());
            if(adm0.isEmpty()) {
                return 0;
            }
            else
            {
                Admin adm1 =adm0.get(0);
                if(admin.getAdminPassword().equals(adm1.getAdminPassword())) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }

    }
}

