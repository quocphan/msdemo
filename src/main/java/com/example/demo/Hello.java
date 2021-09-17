package com.example.demo;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1")
public class Hello {
    @Autowired
    ObjectMapper objectMapper;
    @GetMapping(
            value = "/",
            produces = {"application/json;charset=utf-8"})
    public ResponseEntity<String> Hello(){
        return new ResponseEntity<>(objectMapper.createObjectNode().put("Hello", "Champion").toPrettyString(), HttpStatus.OK);
    }
}
