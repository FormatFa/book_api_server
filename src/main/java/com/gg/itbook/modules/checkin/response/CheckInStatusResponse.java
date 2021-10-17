package com.gg.itbook.modules.checkin.response;

public class CheckInStatusResponse {
    private long last_check_time;
    private int total;
    private int reward;

    public long getLast_check_time() {
        return last_check_time;
    }

    public void setLast_check_time(long last_check_time) {
        this.last_check_time = last_check_time;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getReward() {
        return reward;
    }

    public void setReward(int reward) {
        this.reward = reward;
    }
}
