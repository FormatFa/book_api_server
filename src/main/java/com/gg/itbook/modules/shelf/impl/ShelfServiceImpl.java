package com.gg.itbook.modules.shelf.impl;

import com.gg.itbook.common.exception.EntityNotFoundException;
import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.shelf.ShelfItem;
import com.gg.itbook.modules.shelf.ShelfMapper;
import com.gg.itbook.modules.shelf.ShelfService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShelfServiceImpl implements ShelfService {
    private ShelfMapper shelfMapper;

    public ShelfServiceImpl(ShelfMapper shelfMapper) {
        this.shelfMapper = shelfMapper;
    }


    @Override
    public ShelfItem findShelfItem(int user_id, int book_id) {
        ShelfItem item =  shelfMapper.findShelfItem(user_id,book_id);
        if(item==null) {
            throw new EntityNotFoundException(ShelfItem.class.getCanonicalName(),String.valueOf(book_id));
        }
        return item;
    }

    @Override
    public void addBookToShelf(int user_id, int book_id) {
        shelfMapper.addBookToShelf(user_id, book_id);
    }

    @Override
    public void removeBookFromShelf(int user_id, int book_id) {
        shelfMapper.removeBookFromShelf(user_id,book_id);
    }

    @Override
    public List<Book> findBooksByUserId(int user_id) {
        return shelfMapper.findBooksByUserId(user_id);
    }
}
