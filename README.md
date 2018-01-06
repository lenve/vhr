微人事是一个前后端分离的人力资源管理系统，项目采用SpringBoot+Vue开发。  


演示地址：  

项目地址：[https://github.com/lenve/vhr](https://github.com/lenve/vhr)   


## tips 

由于整个项目功能比较多，也比较复杂，因此分多期开发，目前第一期权限管理模块已经开发完成，其他模块还在开发当中。考虑到权限管理模块相对独立，和其他模块的功能并不冲突，同时前后端分离之后的权限管理又是许多小伙伴的痛点，因此将本项目提前开源供小伙伴们研究。**但是小伙伴们需要注意的是，目前只有权限管理模块完工了，因此这个项目中你无法看到所有的功能，除了权限管理相关的模块。权限管理相关的模块主要有两个，分别是  [系统管理->基础信息设置->权限组]  可以管理角色和资源的关系， [系统管理->操作员管理]  可以管理用户和角色的关系。**  


## 技术栈

### 后端技术栈

1.SpringBoot  
2.SpringSecurity  
3.MyBatis  
4.MySQL  

### 前端技术栈

1.Vue  
2.ElementUI  
3.axios  
4.vue-router  

还有其他一些琐碎的技术就不一一列举了。  

## 快速部署

1.clone项目到本地```git@github.com:lenve/vhr.git```  

2.数据库脚本放在hrserver项目的resources目录下，在MySQL中执行数据库脚本  

3.数据库配置在hrserver项目的resources目录下的application.properties文件中  

4.在IntelliJ IDEA中运行hrserver项目  

**OK，至此，服务端就启动成功了，此时我们直接在地址栏输入```http://localhost:8082/index.html```即可访问我们的项目，如果要做二次开发，请继续看第五、六步。**  

5.进入到vuehr目录中，在命令行依次输入如下命令：  

```
# 安装依赖
npm install

# 在 localhost:8080 启动项目
npm run dev
```  

由于我在vuehr项目中已经配置了端口转发，将数据转发到SpringBoot上，因此项目启动之后，在浏览器中输入```http://localhost:8080```就可以访问我们的前端项目了，所有的请求通过端口转发将数据传到SpringBoot中（注意此时不要关闭SpringBoot项目）。  

6.最后可以用WebStorm等工具打开vuehr项目，继续开发，开发完成后，当项目要上线时，依然进入到vuehr目录，然后执行如下命令：  

```
npm run build
```  

该命令执行成功之后，vuehr目录下生成一个dist文件夹，将该文件夹中的两个文件static和index.html拷贝到SpringBoot项目中resources/static/目录下，然后就可以像第4步那样直接访问了。  


**步骤5中需要大家对NodeJS、NPM等有一定的使用经验，不熟悉的小伙伴可以先自行搜索学习下，推荐[Vue官方教程](https://cn.vuejs.org/v2/guide/)。**  


## 文档

文档是对项目开发过程中遇到的一些问题的详细记录，主要是为了帮助没有基础的小伙伴快速理解这个项目。  

1.[权限数据库设计](https://github.com/lenve/vhr/wiki/1.%E6%9D%83%E9%99%90%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1)  
2.[服务端环境搭建](https://github.com/lenve/vhr/wiki/2.%E6%9C%8D%E5%8A%A1%E7%AB%AF%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA)  
3.[动态处理角色和资源的关系](https://github.com/lenve/vhr/wiki/3.%E5%8A%A8%E6%80%81%E5%A4%84%E7%90%86%E8%A7%92%E8%89%B2%E5%92%8C%E8%B5%84%E6%BA%90%E7%9A%84%E5%85%B3%E7%B3%BB)  
4.[密码加密并加盐](https://github.com/lenve/vhr/wiki/4.%E5%AF%86%E7%A0%81%E5%8A%A0%E5%AF%86%E5%B9%B6%E5%8A%A0%E7%9B%90)  
5.[服务端异常的统一处理](https://github.com/lenve/vhr/wiki/5.%E6%9C%8D%E5%8A%A1%E7%AB%AF%E5%BC%82%E5%B8%B8%E7%9A%84%E7%BB%9F%E4%B8%80%E5%A4%84%E7%90%86)  
6.[axios请求封装,请求异常统一处理](https://github.com/lenve/vhr/wiki/6.axios%E8%AF%B7%E6%B1%82%E5%B0%81%E8%A3%85,%E8%AF%B7%E6%B1%82%E5%BC%82%E5%B8%B8%E7%BB%9F%E4%B8%80%E5%A4%84%E7%90%86)  
7.[将请求方法挂到Vue上](https://github.com/lenve/vhr/wiki/7.%E5%B0%86%E8%AF%B7%E6%B1%82%E6%96%B9%E6%B3%95%E6%8C%82%E5%88%B0Vue%E4%B8%8A)  
8.[登录状态的保存](https://github.com/lenve/vhr/wiki/8.%E7%99%BB%E5%BD%95%E7%8A%B6%E6%80%81%E7%9A%84%E4%BF%9D%E5%AD%98)  
9.[登录成功后动态加载组件](https://github.com/lenve/vhr/wiki/9.%E7%99%BB%E5%BD%95%E6%88%90%E5%8A%9F%E5%90%8E%E5%8A%A8%E6%80%81%E5%8A%A0%E8%BD%BD%E7%BB%84%E4%BB%B6)  
10.[角色资源关系管理](https://github.com/lenve/vhr/wiki/10.%E8%A7%92%E8%89%B2%E8%B5%84%E6%BA%90%E5%85%B3%E7%B3%BB%E7%AE%A1%E7%90%86)  
11.[用户角色关系管理](https://github.com/lenve/vhr/wiki/11.%E7%94%A8%E6%88%B7%E8%A7%92%E8%89%B2%E5%85%B3%E7%B3%BB%E7%AE%A1%E7%90%86)  