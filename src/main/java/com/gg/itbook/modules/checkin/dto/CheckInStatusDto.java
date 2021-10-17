package com.gg.itbook.modules.checkin.dto;

public class CheckInStatusDto {
    private int reward;
    private int total;
    private boolean isCheck;

    public CheckInStatusDto(int reward, int total, boolean isCheck) {
        this.reward = reward;
        this.total = total;
        this.isCheck = isCheck;
    }

    public int getReward() {
        return reward;
    }

    public void setReward(int reward) {
        this.reward = reward;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public boolean getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(boolean isCheck) {
        this.isCheck = isCheck;
    }
}
