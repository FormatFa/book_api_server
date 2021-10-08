package com.gg.itbook.modules.book_collection;

import com.gg.itbook.modules.book.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookCollectionServiceImpl implements BookCollectionService{
    @Autowired
    private CollectionMapper collectionMapper;
//    TODO cache?
    @Override
    public List<Book> getCollectionByName(String name) {

        return collectionMapper.selectBookCollectionByName(name);
    }
}
