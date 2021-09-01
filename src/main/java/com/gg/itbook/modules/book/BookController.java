package com.gg.itbook.modules.book;


import com.gg.itbook.common.auth.LoginInfo;
import com.gg.itbook.common.auth.MyLoginInfo;
import com.gg.itbook.common.auth.NeedAuth;
import com.gg.itbook.modules.book.dto.BuyRecordDTO;
import com.gg.itbook.modules.book.dto.ChapterInfoDTO;
import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.book.response.BuyChapterResponse;
import com.gg.itbook.modules.book.response.ChapterContentResponse;
import com.gg.itbook.modules.book.response.ChapterInfoResponse;
import com.gg.itbook.modules.book.service.BookService;
import com.gg.itbook.modules.user.vo.Coin;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/books")
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    ModelMapper modelMapper;
    @GetMapping("")
    public  List<Book> getBooksByCategory(@RequestParam int category) {
        List<Book> books = bookService.getBooksByCategory(category);
        return books;
    }

    @GetMapping("/{bookId}/chapters")
    public List<ChapterInfoResponse> getChaptersByBookId(@PathVariable int bookId)
    {
        return bookService.getChaptersByBookId(bookId).stream().map(chapter->modelMapper.map(chapter,ChapterInfoResponse.class)).collect(Collectors.toList());
    }

    @NeedAuth
    @GetMapping("/{bookId}/bought")
    public List<BuyRecordDTO> getBuyRecordByBookId(@PathVariable int bookId, @MyLoginInfo LoginInfo loginInfo) {
         return  bookService.getBuyRecordByBookId(loginInfo.getUserDTO().getId(), bookId);

    }

    @NeedAuth
    @PostMapping("/{book_id}/chapters/{chapter_id}")
    public BuyChapterResponse buyChapter(@PathVariable int book_id,@PathVariable int chapter_id,@MyLoginInfo LoginInfo loginInfo) {
        Coin coin =  bookService.buyChapter(loginInfo.getUserDTO().getId(),book_id,chapter_id);
        return new BuyChapterResponse(coin.getCoin());
    }


    @NeedAuth
    @GetMapping("/{book_id}/chapters/{chapter_id}")
    public ChapterContentResponse getChapterContent(@PathVariable int book_id,@PathVariable int chapter_id,@MyLoginInfo LoginInfo loginInfo) {

        return modelMapper.
                map(bookService.getChapterContent(loginInfo.getUserDTO().getId(),book_id,chapter_id),
                ChapterContentResponse.class);

    }

}

