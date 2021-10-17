package com.gg.itbook.modules.checkin;

import com.gg.itbook.modules.checkin.dto.CheckInStatusDto;

import java.time.LocalDate;
import java.util.Date;

public interface CheckInService {
    CheckInResultDto check_in(int user_id,LocalDate now);
    CheckInStatusDto getCheckInStatus(int user_id, LocalDate nowDay);
}
