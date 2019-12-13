**本项目为个人博客项目,如有类同，纯属巧合，多多交流：m13839441583@163.com**

### 开发流程

做什么事都需要一个流程，软件开发也不例外。

那么，一个软件从无到有到底是怎么开发的？一个软件产品的结果为什么是这样？为什么开发的速度不能再快一点。**为什么程序员大多秃顶**？他们有那么忙吗？完整的软件开发流程是怎样的？

#### 公司流程

首先我们看一下大部分公司的开发流程：

**项目启动**

1. 产品经理和项目干系人确定项目方向，产品型项目的干系人包括公司领导、产品总监、技术总监等，项目的话则包括客户方领导、主要执行人等。

2. 公司领导确认项目组团队组成，包括产品经理、研发项目经理、研发工程师、测试团队等。

3. 产品经理进行需求调研，编写《需求调研》文档。需求调研的方式主要有背景资料调查和访谈。

**需求阶段**

1. 清晰认识项目是为了解决什么用户痛点，行业需求？

2. 产品经理面向整个团队，进行需求的讲解。

3. 分析要解决这些痛点或者需求的过程中需要通过哪些有效的功能布局去实施，逐一将核心功能列举并适当完善一下，通过文字或图文的方式描述清楚。

4. 研发工程师按照各自的分工，进入概要需求阶段。《概要需求》旨在让研发工程师初步理解业务，评估技术可行性。

**设计阶段**

1. 原型图经过反复推敲修正后，UI 设计师会进行UI界面相关的配色设计、功能具象化处理、交互设计、以及各种机型、系统的适配。UI设计师经过多次与项目经理沟通修改后，最终到定稿的设计图。

2. 绝大部分APP项目都会有相应的管理后台，虽然后台是用户无法接触到的，但是与APP的功能是对照的，合理的设计能让后台管理人员快速上手。

3. 研发工程师完成《概要设计》、《通讯协议》及《表结构设计》，及完成正式编码前的一系列研发设计工作

**开发阶段**

经过以上几个过程之后，会正式进入到开发阶段，一个完整的 APP 项目一般包含以下几个板块：

1. 服务器端：编写接口协议文档，服务器环境架设（国内一般都是用阿里云服务器，国外一般用亚马逊），设计数据库和编写API接口。

2. APP端：根据UI设计图进行界面开发，UI开发完成则进入和服务端接口对接，通过服务端的接口获取数据，编写功能上的逻辑代码。

3. Web管理端：根据前端的业务逻辑，后台会有相应的功能与之匹配，同样需要编写功能上的逻辑代码。

**测试阶段**

APP功能开发完成之后，测试人员会对整项目进行系统性测试。这个环节会调动起项目组内所有人相关人员。而测试这个环节的重要性不亚于前期功能的规划，如果团队没有经过专业系统性训练的测试人员，很可能会导致项目出现与设计初衷存在落差，以及遗漏下一些逻辑上的坑。

**系统上线**

与客户或者上级达成一致后，系统进行试运行，稳定后上线。

**系统维护**

没有十全十美的软件，系统的一些问题会随着使用来逐渐暴露出来，这些问题不能够影响客户和用户的使用，因此系统维护比开发和测试耗费更多时间和人力

#### 我的流程

因为这是我的个人项目，所以上面公司开发流程都由我自己一人扮演。

##### 项目启动

启动原因：个人学习练手，提高动手能力，丰富见解。

项目优点：技术简单切成熟，有对照对象，具有可行性。

项目缺点：用户少。

项目介绍：个人博客系统，使用java web进行开发，部署到云主机上。能让用户进行博客的发布和查看。

##### 需求分析

使用工具<https://www.processon.com>

功能需求：

