package com.pack.information_service.validation;

import com.pack.information_service.domain.User;
import com.pack.information_service.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import static org.junit.Assert.*;
import static org.mockito.Mockito.when;


public class UserValidatorTest {

    private static final String USERNAME_SHORTER_THAN_8_CHARS = "Tom";
    private static final String USERNAME_LONGER_THAN_32_CHARS = "Roberto Augustin Miguel Santiago Samuel Perez de la Santa Conception Trujillo Veracruz Batista";
    private static final String USERNAME_WITH_VALID_LENGTH = "Caius Cosades";

    private static final String PASSWORD_SHORTER_THAN_8_CHARS = "qwerty";
    private static final String PASSWORD_LONGER_THAN_32_CHARS = "1234567890qwertyuiopasdfghjklzxcvbnm";
    private static final String PASSWORD_WITH_VALID_LENGTH = "qp40d8nc3bn7";
    private static final String PASSWORD_WITH_VALID_LENGTH_2 = "y4oak4r9kj1a";

    private UserService mockUserService = null;
    private PasswordEncoder mockPasswordEncoder = null;
    private User mockUserForm = null;
    private User mockUser = null;
    private BindingResult errors = null;
    private Authentication mockAuthentication = null;
    private SecurityContext mockSecurityContext = null;

    @Before
    public void setup(){

        mockUserService = Mockito.mock(UserService.class);
        mockPasswordEncoder = Mockito.mock(PasswordEncoder.class);
        mockUserForm =  Mockito.mock(User.class);
        mockUser =  Mockito.mock(User.class);
        errors  =  new BeanPropertyBindingResult(mockUserForm,"mockUserForm");
        mockAuthentication = Mockito.mock(Authentication.class);
        mockSecurityContext = Mockito.mock(SecurityContext.class);

        when(mockSecurityContext.getAuthentication()).thenReturn(mockAuthentication);
        SecurityContextHolder.setContext(mockSecurityContext);
        when(SecurityContextHolder.getContext().getAuthentication().getName()).thenReturn("test");
    }

    @Test
    public void validate_UsernameLessThan8Characters_HasErrors(){

        //System.out.println("validate_UsernameLessThan8Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_SHORTER_THAN_8_CHARS);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.validate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void validate_UsernameMoreThan32Characters_HasErrors(){

        //System.out.println("validate_UsernameMoreThan32Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_LONGER_THAN_32_CHARS);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.validate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void validate_DuplicateUsername_HasErrors(){

        //System.out.println("validate_DuplicateUsername_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_WITH_VALID_LENGTH);
        when(mockUser.getUsername()).thenReturn(USERNAME_WITH_VALID_LENGTH);
        when(mockUserService.findByUsername(USERNAME_WITH_VALID_LENGTH)).thenReturn(mockUser); //return not null
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.validate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void validate_PasswordLessThan8Characters_HasErrors(){

        //System.out.println("validate_PasswordLessThan8Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_WITH_VALID_LENGTH);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_SHORTER_THAN_8_CHARS);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_SHORTER_THAN_8_CHARS);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.validate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void validate_PasswordMoreThan32Characters_HasErrors(){

       // System.out.println("validate_PasswordMoreThan32Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_WITH_VALID_LENGTH);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_LONGER_THAN_32_CHARS);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_LONGER_THAN_32_CHARS);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.passwordValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }
    @Test
    public void validate_PasswordNotEqualsConfirmPassword_HasErrors(){

        //System.out.println("validate_PasswordNotEqualsConfirmPassword_HasErrors test");

        when(mockUserForm.getUsername()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH_2);
        when(mockUserForm.getOldPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH_2);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.validate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void usernameValidate_UsernameLessThan8Characters_HasErrors(){

        //System.out.println("usernameValidate_UsernameLessThan8Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_SHORTER_THAN_8_CHARS);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.usernameValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void usernameValidate_UsernameMoreThan32Characters_HasErrors(){

       // System.out.println("usernameValidate_UsernameMoreThan32Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getUsername()).thenReturn(USERNAME_LONGER_THAN_32_CHARS);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.usernameValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void usernameValidate_DuplicateUsername_HasErrors(){

        //System.out.println("usernameValidate_DuplicateUsername_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);

        when(mockUserForm.getUsername()).thenReturn(USERNAME_WITH_VALID_LENGTH);
        when(mockUser.getUsername()).thenReturn(USERNAME_WITH_VALID_LENGTH);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.usernameValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void passwordValidate_PasswordLessThan8Characters_HasErrors(){

       // System.out.println("passwordValidate_PasswordLessThan8Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_SHORTER_THAN_8_CHARS);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_SHORTER_THAN_8_CHARS);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.passwordValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void passwordValidate_PasswordMoreThan32Characters_HasErrors(){

       // System.out.println("passwordValidate_PasswordMoreThan32Characters_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_LONGER_THAN_32_CHARS);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_LONGER_THAN_32_CHARS);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.passwordValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void passwordValidate_PasswordSameAsOldPassword_HasErrors(){

       // System.out.println("passwordValidate_PasswordSameAsOldPassword_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getOldPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.passwordValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void passwordValidate_PasswordNotEqualsConfirmPassword_HasErrors(){

       // System.out.println("passwordValidate_PasswordNotEqualsConfirmPassword_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH_2);
        when(mockUserForm.getOldPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH_2);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.passwordValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

    @Test
    public void passwordValidate_EncodedPasswordNotMatch_HasErrors(){

        //System.out.println("passwordValidate_EncodedPasswordNotMatch_HasErrors test");

        when(mockUserService.findByUsername("test")).thenReturn(mockUser);
        when(mockUserForm.getPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getConfirmPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH);
        when(mockUserForm.getOldPassword()).thenReturn(PASSWORD_WITH_VALID_LENGTH_2);
        when(mockPasswordEncoder.matches(PASSWORD_WITH_VALID_LENGTH,PASSWORD_WITH_VALID_LENGTH_2)).thenReturn(false);

        UserValidator UV = new UserValidator(mockUserService, mockPasswordEncoder);
        UV.passwordValidate(mockUserForm, errors);

        assertTrue(errors.hasErrors());
    }

}