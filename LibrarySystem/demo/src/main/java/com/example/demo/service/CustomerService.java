package com.example.demo.service;

import com.example.demo.entity.Customer;
import com.example.demo.mapper.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    public Integer save(Customer customer) {
        if(customer.getCusID() != null) {
            return customerMapper.update(customer);
        } else {
            return 0;
        }
    }

    public Integer add(Customer customer) {
        if(customer.getCusID() != null) {
            return customerMapper.insert(customer);
        } else {
            return 0;
        }
    }

    public ArrayList<Customer> find(Customer customer) {
        return customerMapper.select(customer);
    }

    public Integer login(Customer customer) {
        Customer cus = customer;
        //ArrayList<Customer> List = customerMapper.login(cus.getCusID());
        //if(List.isEmpty()) {
          //  return 0;
        //}
        //Customer cus1 = List.get(0);
        if(cus.getCusID() == null) {
            return 0;
        }
        else
        {
            ArrayList<Customer> cus0=customerMapper.login(cus.getCusID());
            if(cus0.isEmpty()) {
                return 0;
            }
            else
            {
                Customer cus1 = cus0.get(0);
                if(customer.getCusPassword().equals(cus1.getCusPassword())) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }

    }
}
