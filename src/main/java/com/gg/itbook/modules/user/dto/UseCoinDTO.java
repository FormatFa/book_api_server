package com.gg.itbook.modules.user.dto;

import com.gg.itbook.modules.user.vo.Coin;

public class UseCoinDTO {
    private Coin balance;

    public UseCoinDTO(Coin balance) {
        this.balance = balance;
    }

    public Coin getBalance() {
        return balance;
    }

    public void setBalance(Coin balance) {
        this.balance = balance;
    }
}
