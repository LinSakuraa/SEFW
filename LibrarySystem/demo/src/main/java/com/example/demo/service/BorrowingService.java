package com.example.demo.service;

import com.example.demo.entity.Book;
import com.example.demo.entity.Borrowing;
import com.example.demo.mapper.BorrowingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BorrowingService {

    @Autowired
    private BorrowingMapper borrowingMapper;

    public Integer add(Borrowing borrowing) {
        if (borrowing.getBookID() != null) {
            String bookID = borrowing.getBookID();
            Book bookNum;
            bookNum = borrowingMapper.findBook(bookID);
            if (bookNum.getNum() > 0) {
                borrowingMapper.reduceNum(bookID);
                return borrowingMapper.insert(borrowing);
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    public ArrayList<Borrowing> find(Borrowing borrowing) {
        return borrowingMapper.select(borrowing);
    }

    public Integer save(Borrowing borrowing) {
        if(borrowing.getBookID() != null) {
            String bookID = borrowing.getBookID();
            borrowingMapper.addNum(bookID);
            return borrowingMapper.update(borrowing);
        } else {
            return 0;
        }
    }
}