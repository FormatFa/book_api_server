package com.gg.itbook.modules.book.service;

import com.gg.itbook.modules.book.dto.BuyRecordDTO;
import com.gg.itbook.modules.book.dto.ChapterInfoDTO;
import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.model.BookCategory;
import com.gg.itbook.modules.book.model.BuyRecord;
import com.gg.itbook.modules.user.vo.Coin;

import java.util.List;

public interface BookService {
    Book getBookById(int book_id);
    List<BookCategory> getAllCategories();
    List<Book> getBooksByCategory(int category);
    List<ChapterInfoDTO> getChaptersByBookId(int bookId);
    List<ChapterInfoDTO> getUserChaptersByBookId(int user_id,int bookId);

    ChapterInfoDTO getChapterContent(int user_id,int book_id,int chapter_id);

    List<BuyRecord> getBuyRecordByBookId(int user_id, int bookId);
    List<BuyRecord> getUserBuyRecord(int user_id);
    Coin buyChapter(int user_id, int book_id, int chapter_id);

}