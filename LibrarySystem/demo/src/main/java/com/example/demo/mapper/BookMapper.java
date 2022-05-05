package com.example.demo.mapper;

import com.example.demo.entity.Book;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface BookMapper {

    ArrayList<Book> select(Book book);
    Integer insert(Book book);
    Integer update(Book book);
    Integer deleteById(String bookID);
    ArrayList<Book> recommendById(String cusID);
    //Book find_b(String bookID);
    ArrayList<Book> recommendByID_new();
    //void jian_kucun(String bookID);
}
