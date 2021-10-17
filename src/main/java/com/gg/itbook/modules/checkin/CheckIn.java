package com.gg.itbook.modules.checkin;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class CheckIn {
    public int getUser_id() {
        return user_id;
    }

    public CheckIn(int user_id, LocalDateTime last_check_time, int total) {
        this.user_id = user_id;
        this.last_check_time = last_check_time;
        this.total = total;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public LocalDateTime getLast_check_time() {
        return last_check_time;
    }

    public void setLast_check_time(LocalDateTime last_check_time) {
        this.last_check_time = last_check_time;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    // TODO 移动到可配置的
    public int getReward() {
        if(total>7){
            return 35;
        }
        return  (total+1)*5;
    }
    public boolean isTodayCheckIn(LocalDate localDate) {
        return this.getLast_check_time().toLocalDate().equals(localDate);

    }
    // now 相对于是不是连续的
    public boolean isContinueDay(LocalDate now) {
        return this.getLast_check_time().toLocalDate().plusDays(1).equals(now);
    }

    private int user_id;
    private LocalDateTime last_check_time;
    private int total;

}
