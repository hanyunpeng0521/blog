
create database if not exists `blog` charset utf8;

use blog;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `article`;
DROP TABLE IF EXISTS `classify`;
DROP TABLE IF EXISTS `comment`;
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
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_article_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

SET FOREIGN_KEY_CHECKS = 1;
