package org.sang.config;

import org.sang.bean.Menu;
import org.sang.bean.Role;
import org.sang.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * Created by sang on 2017/12/28.
 */
@Component
public class CustomMetadataSource implements FilterInvocationSecurityMetadataSource {
	@Autowired
	MenuService menuService;
	AntPathMatcher antPathMatcher = new AntPathMatcher();

	@Override
	public Collection<ConfigAttribute> getAttributes(Object o) { 
		// 获取当前请求
		String requestUrl = ((FilterInvocation) o).getRequestUrl();
		// 获取菜单集合
		List<Menu> allMenu = menuService.getAllMenu();

		for (Menu menu : allMenu) { //存储菜单-角色到权限框架里取
			if (antPathMatcher.match(menu.getUrl(), requestUrl) // 当前请求与菜单请求是否匹配
					&& menu.getRoles().size() > 0) { //菜单所属角色集合是否大于0
				List<Role> roles = menu.getRoles();
				int size = roles.size();
				String[] values = new String[size];
				for (int i = 0; i < size; i++) {
					values[i] = roles.get(i).getName(); //角色名字
				}
				return SecurityConfig.createList(values); //存储角色名字
			}
		}
		
		// 没有匹配上，就跳转到登陆页面
		return SecurityConfig.createList("ROLE_LOGIN");
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> aClass) {
		return FilterInvocation.class.isAssignableFrom(aClass);
	}
}
