package com.gg.itbook.modules.book.mapper;

import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.model.Chapter;
import com.gg.itbook.modules.book.model.Content;
import com.gg.itbook.modules.book.model.UserChapter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookMapper {
    Book findBookById(int book_id);
    List<Book> findBooksByCategory(int category);
    List<Chapter> findChaptersByBookId(int bookId);
    List<UserChapter> findUserChaptersByBookId(int user_id, int book_id);
    Chapter getChapterById(int book_id,int chapter_id);
    Content getChapterContent(@Param("book_id") int book_id,@Param("chapter_id") int chapter_id);
}
