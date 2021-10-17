package com.gg.itbook.modules.checkin;

import com.gg.itbook.modules.checkin.dto.CheckInStatusDto;

public class CheckInResultDto {
    private int reward;
    private CheckInStatusDto checkInStatus;

    public CheckInResultDto(int reward, CheckInStatusDto checkInStatus) {
        this.reward = reward;
        this.checkInStatus = checkInStatus;
    }

    public int getReward() {
        return reward;
    }

    public CheckInStatusDto getCheckInStatus() {
        return checkInStatus;
    }

    public void setCheckInStatus(CheckInStatusDto checkInStatus) {
        this.checkInStatus = checkInStatus;
    }

    public void setReward(int reward) {
        this.reward = reward;
    }
}
