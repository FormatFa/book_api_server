package com.gg.itbook.modules.book;


import com.gg.itbook.modules.book.model.BookCategory;
import com.gg.itbook.modules.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CategoryController {
    @Autowired
    BookService bookService;

    @GetMapping("/categories")
    public List<BookCategory> getCategories() {
        return bookService.getAllCategories();
    }
}
