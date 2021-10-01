package com.gg.itbook.modules.shelf;

import com.gg.itbook.modules.book.model.Book;

import java.util.List;

public interface ShelfService {
    public ShelfItem findShelfItem(int user_id,int book_id);
    public void addBookToShelf(int user_id,int book_id);
    public void removeBookFromShelf(int user_id,int book_id);
    public List<Book> findBooksByUserId(int user_id);
}
