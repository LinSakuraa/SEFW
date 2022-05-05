package com.example.demo.controller;

import com.example.demo.entity.Book;
import com.example.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/index")
public class IndexController {

    @Autowired
    BookService bookService;

    @GetMapping
    public ArrayList<Book> recommend(String cusID) {
        return bookService.recommend(cusID);
    }
}
