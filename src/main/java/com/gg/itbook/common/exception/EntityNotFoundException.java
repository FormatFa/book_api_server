package com.gg.itbook.common.exception;

public class EntityNotFoundException extends  ApiException{
    public EntityNotFoundException(String entity,String identity) {
        super(String.format("%s of %s not found ",entity,identity));
    }
}
