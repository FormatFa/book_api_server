package com.gg.itbook.modules.book.response;

public class BuyChapterResponse {
    private int  coin;

    public BuyChapterResponse(int coin) {
        this.coin = coin;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }
}
