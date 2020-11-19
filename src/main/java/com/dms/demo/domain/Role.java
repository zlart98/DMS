package com.dms.demo.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER, ROLE_ADMIN, ROLE_SECURITY_OFFICER;

    @Override
    public String getAuthority() {
        return name();
    }
}
