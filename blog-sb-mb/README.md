# blog

### 技术栈

- Springboot 2.2.4
- Apache Shiro 1.4.0
- Logback
- Redis
- Lombok
- Websocket
- MySQL、Mybatis、Mapper、Pagehelper
- Freemarker
- Bootstrap 3.3.0
- wangEditor
- jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck
- 阿里云OSS
- kaptcha
- Qiniu
- webMagic
- ...

### 功能简介

- **多种编辑器**：支持wangEditor和Markdown两种富文本编辑器，可以自行选择
- **自动申请友情链接**：在线申请友情链接，无需站长手动配置，只需申请方添加完站长的连接后自行申请即可
- **百度推送**：支持百度推送功能，加速百度搜索引擎收录博文
- **评论系统**：评论系统，支持显示用户地址、浏览器和os信息，后台可审核评论、开启匿名评论、回复和邮件通知评论
- **权限管理**：后台配备完善的权限管理
- **SEO**：自带robots、sitemap等seo模板，实现自动生成robots和sitemap
- **实时通讯**：管理员可向在线的用户发送实时消息（需用户授权 - 基于websocket实现
- **系统配置支持快速配置**：可通过后台手动修改诸如域名信息、SEO优化、赞赏码、七牛云以及更新维护通知等
- **多种文件存储**：集成七牛云、阿里云OSS，实现文件云存储，同时支持本地文件存储
- **文件搬运工**：集成[blog-hunter](https://gitee.com/yadong.zhang/blog-hunter)实现“文章搬运工”功能，支持一键同步imooc、csdn、iteye或者cnblogs上的文章，可抓取列表和单个文章
- **第三方授权登录**：集成[JustAuth](https://gitee.com/yadong.zhang/JustAuth)实现第三方授权登录

### 模块划分

| 模块  | 释义 | 备注 |
| :------------: | :------------: | :------------: |
| core | 核心业务类模块，提供基本的数据操作、工具处理等 | 该模块只是作为核心依赖包存在 |
| admin | 后台管理模块 | 该模块作为单独项目打包部署 |
| web | 前台模块 | 该模块作为单独项目打包部署 |
| file | 文件存储功能模块 | 支持local、七牛云和阿里云OSS |


# 使用方法(以web项目为例)

1. 使用IDE导入本项目
2. 新建数据库`CREATE DATABASE px_blog;`
3. 导入数据库`docs/db/blog.sql`
4. 初始化数据库`docs/db/init_data.sql`
5. 修改配置文件
   1. 数据库链接属性(在`[core]/resources/config/application-center-{env}.yml`配置文件中搜索`datasource`) 
   2. redis配置(在`[core]/resources/config/application-center-{env}.yml`配置文件中搜索`redis`)
   3. 以上两个必备的配置项修改完成后就能启动项目了。关于其他配置项，请参考后台“系统配置”页面
6. 运行项目(三种方式，任选其一)
   1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true -Ptest`编译打包（注：-Ptest中的test为环境标识），然后cd到blog-web目录下执行`java -jar target/web-1.0.0.jar`
   2. 在`blog-web`项目根目录下执行`mvn spring-boot:run`(注，如果报依赖错误，可在相关的依赖模块先执行install操作)
   3. 直接运行`BlogWebApplication.java`
7. 浏览器访问`http://127.0.0.1:8443`
8. `admin`项目的启动方式与`web`类似，请参考上面的使用说明

