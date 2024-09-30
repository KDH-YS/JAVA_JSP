package com.example.demo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
    Message getMessageById(Integer id);
}
