package com.gg.itbook.modules.user.vo;

public class Coin {
    private int coin;

    private Coin(int coin) {
        this.coin = coin;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }
    public static Coin from(int coin) {
        return new Coin(coin);
    }
}
