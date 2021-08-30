package com.gg.itbook.modules.book.mapper;

import com.gg.itbook.modules.book.model.BookCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookCategoryMapper {
    List<BookCategory> getAllCategories();
}
