/*
 Navicat Premium Data Transfer

 Source Server         : 47.98.40.244_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 47.98.40.244:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 27/10/2019 19:57:39
*/

create database if not exists `blog` charset utf8;

use blog;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `art_clz`;
DROP TABLE IF EXISTS `art_tag`;
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
CREATE TABLE `tag`
(
  `id`         bigint       NOT NULL AUTO_INCREMENT,
  `name`       varchar(500) NULL,
  `is_deleted` tinyint      NULL DEFAULT 0,
  PRIMARY KEY (`id`)
)
  COMMENT = '标签';
CREATE TABLE `art_tag`
(
  `id`         bigint  NOT NULL AUTO_INCREMENT,
  `art_id`     bigint  NULL,
  `tag_id`     bigint  NULL,
  `is_deleted` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`)
)
  COMMENT = '文章-标签:多对多';
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
CREATE TABLE `art_clz`
(
  `id`         bigint  NOT NULL AUTO_INCREMENT,
  `art_id`     bigint  NULL,
  `clz_id`     bigint  NULL,
  `is_deleted` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`)
)
  COMMENT = '博文-分类：多对一';
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



ALTER TABLE `art_clz`
  ADD CONSTRAINT `fk_article_art_clz_1` FOREIGN KEY (`art_id`) REFERENCES `article` (`id`);
ALTER TABLE `art_clz`
  ADD CONSTRAINT `fk_classify_art_clz_1` FOREIGN KEY (`clz_id`) REFERENCES `classify` (`id`);
ALTER TABLE `art_tag`
  ADD CONSTRAINT `fk_art_tag_tag_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);
ALTER TABLE `art_tag`
  ADD CONSTRAINT `fk_art_tag_article_1` FOREIGN KEY (`art_id`) REFERENCES `article` (`id`);
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_classify_1` FOREIGN KEY (`clz_id`) REFERENCES `classify` (`id`);
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_article_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

SET FOREIGN_KEY_CHECKS = 1;
