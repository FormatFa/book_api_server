package com.gg.itbook.modules.book;


import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {
    @Autowired
    BookService bookService;
    @GetMapping("")
    public  List<Book> getBooksByCategory(@RequestParam int category) {
        List<Book> books = bookService.getBooksByCategory(category);
        return books;
    }



}
