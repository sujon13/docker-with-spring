package com.example.dockerwithspring.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TestService {
    private final RestTemplate restTemplate;

    public List<String> getPlayerList() {
        //String url = "http://localhost:9005/api/players";
        String url = "http://api-service:9005/api/players";
        return restTemplate.getForObject(url, List.class);
    }

}
