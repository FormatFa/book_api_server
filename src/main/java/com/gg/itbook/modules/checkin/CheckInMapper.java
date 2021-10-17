package com.gg.itbook.modules.checkin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CheckInMapper {
    CheckIn selectCheckIn(int user_id);
    int updateCheckIn(CheckIn checkIn);
    int createCheckIn(CheckIn checkIn);
}
