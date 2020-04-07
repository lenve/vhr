扫码加微信（微信ID：**a_java_boy2**），备注微人事，进群讨论。

![微信ID：a_java_boy2](https://user-images.githubusercontent.com/6023444/75459026-ba70d500-59b9-11ea-8cbd-3d5889f356c4.png)

## 项目介绍

微人事是一个前后端分离的人力资源管理系统，项目采用 SpringBoot+Vue 开发，项目加入常见的企业级应用所涉及到的技术点，例如 Redis、RabbitMQ 等。


- 项目地址：[https://github.com/lenve/vhr](https://github.com/lenve/vhr) 
- [项目部署视频教程（旧版）](https://mp.weixin.qq.com/s/qN01Le434FWom0c3jqiQmA)
- [项目部署视频教程（新版）](https://mp.weixin.qq.com/s/dcJv6BIVFPnokI8nBf4IrQ)
- [项目其他相关资料](./README_zh.md)

### 项目技术栈

#### 后端技术栈

1. Spring Boot
2. Spring Security
3. MyBatis
4. MySQL
5. Redis
6. RabbitMQ
7. Spring Cache
8. WebSocket
9. ...

#### 前端技术栈

1. Vue
2. ElementUI
3. axios
4. vue-router
5. Vuex
6. WebSocket
7. vue-cli4
8. ...

### 项目效果图

首先，不同的用户在登录成功之后，根据不同的角色，会看到不同的系统菜单，完整菜单如下：

![p278](https://raw.githubusercontent.com/wiki/lenve/vhr/doc/p278.png)

不同用户登录上来之后，可能看到的会有差异，如下：

![p279](https://raw.githubusercontent.com/wiki/lenve/vhr/doc/p279.png)

每个用户的角色是由系统管理员进行分配的，系统管理员给用户分配角色的页面如下：

![p280](https://raw.githubusercontent.com/wiki/lenve/vhr/doc/p280.png)

系统管理员也可以管理不同角色可以操作的资源，页面如下：

![p281](https://raw.githubusercontent.com/wiki/lenve/vhr/doc/p281.png)

## 快速部署

1. clone 项目到本地 `git@github.com:lenve/vhr.git`
2. 数据库脚本使用 Flyway 管理，**不需要手动导入数据库脚本**，只需要提前在本地 MySQL 中创建一个空的数据库 vhr，并修改项目中关于数据的配置（resources 目录下的 application.properties 文件中）即可
3. 提前准备好 Redis，在 项目的 application.properties 文件中，将 Redis 配置改为自己的
4. 提前准备好 RabbitMQ，在项目的 application.properties 文件中将 RabbitMQ 的配置改为自己的（**注意，RabbitMQ 需要分别修改 mailserver 和 vhrserver 的配置文件**）
5. 在 IntelliJ IDEA 中打开 vhr 项目，启动 mailserver 模块
6. 运行 vhrserver 中的 vhr-web 模块

**OK，至此，服务端就启动成功了，此时我们直接在地址栏输入 `http://localhost:8081/index.html` 即可访问我们的项目，如果要做二次开发，请继续看第七、八步。**

7. 进入到vuehr目录中，在命令行依次输入如下命令：

```
# 安装依赖
npm install

# 在 localhost:8080 启动项目
npm run serve
```

由于我在 vuehr 项目中已经配置了端口转发，将数据转发到 Spring Boot 上，因此项目启动之后，在浏览器中输入 `http://localhost:8080` 就可以访问我们的前端项目了，所有的请求通过端口转发将数据传到 Spring Boot 中（注意此时不要关闭 Sprin gBoot 项目）。

8. 最后可以用 WebStorm 等工具打开 vuehr 项目，继续开发，开发完成后，当项目要上线时，依然进入到 vuehr 目录，然后执行如下命令：

```
npm run build
```

该命令执行成功之后，vuehr 目录下生成一个 dist 文件夹，将该文件夹中的两个文件 static 和 index.html 拷贝到 Spring Boot 项目中 resources/static/ 目录下，然后就可以像第 6 步那样直接访问了（关于前后端分离部署，大家也可以参考这个[使用 Nginx 部署前后端分离项目，解决跨域问题](https://mp.weixin.qq.com/s/C7PIck3SIPPTcA3NX3ELoQ)）。


**步骤 7 中需要大家对 NodeJS、NPM 等有一定的使用经验，不熟悉的小伙伴可以先自行搜索学习下，推荐 [Vue 官方教程](https://cn.vuejs.org/v2/guide/)。**

## 文档

文档是对项目开发过程中遇到的一些问题的详细记录，主要是为了帮助没有基础的小伙伴快速理解这个项目。

1. [权限数据库设计](https://github.com/lenve/vhr/wiki/1.%E6%9D%83%E9%99%90%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1)
2. [服务端环境搭建](https://github.com/lenve/vhr/wiki/2.%E6%9C%8D%E5%8A%A1%E7%AB%AF%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA)
3. [动态处理角色和资源的关系](https://github.com/lenve/vhr/wiki/3.%E5%8A%A8%E6%80%81%E5%A4%84%E7%90%86%E8%A7%92%E8%89%B2%E5%92%8C%E8%B5%84%E6%BA%90%E7%9A%84%E5%85%B3%E7%B3%BB)
4. [密码加密并加盐](https://github.com/lenve/vhr/wiki/4.%E5%AF%86%E7%A0%81%E5%8A%A0%E5%AF%86%E5%B9%B6%E5%8A%A0%E7%9B%90)
5. [服务端异常的统一处理](https://github.com/lenve/vhr/wiki/5.%E6%9C%8D%E5%8A%A1%E7%AB%AF%E5%BC%82%E5%B8%B8%E7%9A%84%E7%BB%9F%E4%B8%80%E5%A4%84%E7%90%86)
6. [axios 请求封装,请求异常统一处理](https://github.com/lenve/vhr/wiki/6.axios%E8%AF%B7%E6%B1%82%E5%B0%81%E8%A3%85,%E8%AF%B7%E6%B1%82%E5%BC%82%E5%B8%B8%E7%BB%9F%E4%B8%80%E5%A4%84%E7%90%86)
7. [将请求方法挂到Vue上](https://github.com/lenve/vhr/wiki/7.%E5%B0%86%E8%AF%B7%E6%B1%82%E6%96%B9%E6%B3%95%E6%8C%82%E5%88%B0Vue%E4%B8%8A)
8. [登录状态的保存](https://github.com/lenve/vhr/wiki/8.%E7%99%BB%E5%BD%95%E7%8A%B6%E6%80%81%E7%9A%84%E4%BF%9D%E5%AD%98)
9. [登录成功后动态加载组件](https://github.com/lenve/vhr/wiki/9.%E7%99%BB%E5%BD%95%E6%88%90%E5%8A%9F%E5%90%8E%E5%8A%A8%E6%80%81%E5%8A%A0%E8%BD%BD%E7%BB%84%E4%BB%B6)
10. [角色资源关系管理](https://github.com/lenve/vhr/wiki/10.%E8%A7%92%E8%89%B2%E8%B5%84%E6%BA%90%E5%85%B3%E7%B3%BB%E7%AE%A1%E7%90%86)
11. [用户角色关系管理](https://github.com/lenve/vhr/wiki/11.%E7%94%A8%E6%88%B7%E8%A7%92%E8%89%B2%E5%85%B3%E7%B3%BB%E7%AE%A1%E7%90%86)


### 更新记录

### 2018.1.10 更新

本次更新版本：v20180110

本次更新完成了部门管理功能，页面在 **[系统管理->基础信息设置->部门管理]**

>本次更新也更新了数据库脚本，小伙伴们需要重新下载数据库脚本执行。

#### 相关文档：

12. [部门数据库设计与存储过程编写](https://github.com/lenve/vhr/wiki/12.%E9%83%A8%E9%97%A8%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1%E4%B8%8E%E5%AD%98%E5%82%A8%E8%BF%87%E7%A8%8B%E7%BC%96%E5%86%99)
13. [递归查询与存储过程调用](https://github.com/lenve/vhr/wiki/13.%E9%80%92%E5%BD%92%E6%9F%A5%E8%AF%A2%E4%B8%8E%E5%AD%98%E5%82%A8%E8%BF%87%E7%A8%8B%E8%B0%83%E7%94%A8)
14. [Tree 树形控件使用要点](https://github.com/lenve/vhr/wiki/14.Tree%E6%A0%91%E5%BD%A2%E6%8E%A7%E4%BB%B6%E4%BD%BF%E7%94%A8%E8%A6%81%E7%82%B9)

### 2018.1.12 更新

本次更新版本：v20180112

本次更新完成了职称管理和职位管理，页面在 **[系统管理->基础信息设置->职位管理]** 和 **[系统管理->基础信息设置->职称管理]** 

>本次更新也更新了数据库脚本，小伙伴们需要重新下载数据库脚本执行。

#### 相关文档：

15. [职位管理和职称管理功能介绍](https://github.com/lenve/vhr/wiki/15.%E8%81%8C%E4%BD%8D%E7%AE%A1%E7%90%86%E5%92%8C%E8%81%8C%E7%A7%B0%E7%AE%A1%E7%90%86%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D)
16. [组件复用](https://github.com/lenve/vhr/wiki/16.%E7%BB%84%E4%BB%B6%E5%A4%8D%E7%94%A8)
17. [[题外话]利用 git 标签回退至任意版本](https://github.com/lenve/vhr/wiki/17.%5B%E9%A2%98%E5%A4%96%E8%AF%9D%5D%E5%88%A9%E7%94%A8git%E6%A0%87%E7%AD%BE%E5%9B%9E%E9%80%80%E8%87%B3%E4%BB%BB%E6%84%8F%E7%89%88%E6%9C%AC)

### 2018.1.15 更新

本次更新版本：v20180115

本次更新完成了员工基本信息管理，页面在 **[员工资料->基本资料]**

>本次更新也更新了数据库脚本，小伙伴们需要重新下载数据库脚本执行。

#### 相关文档：

18. [员工基本信息管理功能介绍](https://github.com/lenve/vhr/wiki/18.%E5%91%98%E5%B7%A5%E5%9F%BA%E6%9C%AC%E4%BF%A1%E6%81%AF%E7%AE%A1%E7%90%86%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D)
19. [Spring Boot 中自定义参数绑定](https://github.com/lenve/vhr/wiki/19.SpringBoot%E4%B8%AD%E8%87%AA%E5%AE%9A%E4%B9%89%E5%8F%82%E6%95%B0%E7%BB%91%E5%AE%9A)

### 2018.1.16 更新

本次更新版本：v20180116

本次更新完成了员工的高级搜索功能，页面在 **[员工资料->基本资料]**

#### 相关文档：

20. [高级搜索功能介绍](https://github.com/lenve/vhr/wiki/20.%E9%AB%98%E7%BA%A7%E6%90%9C%E7%B4%A2%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D)

### 2018.1.17 更新

本次更新版本：v20180117

本次更新完成了员工数据的导入导出功能，即可将员工数据导出为Excel，也可以将外部Excel导入到员工数据表中，页面在 **[员工资料->基本资料]**

#### 相关文档：

21. [Excel 导入导出效果图](https://github.com/lenve/vhr/wiki/21.Excel%E5%AF%BC%E5%85%A5%E5%AF%BC%E5%87%BA%E6%95%88%E6%9E%9C%E5%9B%BE)
22. [SpringMVC 文件下载的两种方式](https://github.com/lenve/vhr/wiki/22.SpringMVC%E6%96%87%E4%BB%B6%E4%B8%8B%E8%BD%BD%E7%9A%84%E4%B8%A4%E7%A7%8D%E6%96%B9%E5%BC%8F)
23. [POI 生成 Excel](https://github.com/lenve/vhr/wiki/23.POI%E7%94%9F%E6%88%90Excel)
24. [axios 下载文件](https://github.com/lenve/vhr/wiki/24.axios%E4%B8%8B%E8%BD%BD%E6%96%87%E4%BB%B6)
25. [使用 POI 实现 Excel 导入](https://github.com/lenve/vhr/wiki/25.%E4%BD%BF%E7%94%A8POI%E5%AE%9E%E7%8E%B0Excel%E5%AF%BC%E5%85%A5)

### 2018.1.19 更新

本次更新版本：v20180119

本次更新主要实现了当管理员添加一个用户时，添加成功后，会根据该用户的邮箱自动向用户发送一封欢迎入职邮件，页面在 **[员工资料->基本资料->添加员工]** 详情可以参考下面的文档。 **注意：邮件发送需要小伙伴小伙伴自己配置授权码，配置方式参考下面的文档，配置文件在[src/main/java/org/sang/common/EmailRunnable.java](https://github.com/lenve/vhr/blob/master/hrserver/src/main/java/org/sang/common/EmailRunnable.java)** 

#### 相关文档：

26. [Spring Boot 中使用 Freemarker 邮件模板生成邮件](https://github.com/lenve/vhr/wiki/26.SpringBoot%E4%B8%AD%E4%BD%BF%E7%94%A8Freemarker%E9%82%AE%E4%BB%B6%E6%A8%A1%E6%9D%BF%E7%94%9F%E6%88%90%E9%82%AE%E4%BB%B6)
27. [Java 中邮件的发送](https://github.com/lenve/vhr/wiki/27.Java%E4%B8%AD%E9%82%AE%E4%BB%B6%E7%9A%84%E5%8F%91%E9%80%81)
28. [Spring Boot 中使用新线程发送邮件](https://github.com/lenve/vhr/wiki/28.SpringBoot%E4%B8%AD%E4%BD%BF%E7%94%A8%E6%96%B0%E7%BA%BF%E7%A8%8B%E5%8F%91%E9%80%81%E9%82%AE%E4%BB%B6)

### 2018.1.25 更新

本次更新版本：v20180125

本次更新主要完成了工资账套管理功能，页面在 **[薪资管理->工资账套管理]**

>本次更新也更新了数据库脚本，小伙伴们需要重新下载数据库脚本执行。

#### 相关文档：

29. [工资账套管理功能介绍](https://github.com/lenve/vhr/wiki/29.%E5%B7%A5%E8%B5%84%E8%B4%A6%E5%A5%97%E7%AE%A1%E7%90%86%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D)

### 2018.1.26 更新

本次更新版本：v20180126

本次更新主要完成了员工账套设置功能，页面在 **[薪资管理->员工账套设置]**

>本次更新也更新了数据库脚本，小伙伴们需要重新下载数据库脚本执行。

#### 相关文档：

30. [员工账套设置功能介绍](https://github.com/lenve/vhr/wiki/30.%E5%91%98%E5%B7%A5%E8%B4%A6%E5%A5%97%E8%AE%BE%E7%BD%AE%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D)

### 2018.2.2 更新

本次更新版本：v20180202

本次更新完成了HR在线聊天功能，页面在 **[Home页->右上角铃铛->好友聊天]**

#### 相关文档：

31. [在线聊天功能介绍](https://github.com/lenve/vhr/wiki/31.%E5%9C%A8%E7%BA%BF%E8%81%8A%E5%A4%A9%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D)
32. [在线聊天功能实现](https://github.com/lenve/vhr/wiki/32.%E5%9C%A8%E7%BA%BF%E8%81%8A%E5%A4%A9%E5%8A%9F%E8%83%BD%E5%AE%9E%E7%8E%B0)

### 2018.2.5 更新

本次更新版本：v20180205

本次更新完成了管理员发送系统通知功能，页面在 **[Home页->右上角铃铛->系统通知]**

>本次更新也更新了数据库脚本，小伙伴们需要重新下载数据库脚本执行。

#### 相关文档：

33. [系统通知功能实现](https://github.com/lenve/vhr/wiki/33.%E7%B3%BB%E7%BB%9F%E9%80%9A%E7%9F%A5%E5%8A%9F%E8%83%BD%E5%AE%9E%E7%8E%B0)

### 2019.12.22 更新

本次更新版本：v20191222

本次更新是一次规模较大的更新，整个项目的版本得到升级，同时引入了多模块、RabbitMQ 等技术栈。

#### 相关文档

34. [两年了，微人事项目迎来了一次重大更新](https://mp.weixin.qq.com/s/Eo2RRB6zKQuPDMWlnCHDrw)

## 其他资料

关注公众号**江南一点雨**，专注于 Spring Boot+微服务，定期视频教程分享，关注后回复 2TB ，领取松哥为你精心准备的超 2TB 免费 Java 学习资源。

![公众号二维码](http://www.javaboy.org/images/sb/javaboy.jpg)

## 参考

- [vue-chat](https://github.com/microzz/vue-chat)

## License

    Copyright 2018 王松

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
 