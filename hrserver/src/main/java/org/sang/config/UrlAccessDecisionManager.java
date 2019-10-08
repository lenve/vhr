package org.sang.config;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Iterator;

/**
 * Created by sang on 2017/12/28.
 */
@Component
public class UrlAccessDecisionManager implements AccessDecisionManager {
	@Override
	public void decide(Authentication auth, Object o, Collection<ConfigAttribute> cas) { //
		Iterator<ConfigAttribute> iterator = cas.iterator();
		while (iterator.hasNext()) {
			ConfigAttribute ca = iterator.next();	
			String needRole = ca.getAttribute();
			if ("ROLE_LOGIN".equals(needRole)) { //角色是登陆，就说明是未登录，跳转到登陆页面
				if (auth instanceof AnonymousAuthenticationToken) { //如果当前请求未登录 //未登录
					throw new BadCredentialsException("未登录"); //跳转到登陆页面。即会请求/login_p。
				} else //如果当前请求已经登录，但是菜单集合里没有。比如/config/sysmenu，/chat/sysmsgs，这些是登陆之后立马请求的几个请求。
					return; //已登陆，但是不是菜单路径。不是菜单路径，就直接访问，即有权限访问，说白了，就是此时是没有我们自己创建的权限。
			}
			
			// 当前用户所具有的权限 //菜单路径
			Collection<? extends GrantedAuthority> authorities = auth.getAuthorities(); //现在已经登录成功了，当前用户是属于某个角色，比如admin是[ROLE_admin]角色，这个角色是我们自己创建的角色。而且，用户可能属于多个角色。
			for (GrantedAuthority authority : authorities) {
				if (authority.getAuthority().equals(needRole)) { //用户所属的角色是否和菜单所属的角色一样，一样就是有这个菜单权限，不一样就没有这个菜单的权限
					return;
				}
			}
		}
		
		throw new AccessDeniedException("权限不足!"); //用户没有这个菜单的权限
	}

	@Override
	public boolean supports(ConfigAttribute configAttribute) {
		return true;
	}

	@Override
	public boolean supports(Class<?> aClass) {
		return true;
	}
}