package com.pack.information_service.service;

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}