package com.gg.itbook.modules.book_collection;

import com.gg.itbook.modules.book.model.Book;

import java.util.List;

public interface BookCollectionService {
    List<Book> getCollectionByName(String name);
}
