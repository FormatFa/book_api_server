package com.gg.itbook.common.exception;

public class BalanceInSufficientException extends ApiException{
    public BalanceInSufficientException(int need,int left) {
        super(String.format("need : {}, but left :{}",need,left));
    }
}
