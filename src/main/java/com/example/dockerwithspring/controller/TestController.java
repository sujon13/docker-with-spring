package com.example.dockerwithspring.controller;

import com.example.dockerwithspring.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
@Slf4j
@RequestMapping("/api")
@RequiredArgsConstructor
public class TestController {
    private final TestService testService;

    @GetMapping("/test")
    public ResponseEntity<List<String>> test() {
        List<String> players = testService.getPlayerList();
        log.info("Current Time: " + new Date() + "players: " + players);
        return ResponseEntity.ok(players);
    }
}