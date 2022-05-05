package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //创建无参构造
@AllArgsConstructor //创建有参构造
public class Customer {

    private String cusID;
    private String cusName;
    private Integer cusAge;
    private String cusSex;
    private String cusPhoneNumber;
    private String cusPassword;

}
