package com.gg.itbook.modules.shelf;

import com.gg.itbook.common.auth.LoginInfo;
import com.gg.itbook.common.auth.MyLoginInfo;
import com.gg.itbook.common.auth.NeedAuth;
import com.gg.itbook.common.exception.EntityNotFoundException;
import com.gg.itbook.common.response.ApiResponse;
import com.gg.itbook.common.response.ApiResult;
import com.gg.itbook.modules.book.model.Book;
import com.gg.itbook.modules.shelf.request.AddBookToShelfReq;
import com.gg.itbook.modules.shelf.response.BookShelfStatusResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/shelfs")
public class ShelfController {

    private ShelfService shelfService;

    public ShelfController(ShelfService shelfService) {
        this.shelfService = shelfService;
    }

    @NeedAuth
    @GetMapping()
    public ApiResponse<List<Book>> getBooks(@MyLoginInfo LoginInfo loginInfo) {
        return ApiResult.success(shelfService.findBooksByUserId(loginInfo.getUserDTO().getId()));

    }
    @NeedAuth
    @GetMapping("/{book_id}")
    public ShelfItem getShelfItemByBook(@PathVariable int book_id, @MyLoginInfo LoginInfo loginInfo) {
        return shelfService.findShelfItem(loginInfo.getUserDTO().getId(),book_id);
    }
    @NeedAuth
    @DeleteMapping("/{book_id}")
    public ApiResponse removeBookFromShelf(@PathVariable int book_id,@MyLoginInfo LoginInfo loginInfo) {
        shelfService.removeBookFromShelf(loginInfo.getUserDTO().getId(),book_id);
        return ApiResult.successOnly();

    }
    @NeedAuth
    @PostMapping()
    public void addBookToShelf(@RequestBody AddBookToShelfReq req,@MyLoginInfo LoginInfo loginInfo) {
        shelfService.addBookToShelf(loginInfo.getUserDTO().getId(), req.getBook_id());
    }
    @NeedAuth
    @GetMapping("/{book_id}/status")
    public ApiResponse checkBookShelfStatus(@PathVariable int book_id, @MyLoginInfo LoginInfo loginInfo)
    {
        try {
            shelfService.findShelfItem(loginInfo.getUserDTO().getId(), book_id);
        }
        catch (EntityNotFoundException ex) {
            return ApiResult.success(new BookShelfStatusResponse(false));
        }
        return ApiResult.success(new BookShelfStatusResponse(true));
    }

}
