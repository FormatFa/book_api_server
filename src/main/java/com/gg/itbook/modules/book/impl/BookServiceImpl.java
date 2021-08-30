package com.gg.itbook.modules.book.impl;

import com.gg.itbook.modules.book.mapper.BookMapper;
import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.service.BookService;
import com.gg.itbook.modules.book.mapper.BookCategoryMapper;
import com.gg.itbook.modules.book.model.BookCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookCategoryMapper bookCategoryMapper;
    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<BookCategory> getAllCategories() {
        return bookCategoryMapper.getAllCategories();
    }

    @Override
    public List<Book> getBooksByCategory(int category) {
        return bookMapper.findBooksByCategory(category);
    }

}
