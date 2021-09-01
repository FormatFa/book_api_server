package com.gg.itbook.modules.book.response;

public class ChapterContentResponse extends ChapterInfoResponse{
    private String content;

    public ChapterContentResponse(Long book_id, Long chapter_id, int price) {
        super(book_id, chapter_id, price);
    }

    public ChapterContentResponse() {
        super();
    }

    public ChapterContentResponse(Long book_id, Long chapter_id, int price, String content) {
        super(book_id,chapter_id,price);
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
