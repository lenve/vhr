package org.javaboy.vhr.config;

import jakarta.servlet.http.HttpServletRequest;
import org.javaboy.vhr.model.Menu;
import org.javaboy.vhr.model.Role;
import org.javaboy.vhr.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.authorization.AuthorizationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.access.intercept.RequestAuthorizationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.List;
import java.util.function.Supplier;

/**
 * 动态权限校验。
 *
 * <p>Spring Security 7 移除了 FilterInvocationSecurityMetadataSource +
 * AccessDecisionManager 这一套旧模型，这里改为 AuthorizationManager 实现：
 * 根据当前请求地址分析出访问该地址所需要的角色，再和当前登录用户的角色做比对。
 */
@Component
public class CustomAuthorizationManager implements AuthorizationManager<RequestAuthorizationContext> {

    @Autowired
    MenuService menuService;

    AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public AuthorizationDecision authorize(Supplier<? extends Authentication> authentication, RequestAuthorizationContext object) {
        String requestUrl = getRequestUrl(object.getRequest());
        List<Menu> menus = menuService.getAllMenusWithRole();
        for (Menu menu : menus) {
            if (menu.getUrl() != null && antPathMatcher.match(menu.getUrl(), requestUrl)) {
                List<Role> roles = menu.getRoles();
                if (roles == null || roles.isEmpty()) {
                    //菜单没有配置任何角色，只需要登录即可访问
                    return new AuthorizationDecision(isLogin(authentication.get()));
                }
                for (Role role : roles) {
                    if (hasAuthority(authentication.get(), role.getName())) {
                        return new AuthorizationDecision(true);
                    }
                }
                return new AuthorizationDecision(false);
            }
        }
        //没有匹配到任何菜单，说明该请求不需要特殊权限，登录即可访问
        return new AuthorizationDecision(isLogin(authentication.get()));
    }

    private String getRequestUrl(HttpServletRequest request) {
        String requestUrl = request.getRequestURI();
        String contextPath = request.getContextPath();
        if (StringUtils.hasLength(contextPath) && requestUrl.startsWith(contextPath)) {
            requestUrl = requestUrl.substring(contextPath.length());
        }
        return requestUrl;
    }

    private boolean isLogin(Authentication authentication) {
        return authentication != null && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken);
    }

    private boolean hasAuthority(Authentication authentication, String needRole) {
        if (authentication == null || needRole == null) {
            return false;
        }
        if ("ROLE_LOGIN".equals(needRole)) {
            return isLogin(authentication);
        }
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority authority : authorities) {
            if (needRole.equals(authority.getAuthority())) {
                return true;
            }
        }
        return false;
    }
}
