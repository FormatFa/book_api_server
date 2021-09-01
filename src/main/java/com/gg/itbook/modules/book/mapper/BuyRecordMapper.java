package com.gg.itbook.modules.book.mapper;

import com.gg.itbook.modules.book.model.BuyRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BuyRecordMapper {

    List<BuyRecord> findBuyRecordByBookId(@Param("user_id") int user_id, @Param("book_id") int book_id);
    BuyRecord findBuyRecordByBookAndChapter(@Param("user_id") int user_id, @Param("book_id") int book_id,@Param("chapter_id" ) int chapter_id);
    void addBuyRecord(BuyRecord buyRecord);
}
