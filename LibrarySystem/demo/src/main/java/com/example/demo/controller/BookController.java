package com.example.demo.controller;

import com.example.demo.entity.Book;
import com.example.demo.mapper.BookMapper;
import com.example.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BookService bookService;

    @PostMapping("/update")//更新
    public Integer save(@RequestBody Book book){
        return bookService.save(book);
    }

    @PostMapping("/add")//新增
    public Integer add(@RequestBody Book book){
        return bookService.add(book);
    }

    @GetMapping("/find")
    public ArrayList<Book> find(Book book) {
        return bookService.find(book);
    }

    @GetMapping("/delete")
    public Integer delete(String bookID){
       return bookMapper.deleteById(bookID);
    }

}
