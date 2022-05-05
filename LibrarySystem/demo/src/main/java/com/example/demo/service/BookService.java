package com.example.demo.service;

import com.example.demo.entity.Book;
import com.example.demo.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public Integer save(Book book) {
        if(book.getBookID() != null) {
            return bookMapper.update(book);
        } else {
            return 0;
        }
    }

    public Integer add(Book book) {
        if(book.getBookID() != null) {
            return bookMapper.insert(book);
        } else {
            return 0;
        }
    }

    public ArrayList<Book> find(Book book) {
        return bookMapper.select(book);
    }
    public ArrayList<Book> recommend(String cusID) {

        ArrayList<Book> books = bookMapper.recommendById(cusID);
        if(books.isEmpty()) {
            books=bookMapper.recommendByID_new();
        }
        return books;
    }
}
