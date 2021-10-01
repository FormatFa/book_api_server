package com.gg.itbook.modules.shelf;

import com.gg.itbook.modules.book.model.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShelfMapper {
    public List<Book> findBooksByUserId(int user_id);
    public void addBookToShelf(int user_id,int book_id);
    public void removeBookFromShelf(int user_id,int book_id);
    public ShelfItem findShelfItem(int user_id,int book_id);
}
