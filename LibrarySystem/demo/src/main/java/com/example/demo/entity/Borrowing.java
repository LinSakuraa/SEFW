package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //创建无参构造
@AllArgsConstructor //创建有参构造
public class Borrowing {

    private String bookID;
    private String cusID;
    private String adminID;
    private String borrowDate;
    private String returnDate;
    private Integer state;

}

