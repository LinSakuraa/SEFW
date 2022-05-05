package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //创建无参构造
@AllArgsConstructor //创建有参构造
public class Admin {

    private String adminID;
    private String adminName;
    private Integer adminAge;
    private String adminPhoneNumber;
    private String adminType;
    private String adminPassword;

}
