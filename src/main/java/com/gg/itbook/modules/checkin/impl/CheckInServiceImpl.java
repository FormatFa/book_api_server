package com.gg.itbook.modules.checkin.impl;

import com.gg.itbook.common.enums.CoinUseType;
import com.gg.itbook.common.exception.BusinessException;
import com.gg.itbook.common.util.DateTimeTool;
import com.gg.itbook.modules.checkin.CheckIn;
import com.gg.itbook.modules.checkin.CheckInMapper;
import com.gg.itbook.modules.checkin.CheckInResultDto;
import com.gg.itbook.modules.checkin.CheckInService;
import com.gg.itbook.modules.checkin.dto.CheckInStatusDto;
import com.gg.itbook.modules.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.Objects;
//'1000-01-01 00:00:00' to '9999-12-31 23:59:59'.
@Service
public class CheckInServiceImpl implements CheckInService {

    @Autowired
    private CheckInMapper checkInMapper;
    @Autowired
    private UserService userService;

    @Override
    // 测试事务
    @Transactional
    public CheckInResultDto check_in(int user_id, LocalDate now) {
        CheckIn checkIn = checkInMapper.selectCheckIn(user_id);

        // 创建初始数据
        if(checkIn==null) {
            checkIn = new CheckIn(user_id, DateTimeTool.minLocalDateTime,0);
            checkInMapper.createCheckIn(checkIn);
        }else {
            if(!checkIn.isContinueDay(now) &&! checkIn.isTodayCheckIn(now)){
                checkIn.setTotal(0);
            }
        }
        if(checkIn.isTodayCheckIn(now)){
            throw new BusinessException("今天已经签到了");
        }
        int reward = checkIn.getReward();


        if(checkIn.isContinueDay(now)) {
            checkIn.setTotal(checkIn.getTotal()+1);
        }
        else {
            checkIn.setTotal(1);
        }

        checkIn.setLast_check_time(LocalDateTime.now());

        checkInMapper.updateCheckIn(checkIn);
        // 增加金币
        userService.useCoin(user_id,reward, CoinUseType.CHECK_IN);
        return new CheckInResultDto(reward,new CheckInStatusDto(
                checkIn.getReward(),
                checkIn.getTotal(),
                checkIn.isTodayCheckIn(now)
        ));
    }



    @Override
    public CheckInStatusDto getCheckInStatus(int user_id,LocalDate nowDate) {
        CheckIn checkIn = checkInMapper.selectCheckIn(user_id);
        if(checkIn==null) {
            checkIn = new CheckIn(user_id, DateTimeTool.minLocalDateTime,0);
        }
        else {
            // 当天没有签到，并且不是连续的。
            if(!checkIn.isContinueDay(nowDate) &&! checkIn.isTodayCheckIn(nowDate)){
                checkIn.setTotal(0);
            }
        }
        return new CheckInStatusDto(
                checkIn.getReward(),
                checkIn.getTotal(),
                checkIn.isTodayCheckIn(nowDate)
        );
    }



}
