package com.gg.itbook.modules.book.response;

public class ChapterInfoResponse {
    private Long book_id;
    private Long chapter_id;
    private int price;
    private boolean lock;

    public boolean isLock() {
        return lock;
    }

    public void setLock(boolean lock) {
        this.lock = lock;
    }

    public ChapterInfoResponse() {
    }

    public ChapterInfoResponse(Long book_id, Long chapter_id, int price) {
        this.book_id = book_id;
        this.chapter_id = chapter_id;
        this.price = price;
    }

    public Long getBook_id() {
        return book_id;
    }

    public void setBook_id(Long book_id) {
        this.book_id = book_id;
    }

    public Long getChapter_id() {
        return chapter_id;
    }

    public void setChapter_id(Long chapter_id) {
        this.chapter_id = chapter_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}


