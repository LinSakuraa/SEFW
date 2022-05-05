package com.example.demo.mapper;


import com.example.demo.entity.Book;
import com.example.demo.entity.Borrowing;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;


@Mapper
public interface BorrowingMapper {

    ArrayList<Borrowing> select(Borrowing borrowing);
    Integer insert(Borrowing borrowing);
    Integer update(Borrowing borrowing);
    Book findBook(String bookID);
    void reduceNum(String bookID);
    void addNum(String bookID);

}
