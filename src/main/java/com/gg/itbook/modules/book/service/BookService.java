package com.gg.itbook.modules.book.service;

import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.model.BookCategory;

import java.util.List;

public interface BookService {
    List<BookCategory> getAllCategories();

    List<Book> getBooksByCategory(int category);
}