# Spring Boot开发小而美的个人博客

**个人博客功能：**

![GaQzNj.png](https://s1.ax1x.com/2020/04/03/GaQzNj.png)


**技术组合：**

*  后端：Spring Boot + JPA + Jetty + thymeleaf模板
*  数据库：MySQL+H2
*  前端UI：Semantic UI框架

**工具与环境：**

*  IDEA
*  Maven 3
*  JDK 8
*  Jetty

**内容模块：**

*  需求分析与功能规划
*  页面设计与开发
*  技术框架搭建
*  后端管理功能实现
*  前端管理功能实现


### 需求与功能

#### 用户故事

用户故事是敏捷框架中的一种开发方法。可以帮助开发者转换视角，以用户的角度更好的把握需求，从而实现具有商业价值的功能。

>  用户故事最好是用户团队编写

**用户故事模板**：

-  As a (role of user), I want (some feature) so that (some business value).
-  作为一个(某个角色) 使用者，我可以做(某个功能) 事情，如此可以有(某个商业价值) 的好处

**关键点**：角色、功能、商业价值

**举例**：

-  作为一个招聘网站**注册用户**，我想**查看最近3天发布的招聘信息**，以便于**了解最新的招聘信息**。
-  作为公司，可以张贴新工作。



个人博客系统的用户故事：

角色：**普通访客**，**管理员（我）**

*  访客，可以分页查看所有的博客
*  访客，可以快速查看博客数最多的6个分类
*  访客，可以查看所有的分类
*  访客，可以查看某个分类下的博客列表
*  访客，可以快速查看标记博客最多的10个标签
*  访客，可以查看所有的标签
*  访客，可以查看某个标签下的博客列表
*  访客，可以根据年度时间线查看博客列表
*  访客，可以快速查看最新的推荐博客
*  访客，可以用关键字全局搜索博客
*  访客，可以查看单个博客内容
*  访客，可以对博客内容进行评论
*  访客，可以赞赏博客内容
*  访客，可以微信扫码阅读博客内容
*  访客，可以在首页扫描公众号二维码关注我
*  我，可以用户名和密码登录后台管理
*  我，可以管理博客
   *  我，可以发布新博客
   *  我，可以对博客进行分类
   *  我，可以对博客打标签
   *  我，可以修改博客
   *  我，可以删除博客
   *  我，可以根据标题，分类，标签查询博客
*  我，可以管理博客分类
   *  我，可以新增一个分类
   *  我，可以修改一个分类
   *  我，可以删除一个分类
   *  我，可以根据分类名称查询分类
*  我，可以管理标签
   *  我，可以新增一个标签
   *  我，可以修改一个标签
   *  我，可以删除一个标签
   *  我，可以根据名称查询标签

#### 功能规划

![1tT4FU.png](https://s2.ax1x.com/2020/02/02/1tT4FU.png)

### 页面设计与开发

#### 设计

**页面规划：**

前端展示：首页、详情页、分类、标签、归档、关于我

后台管理：模板页

#### 页面开发

[Semantic UI官网](https://semantic-ui.com/)

[Semantic UI中文官网](http://www.semantic-ui.cn/)

[背景图片资源](https://www.toptal.com/designers/subtlepatterns/)

#### 插件集成

[编辑器 Markdown](https://pandao.github.io/editor.md/)

[内容排版 typo.css](https://github.com/sofish/typo.css)

[动画 animate.css](https://daneden.github.io/animate.css/)

[代码高亮 prism](https://github.com/PrismJS/prism)

[目录生成 Tocbot](https://tscanlin.github.io/tocbot/)

[滚动侦测 waypoints](http://imakewebthings.com/waypoints/)

[平滑滚动 jquery.scrollTo](https://github.com/flesler/jquery.scrollTo)

[二维码生成 qrcode.js](https://davidshimjs.github.io/qrcodejs/)

### 框架搭建

>  [IDEA下载 https://www.jetbrains.com/idea/](https://www.jetbrains.com/idea/)

#### 构建与配置

1. 引入依赖

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
       <modelVersion>4.0.0</modelVersion>
       <parent>
           <groupId>org.springframework.boot</groupId>
           <artifactId>spring-boot-starter-parent</artifactId>
           <version>2.2.4.RELEASE</version>
           <relativePath/> <!-- lookup parent from repository -->
       </parent>
       <groupId>com.hyp.learn</groupId>
       <artifactId>blog</artifactId>
       <version>0.0.1-SNAPSHOT</version>
       <name>blog</name>
       <description>Spring Boot开发小而美的个人博客</description>
   
       <properties>
           <java.version>1.8</java.version>
       </properties>
   
       <dependencies>
   
           <!--aop-->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-aop</artifactId>
           </dependency>
           <!--监控-->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-actuator</artifactId>
           </dependency>
   
           <!--jpa-->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-data-jpa</artifactId>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-thymeleaf</artifactId>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-web</artifactId>
           </dependency>
   
           <!--热部署-->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-devtools</artifactId>
               <scope>runtime</scope>
               <optional>true</optional>
           </dependency>
           <!--测试数据库-->
           <dependency>
               <groupId>com.h2database</groupId>
               <artifactId>h2</artifactId>
               <scope>runtime</scope>
           </dependency>
   
           <dependency>
               <groupId>mysql</groupId>
               <artifactId>mysql-connector-java</artifactId>
               <scope>runtime</scope>
           </dependency>
   
           <dependency>
               <groupId>com.alibaba</groupId>
               <artifactId>fastjson</artifactId>
               <version>1.2.62</version>
           </dependency>
   
           <dependency>
               <groupId>org.projectlombok</groupId>
               <artifactId>lombok</artifactId>
               <optional>true</optional>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-test</artifactId>
               <scope>test</scope>
               <exclusions>
                   <exclusion>
                       <groupId>org.junit.vintage</groupId>
                       <artifactId>junit-vintage-engine</artifactId>
                   </exclusion>
               </exclusions>
           </dependency>
   
           <!--markdown-->
   
           <dependency>
               <groupId>com.atlassian.commonmark</groupId>
               <artifactId>commonmark</artifactId>
               <version>0.10.0</version>
           </dependency>
   
           <dependency>
               <groupId>com.atlassian.commonmark</groupId>
               <artifactId>commonmark-ext-heading-anchor</artifactId>
               <version>0.10.0</version>
           </dependency>
           <dependency>
               <groupId>com.atlassian.commonmark</groupId>
               <artifactId>commonmark-ext-gfm-tables</artifactId>
               <version>0.10.0</version>
           </dependency>
       </dependencies>
   
       <build>
           <plugins>
               <plugin>
                   <groupId>org.springframework.boot</groupId>
                   <artifactId>spring-boot-maven-plugin</artifactId>
               </plugin>
           </plugins>
       </build>
   
   </project>
   ```

2. 配置文件

   ```yml
   #application.yml
   spring:
     thymeleaf:
       mode: HTML
     profiles:
       active: dev
     application:
       name: blog-sb
   comment:
     avatar: /images/avatar.png
     
   #application-dev.yml
   spring:
     datasource:
       driver-class-name: org.h2.Driver
       url: jdbc:h2:mem:blog
       username: sa
       password: 123456
       type: com.zaxxer.hikari.HikariDataSource
     jpa:
       hibernate:
         ddl-auto: update
       show-sql: true
     thymeleaf:
       cache: false
   
   logging:
     level:
       root: info
       com.hyp.learn: debug
   
   server:
     port: 8010
   #application-prod.yml
   
   spring:
     datasource:
       driver-class-name: com.mysql.jdbc.Driver
       url: jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8
       username: root
       password: root
     jpa:
       hibernate:
         ddl-auto: update
       show-sql: true
   logging:
     level:
       root: info
       com.hyp.learn: debug
   server:
     port: 8000
     
   #application-test.yml
   spring:
     datasource:
       driver-class-name: org.h2.Driver
       url: jdbc:h2:mem:blog
       username: sa
       password: 123456
       type: com.zaxxer.hikari.HikariDataSource
     jpa:
       hibernate:
         ddl-auto: update
       show-sql: true
   
   
   logging:
     level:
       root: info
       com.hyp.learn: debug
   
   server:
     port: 8010
   
   ```

3. 日志配置文件logback-spring.xml

   ```xml
   <?xml version="1.0" encoding="UTF-8" ?>
   <configuration>
       <!--包含Spring boot对logback日志的默认配置-->
       <include resource="org/springframework/boot/logging/logback/defaults.xml"/>
       <property name="LOG_FILE" value="${LOG_FILE:-${LOG_PATH:-${LOG_TEMP:-${java.io.tmpdir:-/tmp}}}/spring.log}"/>
       <include resource="org/springframework/boot/logging/logback/console-appender.xml"/>
   
       <!--重写了Spring Boot框架 org/springframework/boot/logging/logback/file-appender.xml 配置-->
       <appender name="TIME_FILE"
                 class="ch.qos.logback.core.rolling.RollingFileAppender">
           <encoder>
               <pattern>${FILE_LOG_PATTERN}</pattern>
           </encoder>
           <file>${LOG_FILE}</file>
           <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
               <fileNamePattern>${LOG_FILE}.%d{yyyy-MM-dd}.%i</fileNamePattern>
               <!--保留历史日志一个月的时间-->
               <maxHistory>30</maxHistory>
               <!--
               Spring Boot默认情况下，日志文件10M时，会切分日志文件,这样设置日志文件会在100M时切分日志
               -->
               <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                   <maxFileSize>10MB</maxFileSize>
               </timeBasedFileNamingAndTriggeringPolicy>
   
           </rollingPolicy>
       </appender>
   
       <root level="INFO">
           <appender-ref ref="CONSOLE"/>
           <appender-ref ref="TIME_FILE"/>
       </root>
   
   </configuration>
           <!--
               1、继承Spring boot logback设置（可以在appliaction.yml或者application.properties设置logging.*属性）
               2、重写了默认配置，设置日志文件大小在100MB时，按日期切分日志，切分后目录：
   
                   blog.2017-08-01.0   80MB
                   blog.2017-08-01.1   10MB
                   blog.2017-08-02.0   56MB
                   blog.2017-08-03.0   53MB
                   ......
           -->
   ```

4. sql文件，用户名pingxin,密码：111111

   ```sql
   create table t_blog
   (
     id              bigint                               not null,
     create_date     timestamp  default current_timestamp not null,
     deleted         tinyint(1) default 0                 not null,
     modify_date     timestamp  default current_timestamp not null,
     appreciation    boolean                              not null,
     commentabled    boolean                              not null,
     content         clob,
     description     varchar(255),
     first_picture   varchar(255),
     flag            varchar(255),
     published       boolean                              not null,
     recommend       boolean                              not null,
     share_statement boolean                              not null,
     title           varchar(255),
     views           integer,
     type_id         bigint,
     user_id         bigint,
     primary key (id)
   );
   
   create table t_blog_tags
   (
     blogs_id bigint not null,
     tags_id  bigint not null
   );
   
   create table t_comment
   (
     id                bigint                               not null,
     create_date       timestamp  default current_timestamp not null,
     deleted           tinyint(1) default 0                 not null,
     modify_date       timestamp  default current_timestamp not null,
     admin_comment     boolean                              not null,
     avatar            varchar(255),
     content           varchar(255),
     email             varchar(255),
     nickname          varchar(255),
     blog_id           bigint,
     parent_comment_id bigint,
     primary key (id)
   );
   
   create table t_tag
   (
     id          bigint                               not null,
     create_date timestamp  default current_timestamp not null,
     deleted     tinyint(1) default 0                 not null,
     modify_date timestamp  default current_timestamp not null,
     name        varchar(255),
     primary key (id)
   );
   
   create table t_type
   (
     id          bigint                               not null,
     create_date timestamp  default current_timestamp not null,
     deleted     tinyint(1) default 0                 not null,
     modify_date timestamp  default current_timestamp not null,
     name        varchar(255),
     primary key (id)
   );
   
   create table t_user
   (
     id          bigint                               not null,
     create_date timestamp  default current_timestamp not null,
     deleted     tinyint(1) default 0                 not null,
     modify_date timestamp  default current_timestamp not null,
     avatar      varchar(255),
     email       varchar(255),
     nickname    varchar(255),
     password    varchar(255),
     type        integer,
     username    varchar(255),
     primary key (id)
   );
   
   create sequence hibernate_sequence start with 1 increment by 1;
   
   alter table t_blog
     add constraint FK292449gwg5yf7ocdlmswv9w4j foreign key (type_id) references t_type;
   
   alter table t_blog
     add constraint FK8ky5rrsxh01nkhctmo7d48p82 foreign key (user_id) references t_user;
   
   alter table t_blog_tags
     add constraint FK5feau0gb4lq47fdb03uboswm8 foreign key (tags_id) references t_tag;
   
   alter table t_blog_tags
     add constraint FKh4pacwjwofrugxa9hpwaxg6mr foreign key (blogs_id) references t_blog;
   alter table t_comment
     add constraint FKke3uogd04j4jx316m1p51e05u foreign key (blog_id) references t_blog;
   alter table t_comment
     add constraint FK4jj284r3pb7japogvo6h72q95 foreign key (parent_comment_id) references t_comment;
   
   
   insert into t_type(id, name)
   values (1, '编程'),
          (2, '算法'),
          (3, '周记');
   insert into t_tag(id, name)
   values (1, 'Java'),
          (2, 'Linux'),
          (3, 'MySQL');
          
   insert into t_user(id, username, nickname, email, avatar, password, type)
   values (1, 'pingxin', '平心', 'm13839441583@163.com', 'https://s2.ax1x.com/2020/01/05/lBOWkV.png',
           '96e79218965eb72c92a549dd5a330112', 1);
   
   insert into t_blog (id, appreciation, commentabled, content, description, first_picture, flag, published, recommend,
                       share_statement, title, views, type_id, user_id)
   values (1, 1, 1, '#Spring Boot开发小而美的个人博客', '个人博客：基于Spring Boot的完整全栈式的开发套路', 'https://s2.ax1x.com/2020/01/05/lBOWkV.png',
           '', 1, 1, 1, 'Spring Boot开发小而美的个人博客', 0, 3, 1);
   
   ```

具体项目内容参考：<https://github.com/hanyunpeng0521/blog/tree/master/blog-sb>

#### 页面处理

**1、静态页面导入project**

**2、thymeleaf布局**

*  定义fragment
*  使用fragment布局

**3、错误页面美化**

4、设计与规范

#### 实体设计

**实体类：**

*  博客 Blog
*  博客分类 Type
*  博客标签 Tag
*  博客评论 Comment
*  用户 User

**实体关系：**

![1NSAJI.png](https://s2.ax1x.com/2020/02/02/1NSAJI.png)

**评论类自关联关系：**

![1NSQoj.png](https://s2.ax1x.com/2020/02/02/1NSQoj.png)

**Blog类：**

![1NS8Wq.png](https://s2.ax1x.com/2020/02/02/1NS8Wq.png)

**Type类：**

![1NStyT.png](https://s2.ax1x.com/2020/02/02/1NStyT.png)

**Tag类：**

![1NSTpt.png](https://s2.ax1x.com/2020/02/02/1NSTpt.png)

**Comment类：**

![1NSX7Q.png](https://s2.ax1x.com/2020/02/02/1NSX7Q.png)

**User类：**

![1Npu1x.png](https://s2.ax1x.com/2020/02/02/1Npu1x.png)

#### 应用分层

![1N9F2t.png](https://s2.ax1x.com/2020/02/02/1N9F2t.png)

#### 命名约定

**Service/DAO层命名约定：**

*  获取单个对象的方法用get做前缀。
*  获取多个对象的方法用list做前缀。
*  获取统计值的方法用count做前缀。
*  插入的方法用save(推荐)或insert做前缀。
*  删除的方法用remove(推荐)或delete做前缀。
*  修改的方法用update做前缀。

