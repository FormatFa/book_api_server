package com.gg.itbook.modules.book.model;

import java.sql.Timestamp;

/**
 * oumai1 jilu
 */
public class BuyRecord {
    private int user_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    private int book_id;
    private int chapter_id;
    private Timestamp buy_time;
    private int cost;
    private int balance;

    public BuyRecord( int user_id, int book_id, int chapter_id, Timestamp buy_time, int cost, int balance) {

        this.user_id = user_id;
        this.book_id = book_id;
        this.chapter_id = chapter_id;
        this.buy_time = buy_time;
        this.cost = cost;
        this.balance = balance;
    }


    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getChapter_id() {
        return chapter_id;
    }

    public void setChapter_id(int chapter_id) {
        this.chapter_id = chapter_id;
    }

    public Timestamp getBuy_time() {
        return buy_time;
    }

    public void setBuy_time(Timestamp buy_time) {
        this.buy_time = buy_time;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public BuyRecord() {

    }
}
