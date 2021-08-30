package com.gg.itbook.modules.book.mapper;

import com.gg.itbook.modules.book.model.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
    List<Book> findBooksByCategory(int category);
}
