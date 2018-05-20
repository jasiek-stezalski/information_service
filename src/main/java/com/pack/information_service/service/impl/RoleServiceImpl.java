package com.pack.information_service.service.impl;

import com.pack.information_service.service.RoleService;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

    @Override
    public Map<String, String> findAll() {
        return new LinkedHashMap<String, String>() {{
            put("USER", "UserPanel.user");
            put("ADMIN", "UserPanel.admin");
            put("JOURNALIST", "UserPanel.journalist");
            put("MODERATOR", "UserPanel.moderator");
            put("EDITOR_IN_CHIEF", "UserPanel.editorInChief");
        }};
    }
}
