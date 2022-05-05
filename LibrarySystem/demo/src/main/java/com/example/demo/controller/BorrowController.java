package com.example.demo.controller;


import com.example.demo.entity.Borrowing;
import com.example.demo.service.BorrowingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/borrow")
public class BorrowController {

    @Autowired
    private BorrowingService borrowingService;
    @PostMapping("/add")//新增
    public Integer add(@RequestBody Borrowing borrowing){
        return borrowingService.add(borrowing);
    }

    @GetMapping("/find")
    public ArrayList<Borrowing> find(Borrowing borrowing) {
        return borrowingService.find(borrowing);
    }

    @PostMapping("/update")//更新
    public Integer save(@RequestBody Borrowing borrowing){
        return borrowingService.save(borrowing);
    }

}
