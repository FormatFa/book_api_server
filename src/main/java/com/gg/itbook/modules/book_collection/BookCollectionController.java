package com.gg.itbook.modules.book_collection;

import com.gg.itbook.common.response.ApiResponse;
import com.gg.itbook.common.response.ApiResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/collection")
public class BookCollectionController {
    @Autowired
    private BookCollectionService bookCollectionService;

    @GetMapping()
    public ApiResponse getCollectionByName(@RequestParam String name) {
        return ApiResult.success(bookCollectionService.getCollectionByName(name));
    }


}
