package com.gg.itbook.modules.book.model;

public class BookTag {
    private int id;
    private int book_id;
    private String tag;

    public BookTag() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }
}
