package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //创建无参构造
@AllArgsConstructor //创建有参构造
public class Book {

    private String bookID;
    private String bookName;
    private String bookPublisher;
    private String bookAuthorName;
    private Float price;
    private String type;
    private Integer num;

}
