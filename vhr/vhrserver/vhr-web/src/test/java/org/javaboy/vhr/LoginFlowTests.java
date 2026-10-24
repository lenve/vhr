package org.javaboy.vhr;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * 升级后的冒烟测试：登录 + 动态权限接口访问。
 */
@SpringBootTest
public class LoginFlowTests {

    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @Test
    public void loginAndAccessProtectedApi() throws Exception {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        MockHttpSession session = new MockHttpSession();
        //登录过滤器会校验 session 中的验证码
        session.setAttribute("verify_code", "abcd");
        mockMvc.perform(post("/doLogin")
                        .session(session)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"username\":\"admin\",\"password\":\"123\",\"code\":\"abcd\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.msg").value("登录成功!"))
                .andDo(print());
        //登录成功后，带权限的接口不再返回 401（说明登录状态与动态权限均生效）
        mockMvc.perform(get("/system/hr/").session(session))
                .andExpect(result -> assertTrue(result.getResponse().getStatus() != 401))
                .andDo(print());
    }
}
