**最新版部署视频教程：[前后端分离项目(微人事)常见部署问题汇总](https://mp.weixin.qq.com/s/dcJv6BIVFPnokI8nBf4IrQ)**

#### 1.1 下载问题

有两个地方可以下载到最新版的微人事，如果在 GitHub 上下载失败，也可以从 Gitee 上下载。

- GitHub：[https://github.com/lenve/vhr](https://github.com/lenve/vhr)
- Gitee：[https://gitee.com/lenve/vhr](https://gitee.com/lenve/vhr)

#### 1.2 提前准备

准备三样东西：

- 空的 vhr 数据库
- redis
- rabbitmq

#### 1.3 项目导入

项目的 Maven 依赖下载失败，可以参考这篇文章：

[依赖下载失败解决方案](https://mp.weixin.qq.com/s/6PPYwrNestz-gvmB4ZkAqQ)

#### 1.4 项目配置

vhrserver 的 web  模块 application.properties 中配置三样：

- 数据库连接
- redis
- rabbitmq

启动 vhr-web 模块。如果只是看效果，可以不启动 mailserver 模块（如果要启动 mailserver，一定先配置 mailserver 的 redis，rabbitmq 以及 邮件发送配置信息，邮件发送配置，可以参考这篇文章：[Spring Boot 中邮件发送](https://mp.weixin.qq.com/s/FKyQNyPDQY8O25Hk2x7rKg)）。

#### 1.5 二次开发

这个需要部署前端。前端在运行时，需要准备一个 nodejs。

用 webstorm 打开下载的前端项目。

前端项目打开后，需要在项目根目录下，执行 npm install。

默认安装比较慢，可以修改为淘宝的源。[下载源修改为淘宝](https://mp.weixin.qq.com/s/HWRYAR16vLE1XFep6_i1tA)

npm install  执行成功后，再执行 npm run serve 启动前端项目。

二次开发完成后，执行 npm run build 前端编译打包。把打包后的文件拷贝到后端。

上线部署参考这篇文章：[手把手教你部署前后端分离项目，再也不用担心跨域问题了](https://mp.weixin.qq.com/s/KWBtHi_au_1pH70OYptjfA)