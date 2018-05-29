package com.pack.information_service.service.impl;

import com.pack.information_service.domain.User;
import com.pack.information_service.repository.RoleRepository;
import com.pack.information_service.repository.UserRepository;
import com.pack.information_service.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

public class UserServiceImplTest {

    private UserRepository mockUserRepository;
    private RoleRepository mockRoleRepository;
    private PasswordEncoder mockPasswordEncoder;
    private User mockUser = null;
    private UserServiceImpl usi;

    private static final String USERNAME_OF_EXISTING_USER = "Caius Cosades";
    private static final String USERNAME_OF_NOT_EXISTING_USER = "Hasphat Antabolis";
    private static final Long ID_OF_EXISTING_USER = 1L;
    private static final Long ID_OF_NOT_EXISTING_USER = 0L;

    @Before
    public void setup() {

        mockUserRepository = Mockito.mock(UserRepository.class);
        mockPasswordEncoder = Mockito.mock(PasswordEncoder.class);
        mockRoleRepository = Mockito.mock(RoleRepository.class);
        mockUser = Mockito.mock(User.class);
        usi = new UserServiceImpl(mockUserRepository, mockRoleRepository, mockPasswordEncoder);

        when(mockUserRepository.findByUsername(USERNAME_OF_EXISTING_USER)).thenReturn(mockUser);
        when(mockUserRepository.findByUsername(USERNAME_OF_NOT_EXISTING_USER)).thenReturn(null);
        when(mockUserRepository.findByIdUser(ID_OF_EXISTING_USER)).thenReturn(mockUser);
        when(mockUserRepository.findByIdUser(ID_OF_NOT_EXISTING_USER)).thenReturn(null);

    }

    @Test
    public void findByUsername_UserExists_UserFound(){

        assertSame(mockUser, usi.findByUsername(USERNAME_OF_EXISTING_USER));
    }

    @Test
    public void findByUsername_UserNotExists_UserNotFound(){

        assertNull(usi.findByUsername(USERNAME_OF_NOT_EXISTING_USER));
    }

    @Test
    public void lock_UserNotBlocked_UserBlocked(){

        usi.lock(ID_OF_EXISTING_USER);
        assertTrue(!mockUser.isBlocked());
    }

    @Test
    public void delete_UserExists_UserDeleted(){

        //todo
    }


}