package com.gg.itbook.api;


import com.gg.itbook.common.response.ApiResponse;
import com.gg.itbook.common.response.ApiResult;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.json.JsonTest;
import org.springframework.boot.test.json.JacksonTester;
import org.springframework.boot.test.json.JsonContent;

import java.io.IOException;

import static org.assertj.core.api.Assertions.assertThat;

@JsonTest
public class RestApiResponseTest {
    @Autowired
    JacksonTester<ApiResponse> responseJsonTest;

    @Test
    public void testResponseSerialize() throws IOException {
        ApiResponse success = ApiResult.success("hello");
        JsonContent<ApiResponse> content = responseJsonTest.write(success);
        assertThat(content).hasJsonPath("$.status");
        assertThat(content).extractingJsonPathStringValue("$.status").isEqualTo("success");
        assertThat(content).extractingJsonPathStringValue("$.data").isEqualTo("hello");

    }

}
