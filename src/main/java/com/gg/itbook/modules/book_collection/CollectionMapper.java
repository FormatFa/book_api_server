package com.gg.itbook.modules.book_collection;

import com.gg.itbook.modules.book.model.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface CollectionMapper {
    List<Book> selectBookCollectionByName(String name);
}
