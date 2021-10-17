package com.gg.itbook.check_in;

import com.gg.itbook.common.config.ToolSpringConfig;
import com.gg.itbook.common.enums.CoinUseType;
import com.gg.itbook.modules.checkin.CheckIn;
import com.gg.itbook.modules.checkin.CheckInMapper;
import com.gg.itbook.modules.checkin.CheckInService;
import com.gg.itbook.modules.checkin.dto.CheckInStatusDto;
import com.gg.itbook.modules.checkin.impl.CheckInServiceImpl;
import com.gg.itbook.modules.user.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;
@ExtendWith(SpringExtension.class)
@Import(ToolSpringConfig.class)
public class CheckInServiceTest {

    @Autowired
    CheckInService checkInService;
    @Autowired
    CheckInMapper checkInMapper;
    @Autowired
    UserService userService;
    CheckIn last_checkIn ;

    @BeforeEach
    public void setUp() {
         last_checkIn=  new CheckIn(1, LocalDateTime.of(1998,11,11,12,9),1);
        Mockito.when(checkInMapper.selectCheckIn(1)).thenReturn(last_checkIn);
    }
    @Test
    public void given_today_check_in_then_recheck_status_should_correct(){


        CheckInStatusDto statusDto = checkInService.getCheckInStatus(1,this.last_checkIn.getLast_check_time().toLocalDate());
        assertTrue(statusDto.getIsCheck(),"today should had check in");

        statusDto = checkInService.getCheckInStatus(1,this.last_checkIn.getLast_check_time().toLocalDate().plusDays(-1));
        assertFalse(statusDto.getIsCheck(),"today should had not check in");

    }
    @Test
    public void get_check_in_status_should_correct() {
        //        断签时，total应该归0
        CheckInStatusDto breakTime = checkInService.getCheckInStatus(1,this.last_checkIn.getLast_check_time().toLocalDate().plusDays(2));
        assertEquals(0,breakTime.getTotal(),"when break,should zero");
    }
    // 消费金币应该正常
    @Test
    public void given_check_in_use_coin_should_correct() {
        LocalDate continueDay = this.last_checkIn.getLast_check_time().toLocalDate().plusDays(1);
        int expectReward = this.last_checkIn.getReward();
        checkInService.check_in(1,continueDay);
        ArgumentCaptor<Integer> useReward = ArgumentCaptor.forClass(Integer.class);
        assertNotNull(userService);
        UserService service =  Mockito.verify(userService);
        service        .useCoin(Mockito.anyInt(),useReward.capture(), Mockito.any());
//        消费应该正确
        assertEquals(expectReward,useReward.getValue());


    }
//    签到后正确更新数据
    @Test
    public void check_in_then_should_work_correctly(){

        LocalDate continueDay = this.last_checkIn.getLast_check_time().toLocalDate().plusDays(1);
        assertTrue(this.last_checkIn.isContinueDay(continueDay),"should be continue day");
        // 连续签到后应该更新总数
        // 上一次签到为上一天
        checkInService.check_in(1,continueDay);
        ArgumentCaptor<CheckIn> savedCheckIn = ArgumentCaptor.forClass(CheckIn.class);
        Mockito.verify(checkInMapper).updateCheckIn(savedCheckIn.capture());
        // 签到成功，应该是2
        assertEquals(2,savedCheckIn.getValue().getTotal(),"saved total should plus 1");



        // 用户不存在时应该调用插入
        checkInService.check_in(2,continueDay);
        Mockito.verify(checkInMapper).createCheckIn(savedCheckIn.capture());
        assertEquals(1,savedCheckIn.getValue().getTotal(),"new user should 1");

    //




    }
    @org.springframework.boot.test.context.TestConfiguration
    static class TestConfiguration {
        @Bean
        CheckInService checkInService() {
            return new CheckInServiceImpl();
        }
        @Bean
        CheckInMapper checkInMapper() {
            return Mockito.mock(CheckInMapper.class);
        }
        @Bean
        UserService userService() {
            return Mockito.mock(UserService.class);
        }
    }
}