![UTOOLS1572078284509.png](https://i.loli.net/2019/10/26/B2W6x8auSXOVAwI.png)

扩展功能（设计中）：

1. 后台管理
2. 爬虫爬取用户关注的其他博客
3. 换用框架
4. 支持移动端
5. 支持markdown语法编辑和显示:https://www.jianshu.com/p/0f9dc9e808b6
7. 部署到自己的服务器上并绑定域名。


##### 技术选型

架构：MVC 模式

1. 开发环境（第一版）
   
   开发语言/框架：java+jsp+java bean+dbutils

   开发工具：IntelliJ idea 2018.3+JDK 8+Maven 3.6.1+Navicat

   测试工具：Postman+jmeter
   
   缺点与改进：
   
   - 实体类重复操作且修改复杂：使用lombok注释
   - 实体类和数据库表项对应要求严格：dbUtils在BeanResultHandle构造函数使用`new BasicRowProcessor(new GenerousBeanProcessor())`；使用ORM框架
   - DAO层代码冗余：使用ORM框架
   - 实体之间的外键需要建立专门的查询方法:使用ORM框架
   - 日志配置复杂：使用AOP，未加入系统的syslog
   
2. 开发环境（第二版SSM）
   
   开发语言/框架：java+Spring+Spring MVC+Mybatis

   开发工具：IntelliJ idea 2018.3+JDK 8+Maven 3.6.1+Navicat

   测试工具：Postman+jmeter
   
3. 开发环境（第三版）
      
    开发语言/框架：java+Spring boot+Spring cloud
    
    开发工具：IntelliJ idea 2018.3+JDK 8+Maven 3.6.1+Navicat
    
    测试工具：Postman+jmeter

4. 部署环境(最后一版进行部署，在同一主机上进行模拟)

   操作系统：CentOS 7.5

   数据库： mysql 8.0/mariadb 10.4+二从一主/读写分离

   服务器：2台tomcat 8+1台nginx 1.6.1+1台redis 5.0.4缓存

   日志系统：ELK（ElasticSearch、Logstash、Kibana）

   监控系统：zebbix+grafanra+cacti+nagios

##### 数据库设计

###### 第一版 

![UTOOLS1576147785921.png](https://img02.sogoucdn.com/app/a/100520146/f694e8a2e5c06e499885e3e2537e0795)

user:用户信息，与博文一对多

article：博文,与用户多对一，与类别多对一

classify：博文类别，与博文一对多

comment：博文评论，与博文多对一，与用户多对一

```sql
-- mysql 建表语句
create database if not exists `blog` charset utf8;

use blog;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `article`;
DROP TABLE IF EXISTS `classify`;
DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `tag`;
DROP TABLE IF EXISTS `user`;


CREATE TABLE `article`
(
  `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title`         varchar(255) NULL,
  `context`       text         NULL,
  `create_time`   timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` datetime     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted`    tinyint      NULL DEFAULT 0,
  `user_id`       bigint       NULL,
  `user_name`     varchar(255) NULL,
  `clz_id`        bigint       NULL,
  `clz_name`      varchar(255) NULL,
  PRIMARY KEY (`id`)
)
  COMMENT = '文章';
CREATE TABLE `comment`
(
  `id`          bigint       NOT NULL AUTO_INCREMENT,
  `user_id`     bigint       NULL,
  `user_name`   varchar(255) NULL,
  `article_id`  bigint       NULL,
  `context`     text         NULL COMMENT '评论内容',
  `create_time` timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted`  tinyint      NULL DEFAULT 0,
  PRIMARY KEY (`id`)
)
  COMMENT = '评论';
CREATE TABLE `classify`
(
  `id`         bigint       NOT NULL AUTO_INCREMENT,
  `user_id`    bigint(11)   NULL,
  `name`       varchar(500) NULL,
  `level`      int          NULL,
  `is_deleted` tinyint      NULL DEFAULT 0,
  PRIMARY KEY (`id`)
)
  COMMENT = '分类';
CREATE TABLE `user`
(
  `id`          bigint       NOT NULL AUTO_INCREMENT,
  `name`        varchar(255) NOT NULL,
  `passwd`      varchar(500) NOT NULL,
  `is_deleted`  tinyint      NULL DEFAULT 0,
  `create_time` timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday`    datetime     NULL,
  PRIMARY KEY (`id`)
)
  COMMENT = '用户';



ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_classify_1` FOREIGN KEY (`clz_id`) REFERENCES `classify` (`id`);
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
ALTER TABLE `classify`
    ADD CONSTRAINT `fk_classify_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_article_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

SET FOREIGN_KEY_CHECKS = 1;
```

###### 第二版 




