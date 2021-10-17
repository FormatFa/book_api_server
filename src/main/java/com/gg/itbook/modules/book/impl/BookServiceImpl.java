package com.gg.itbook.modules.book.impl;

import com.gg.itbook.common.enums.CoinUseType;
import com.gg.itbook.common.exception.BalanceInSufficientException;
import com.gg.itbook.common.exception.BusinessException;
import com.gg.itbook.common.exception.EntityNotFoundException;
import com.gg.itbook.modules.book.dto.BuyRecordDTO;
import com.gg.itbook.modules.book.dto.ChapterInfoDTO;
import com.gg.itbook.modules.book.mapper.BookMapper;
import com.gg.itbook.modules.book.mapper.BuyRecordMapper;
import com.gg.itbook.modules.book.model.*;
import com.gg.itbook.modules.book.service.BookService;
import com.gg.itbook.modules.book.mapper.BookCategoryMapper;
import com.gg.itbook.modules.user.UserService;
import com.gg.itbook.modules.user.dto.LoginDTO;
import com.gg.itbook.modules.user.dto.UseCoinDTO;
import com.gg.itbook.modules.user.vo.Coin;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class BookServiceImpl implements BookService {
    private static final Log LOG = LogFactory.getLog(BookServiceImpl.class);
    @Autowired
    private BookCategoryMapper bookCategoryMapper;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BuyRecordMapper buyRecordMapper;
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserService userService;

    @Override
    public Book getBookById(int book_id) {
        return bookMapper.findBookById(book_id);
    }

    @Override
    public List<BookCategory> getAllCategories() {
        return bookCategoryMapper.getAllCategories();
    }

    @Override
    public List<Book> getBooksByCategory(int category) {
        return bookMapper.findBooksByCategory(category);
    }

    @Override
    public List<ChapterInfoDTO> getChaptersByBookId(int bookId) {
        List<Chapter> chapters  = bookMapper.findChaptersByBookId(bookId);
        return chapters.stream().map(chapter->modelMapper.map(chapter,ChapterInfoDTO.class)).collect(Collectors.toList());
    }

    @Override
    public List<ChapterInfoDTO> getUserChaptersByBookId(int user_id, int bookId) {
        List<UserChapter> chapters  = bookMapper.findUserChaptersByBookId(user_id, bookId);
        return chapters.stream().map(chapter->modelMapper.map(chapter,ChapterInfoDTO.class)).collect(Collectors.toList());
    }

    @Override
    public ChapterInfoDTO getChapterContent(int user_id, int book_id, int chapter_id) {

        Chapter chapter =  this.bookMapper.getChapterById(book_id,chapter_id);
        if(Objects.isNull(chapter)) {
            throw new EntityNotFoundException("chapter",String.valueOf(book_id)+"-"+String.valueOf(chapter_id));
        }
        ChapterInfoDTO info = modelMapper.map(chapter,ChapterInfoDTO.class);
        info.setLock(false);
        if(info.getPrice()>0) {
            BuyRecord buyRecord = buyRecordMapper.findBuyRecordByBookAndChapter(user_id, book_id, chapter_id);
            if (Objects.isNull(buyRecord)) {
//                throw new BusinessException("chapter is lock");
                info.setLock(true);
                info.setContent(null);
            }
        }
        if(!info.isLock()) {
            info.setContent(
                   Optional.ofNullable(bookMapper.getChapterContent(book_id,chapter_id)).map(
                           Content::getContent
                   ).orElse(null));
        }
        return info;
    }




//    TODO 分页处理
    @Override
    public List<BuyRecord> getBuyRecordByBookId(int user_id,int bookId) {
        return  buyRecordMapper.findBuyRecordByBookId(user_id,bookId);
    }

    @Override
    public List<BuyRecord> getUserBuyRecord(int user_id) {
        return buyRecordMapper.findUserBuyRecord(user_id);
    }


    @Transactional
    @Override
    public Coin buyChapter(int user_id, int book_id, int chapter_id) {

            BuyRecord buyRecord =  buyRecordMapper.findBuyRecordByBookAndChapter(user_id,book_id,chapter_id);
            if(!Objects.isNull(buyRecord)){
                throw new BusinessException("chapter had bought!");
            }
            LoginDTO login =  userService.findUserById(user_id);

            ChapterInfoDTO chapter = this.getChapterByChapterId(user_id,book_id,chapter_id);

            LOG.info(String.format("user %s , will buy book:%s:%s, cost:%s ",user_id,book_id,chapter,chapter.getPrice()));

            if(login.getCoin()<chapter.getPrice()){
                throw new BalanceInSufficientException(chapter.getPrice(), login.getCoin());
            }
            Book book = getBookById(book_id);
            UseCoinDTO useCoinDTO =  userService.useCoin(user_id,-chapter.getPrice(), CoinUseType.BUY_CHAPTER);
            String summary = String.format("%s-%s",book.getName(),chapter.getTitle());
            buyRecordMapper.addBuyRecord(new BuyRecord(user_id,book_id,chapter_id, Timestamp.from(Instant.now()),chapter.getPrice(),useCoinDTO.getBalance().getCoin(),summary));
            return  useCoinDTO.getBalance();

    }
    private ChapterInfoDTO getChapterByChapterId(int user_id, int book_id, int chapter_id) {
        List<ChapterInfoDTO> chapters =  getChaptersByBookId(book_id);
        ChapterInfoDTO chapter =  chapters.stream().filter(temp->temp.getChapter_id()==chapter_id).findFirst()
                .orElseThrow(()->new BusinessException(String.format("chapter %s for book %s not found",chapter_id,book_id)));
        return chapter;
    }

}
