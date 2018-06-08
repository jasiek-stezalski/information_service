package com.pack.information_service.service.impl;


import org.junit.Before;
import org.junit.Test;
import java.util.Map;
import java.util.LinkedHashMap;

import static org.junit.Assert.*;

public class RoleServiceImplTest {

    private Map <String,String> map=null;



    public Map<String, String> setup(){
        return  new LinkedHashMap<String, String>() {{
            put("USER", "UserPanel.user");
            put("ADMIN", "UserPanel.admin");
            put("JOURNALIST", "UserPanel.journalist");
            put("MODERATORR", "UserPanel.moderator");
            put("EDITOR_IN_CHIEF", "UserPanel.editorInChief");
        }};
    }

    @Before
    public void load_data(){
        map=setup();
    }

    @Test
    public void findAll_Check(){

        assertEquals("UserPanel.user",map.get("USER"));
        assertEquals("UserPanel.admin",map.get("ADMIN"));
        assertEquals("UserPanel.journalist",map.get("JOURNALIST"));
        assertEquals("UserPanel.moderator",map.get("MODERATORR"));
        assertEquals("UserPanel.editorInChief",map.get("EDITOR_IN_CHIEF"));

    }

}