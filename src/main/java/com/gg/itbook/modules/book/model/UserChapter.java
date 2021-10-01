package com.gg.itbook.modules.book.model;

// 保存有是否lock
public class UserChapter extends Chapter{
    private boolean lock;

    public boolean isLock() {
        return lock;
    }

    public void setLock(boolean lock) {
        this.lock = lock;
    }
}
