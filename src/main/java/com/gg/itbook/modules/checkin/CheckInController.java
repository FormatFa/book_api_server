package com.gg.itbook.modules.checkin;

import com.gg.itbook.common.auth.LoginInfo;
import com.gg.itbook.common.auth.MyLoginInfo;
import com.gg.itbook.common.auth.NeedAuth;
import com.gg.itbook.common.response.ApiResponse;
import com.gg.itbook.common.response.ApiResult;
import com.gg.itbook.modules.checkin.dto.CheckInStatusDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

// TODO
@RestController
@RequestMapping("/check_in")
public class CheckInController {
    @Autowired
    private CheckInService checkInService;

    @PostMapping()
    @NeedAuth
    public  ApiResponse<CheckInResultDto> check_in(@MyLoginInfo LoginInfo loginInfo) {
        return ApiResult.success(checkInService.check_in(loginInfo.getUserId(),LocalDate.now()));
    }
    @GetMapping()
    @NeedAuth
    public ApiResponse<CheckInStatusDto> get_check_in_status(@MyLoginInfo LoginInfo loginInfo) {
        return ApiResult.success(checkInService.getCheckInStatus(loginInfo.getUserId(), LocalDate.now()));

    }
}
