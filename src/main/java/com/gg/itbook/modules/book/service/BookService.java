package com.gg.itbook.modules.book.service;

import com.gg.itbook.modules.book.dto.BuyRecordDTO;
import com.gg.itbook.modules.book.dto.ChapterInfoDTO;
import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.model.BookCategory;
import com.gg.itbook.modules.user.vo.Coin;

import java.util.List;

public interface BookService {
    List<BookCategory> getAllCategories();
    List<Book> getBooksByCategory(int category);
    List<ChapterInfoDTO> getChaptersByBookId(int bookId);
    ChapterInfoDTO getChapterContent(int user_id,int book_id,int chapter_id);

    List<BuyRecordDTO> getBuyRecordByBookId(int user_id,int bookId);
    Coin buyChapter(int user_id, int book_id, int chapter_id);

}