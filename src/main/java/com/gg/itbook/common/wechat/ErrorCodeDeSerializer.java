package com.gg.itbook.common.wechat;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;

import java.io.IOException;

public class ErrorCodeDeSerializer extends StdDeserializer<ErrorCode> {


    protected ErrorCodeDeSerializer() {
        super(ErrorCode.class);
    }


    @Override
    public ErrorCode deserialize(JsonParser jsonParser, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = jsonParser.getCodec().readTree(jsonParser);
        int code =  node.asInt();
        for(ErrorCode item:ErrorCode.values()){
            if(item.getValue()==code){
                return item;
            }

        }
        return ErrorCode.UNKNOW;
    }
}
