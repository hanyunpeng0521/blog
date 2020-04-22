/*
 Navicat Premium Data Transfer

 Source Server         : 172.17.0.3_3306
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 172.17.0.2:3306
 Source Schema         : px_blog

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 22/04/2020 23:30:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for px_article
-- ----------------------------
DROP TABLE IF EXISTS `px_article`;
CREATE TABLE `px_article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章标题',
  `user_id` bigint unsigned NOT NULL COMMENT '用户ID',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章封面图片',
  `qrcode_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章专属二维码地址',
  `is_markdown` tinyint unsigned DEFAULT '1',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '文章内容',
  `content_md` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'markdown版的文章内容',
  `top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `type_id` bigint unsigned NOT NULL COMMENT '类型',
  `status` tinyint unsigned DEFAULT NULL COMMENT '状态',
  `recommended` tinyint unsigned DEFAULT '0' COMMENT '是否推荐',
  `original` tinyint unsigned DEFAULT '1' COMMENT '是否原创',
  `description` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章简介，最多200字',
  `keywords` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint unsigned DEFAULT '1' COMMENT '是否开启评论',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_article
-- ----------------------------
BEGIN;
INSERT INTO `px_article` VALUES (3, '图书馆文明摆放自行车', 1, '', NULL, 1, '<p>图书馆文明摆放自行车</p>\n', '图书馆文明摆放自行车', 0, 3, 1, 1, 1, '123', '123', 1, '2020-04-22 15:07:03', '2020-04-22 15:07:11');
COMMIT;

-- ----------------------------
-- Table structure for px_article_look
-- ----------------------------
DROP TABLE IF EXISTS `px_article_look`;
CREATE TABLE `px_article_look` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户IP',
  `look_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_article_look
-- ----------------------------
BEGIN;
INSERT INTO `px_article_look` VALUES (2, 3, NULL, '0:0:0:0:0:0:0:1', '2020-04-22 15:19:12', '2020-04-22 15:19:12', '2020-04-22 15:19:12');
INSERT INTO `px_article_look` VALUES (3, 3, NULL, '0:0:0:0:0:0:0:1', '2020-04-22 15:23:53', '2020-04-22 15:23:53', '2020-04-22 15:23:53');
INSERT INTO `px_article_look` VALUES (4, 3, NULL, '0:0:0:0:0:0:0:1', '2020-04-22 15:26:57', '2020-04-22 15:26:57', '2020-04-22 15:26:57');
COMMIT;

-- ----------------------------
-- Table structure for px_article_love
-- ----------------------------
DROP TABLE IF EXISTS `px_article_love`;
CREATE TABLE `px_article_love` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户IP',
  `love_time` datetime DEFAULT NULL COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_article_love
-- ----------------------------
BEGIN;
INSERT INTO `px_article_love` VALUES (1, 3, NULL, '0:0:0:0:0:0:0:1', '2020-04-22 15:24:17', '2020-04-22 15:24:17', '2020-04-22 15:24:17');
COMMIT;

-- ----------------------------
-- Table structure for px_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `px_article_tags`;
CREATE TABLE `px_article_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint unsigned NOT NULL COMMENT '标签表主键',
  `article_id` bigint unsigned NOT NULL COMMENT '文章ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_article_tags
-- ----------------------------
BEGIN;
INSERT INTO `px_article_tags` VALUES (4, 2, 4, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_article_tags` VALUES (5, 5, 3, '2020-04-22 15:07:03', '2020-04-22 15:07:03');
COMMIT;

-- ----------------------------
-- Table structure for px_comment
-- ----------------------------
DROP TABLE IF EXISTS `px_comment`;
CREATE TABLE `px_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint DEFAULT NULL COMMENT '被评论的文章或者页面的ID',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '评论人的ID',
  `pid` bigint unsigned DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` enum('VERIFYING','APPROVED','REJECT','DELETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'VERIFYING' COMMENT '评论的状态',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int unsigned DEFAULT '0' COMMENT '支持（赞）',
  `oppose` int unsigned DEFAULT '0' COMMENT '反对（踩）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_comment
-- ----------------------------
BEGIN;
INSERT INTO `px_comment` VALUES (2, -1, NULL, 0, '', '匿名', 'http://localhost:8443/img/random/user/1.jpg', '', '', 'APPROVED', '0:0:0:0:0:0:0:1', NULL, NULL, '未知', 'Linux', NULL, 'Opera 64.0.3417.61', NULL, '<p>世事无常，人走茶凉</p>', '', 1, 0, '2020-04-22 15:27:24', '2020-04-22 15:27:56');
COMMIT;

-- ----------------------------
-- Table structure for px_file
-- ----------------------------
DROP TABLE IF EXISTS `px_file`;
CREATE TABLE `px_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `storage_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `suffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_start_time` datetime DEFAULT NULL,
  `upload_end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for px_tags
-- ----------------------------
DROP TABLE IF EXISTS `px_tags`;
CREATE TABLE `px_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_tags
-- ----------------------------
BEGIN;
INSERT INTO `px_tags` VALUES (1, 'Linux', NULL, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_tags` VALUES (2, 'Java', NULL, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_tags` VALUES (3, 'Spring', NULL, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_tags` VALUES (4, 'Spring Boot', NULL, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_tags` VALUES (5, '其他', NULL, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
COMMIT;

-- ----------------------------
-- Table structure for px_type
-- ----------------------------
DROP TABLE IF EXISTS `px_type`;
CREATE TABLE `px_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint unsigned DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型介绍',
  `sort` int DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `available` tinyint unsigned DEFAULT '1' COMMENT '是否可用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of px_type
-- ----------------------------
BEGIN;
INSERT INTO `px_type` VALUES (1, NULL, '前端技术', '主要收集、整理的基础前端类文章，包括JS、jQuery和CSS等Web开发所需的基础的文章总结', 1, 'fa fa-css3', 1, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_type` VALUES (2, NULL, '后端技术', '网站中记录的后端类文章，包括Java、SSM、MySQL和其他在日常工作学习中所用的后端技术', 2, 'fa fa-coffee', 1, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `px_type` VALUES (3, NULL, '其他文章', '记录网站建设以及日常工作、学习中的闲言碎语和个人笔记等文章', 3, 'fa fa-folder-open-o', 1, '2020-03-24 06:01:59', '2020-03-24 06:01:59');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置关键字',
  `config_value` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '配置项内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'homeDesc', 'PxBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。', '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `sys_config` VALUES (2, 'homeKeywords', 'PxBlog,开源博客', '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `sys_config` VALUES (3, 'domain', 'hanyunpeng0521.github.io', '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `sys_config` VALUES (4, 'cmsUrl', 'http://localhost:8085', '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `sys_config` VALUES (5, 'siteUrl', 'http://localhost:8443', '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `sys_config` VALUES (6, 'siteName', 'PxBlog开源博客', '2020-03-24 06:01:59', '2020-03-24 06:01:59');
INSERT INTO `sys_config` VALUES (7, 'siteDesc', 'PxBlog是一款简洁美观、自适应的Java博客系统', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (8, 'siteFavicon', 'http://localhost:8443/img/favicon.ico', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (9, 'staticWebSite', 'http://localhost:8443', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (10, 'authorName', '平心', '2020-03-24 06:02:00', '2020-04-22 15:26:51');
INSERT INTO `sys_config` VALUES (11, 'authorEmail', 'm13839441583#163.com', '2020-03-24 06:02:00', '2020-04-22 15:26:51');
INSERT INTO `sys_config` VALUES (12, 'wxCode', 'https://s1.ax1x.com/2020/03/23/8H4n3Q.png', '2020-03-24 06:02:00', '2020-04-22 15:26:51');
INSERT INTO `sys_config` VALUES (13, 'qq', '1670787053', '2020-03-24 06:02:00', '2020-04-22 15:26:51');
INSERT INTO `sys_config` VALUES (14, 'weibo', 'XXX', '2020-03-24 06:02:00', '2020-04-22 15:26:51');
INSERT INTO `sys_config` VALUES (15, 'github', 'https://github.com/hanyunpeng0521', '2020-03-24 06:02:00', '2020-04-22 15:26:51');
INSERT INTO `sys_config` VALUES (16, 'maintenance', '0', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (17, 'maintenanceDate', '2020-03-24 06:02:00', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (18, 'comment', '1', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (19, 'qiniuBasePath', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (20, 'qiniuAccessKey', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (21, 'qiniuSecretKey', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (22, 'qiniuBucketName', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (23, 'baiduPushToken', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (24, 'wxPraiseCode', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (25, 'zfbPraiseCode', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (26, 'baiduApiAk', NULL, '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (27, 'spiderConfig', '{\r\n            imooc: {\r\n                domain: \"www.imooc.com\",\r\n                titleRegex: \"//span[@class=js-title]/html()\",\r\n                authorRegex: \"//div[@class=name_con]/p[@class=name]/a[@class=nick]/html()\",\r\n                releaseDateRegex: \"//div[@class=\'dc-profile\']/div[@class=\'l\']/span[@class=\'spacer\']/text()\",\r\n                contentRegex: \"//div[@class=detail-content]/html()\",\r\n                targetLinksRegex: \"/article/[0-9]{1,10}\",\r\n                tagRegex: \"//div[@class=cat-box]/div[@class=cat-wrap]/a[@class=cat]/html()\",\r\n                header: [\r\n                    \"Host=www.imooc.com\",\r\n                    \"Referer=https://www.imooc.com\"\r\n                ],\r\n                entryUrls: \'https://www.imooc.com/u/{uid}/articles?page={curPage}\'\r\n            },\r\n            csdn: {\r\n                domain: \"blog.csdn.net\",\r\n                titleRegex: \"//h1[@class=title-article]/html()\",\r\n                authorRegex: \"//a[@class=follow-nickName]/html()\",\r\n                releaseDateRegex: \"//div[@class=\'article-bar-top\']/span[@class=\'time\']/text()\",\r\n                contentRegex: \"//div[@class=article_content]/html()\",\r\n                targetLinksRegex: \".*blog\\\\.csdn\\\\.net/{uid}/article/details/[0-9a-zA-Z]{1,15}\",\r\n                tagRegex: \"//span[@class=artic-tag-box]/a[@class=tag-link]/html()\",\r\n                header: [\r\n                    \"Host=blog.csdn.net\",\r\n                    \"Referer=https://blog.csdn.net/{uid}/article/list/1\"\r\n                ],\r\n                entryUrls: \'https://blog.csdn.net/{uid}/article/list/{curPage}\'\r\n            },\r\n            iteye: {\r\n                domain: \"{uid}.iteye.com\",\r\n                titleRegex: \"//div[@class=blog_title]/h3/a/html()\",\r\n                authorRegex: \"//div[@id=blog_owner_name]/html()\",\r\n                releaseDateRegex: \"//div[@class=blog_bottom]/ul/li/html()\",\r\n                contentRegex: \"//div[@class=blog_content]/html()\",\r\n                targetLinksRegex: \".*{uid}\\\\.iteye\\\\.com/blog/[0-9]+\",\r\n                tagRegex: \"//div[@class=news_tag]/a/html()\",\r\n                header: [\r\n                    \"Host={uid}.iteye.com\",\r\n                    \"Referer=http://{uid}.iteye.com/\"\r\n                ],\r\n                entryUrls: \'http://{uid}.iteye.com/?page={curPage}\'\r\n            },\r\n            csblogs: {\r\n                domain: \"www.cnblogs.com\",\r\n                titleRegex: \"//a[@id=cb_post_title_url]/html()\",\r\n                authorRegex: \"//div[@class=postDesc]/a[1]/html()\",\r\n                releaseDateRegex: \"//span[@id=post-date]/html()\",\r\n                contentRegex: \"//div[@id=cnblogs_post_body]/html()\",\r\n                targetLinksRegex: \".*www\\\\.cnblogs\\\\.com/{uid}/p/[\\\\w\\\\d]+\\\\.html\",\r\n                tagRegex: \"//div[@id=EntryTag]/a/html()\",\r\n                header: [\r\n                    \"Host=www.cnblogs.com\",\r\n                    \"Referer=https://www.cnblogs.com/\"\r\n                ],\r\n                entryUrls: \'https://www.cnblogs.com/{uid}/default.html?page={curPage}\'\r\n            }\r\n        }', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (28, 'anonymous', '1', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (29, 'editorPlaceholder', '说点什么吧', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (30, 'editorAlert', '讲文明、要和谐', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (31, 'defaultUserAvatar', '[\r\n	\"http://localhost:8443/img/random/user/1.jpg\",\r\n	\"http://localhost:8443/img/random/user/2.jpg\",\r\n	\"http://localhost:8443/img/random/user/3.jpg\",\r\n	\"http://localhost:8443/img/random/user/4.jpg\",\r\n	\"http://localhost:8443/img/random/user/5.jpg\",\r\n	\"http://localhost:8443/img/random/user/6.jpg\",\r\n	\"http://localhost:8443/img/random/user/7.jpg\",\r\n	\"http://localhost:8443/img/random/user/8.jpg\",\r\n	\"http://localhost:8443/img/random/user/9.jpg\",\r\n	\"http://localhost:8443/img/random/user/10.jpg\",\r\n	\"http://localhost:8443/img/random/user/11.jpg\",\r\n	\"http://localhost:8443/img/random/user/12.jpg\",\r\n	\"http://localhost:8443/img/random/user/13.jpg\",\r\n	\"http://localhost:8443/img/random/user/14.jpg\",\r\n	\"http://localhost:8443/img/random/user/15.jpg\",\r\n	\"http://localhost:8443/img/random/user/16.jpg\",\r\n	\"http://localhost:8443/img/random/user/17.jpg\",\r\n	\"http://localhost:8443/img/random/user/18.jpg\",\r\n	\"http://localhost:8443/img/random/user/19.jpg\",\r\n	\"http://localhost:8443/img/random/user/20.jpg\"\r\n]', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (32, 'sessionTimeOut', '5', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (33, 'sessionTimeOutUnit', 'MINUTES', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (34, 'loginRetryNum', '5', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (35, 'installdate', '2020-03-24 06:02:00', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (36, 'copyright', 'Copyright hanyunpeng0521.github.io', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (37, 'dynamicTitle', '您有一条新消息', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
INSERT INTO `sys_config` VALUES (38, 'articleEditor', 'md', '2020-04-22 14:40:35', '2020-04-22 14:40:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态',
  `home_page_display` tinyint unsigned DEFAULT '1' COMMENT '是否首页显示',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
BEGIN;
INSERT INTO `sys_link` VALUES (1, 'https://hanyunpeng0521.githun.io', '韩云朋博客', '一个年轻程序员的个人博客', 'XXX@gmail.com', NULL, 'https://hanyunpeng0521.github.io/img/favicon.ico', 1, 1, NULL, 'ADMIN', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `type` enum('SYSTEM','VISIT','ERROR') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SYSTEM' COMMENT '日志类型（系统操作日志，用户访问日志，异常记录日志）',
  `log_level` enum('ERROR','WARN','INFO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'INFO' COMMENT '日志级别',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志内容（业务操作）',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求参数（业务操作）',
  `spider_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '爬虫类型（当访问者被鉴定为爬虫时该字段表示爬虫的类型）',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作用户的ip',
  `ua` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作用户的user_agent',
  `os` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论时的系统类型',
  `browser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论时的浏览器类型',
  `request_url` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求的路径',
  `referer` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求来源地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-24 06:04:30', '2020-03-24 06:04:30');
INSERT INTO `sys_log` VALUES (2, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:40:26', '2020-03-24 14:40:26');
INSERT INTO `sys_log` VALUES (3, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:42:27', '2020-03-24 14:42:27');
INSERT INTO `sys_log` VALUES (4, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:43:24', '2020-03-24 14:43:24');
INSERT INTO `sys_log` VALUES (5, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:45:31', '2020-03-24 14:45:31');
INSERT INTO `sys_log` VALUES (6, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:48:37', '2020-03-24 14:48:37');
INSERT INTO `sys_log` VALUES (7, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:52:28', '2020-03-24 14:52:28');
INSERT INTO `sys_log` VALUES (8, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:54:02', '2020-03-24 14:54:02');
INSERT INTO `sys_log` VALUES (9, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-24 14:55:41', '2020-03-24 14:55:41');
INSERT INTO `sys_log` VALUES (10, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-24 14:55:43', '2020-03-24 14:55:43');
INSERT INTO `sys_log` VALUES (11, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:40', '2020-03-24 14:58:40');
INSERT INTO `sys_log` VALUES (12, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:42', '2020-03-24 14:58:42');
INSERT INTO `sys_log` VALUES (13, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:45', '2020-03-24 14:58:45');
INSERT INTO `sys_log` VALUES (14, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:46', '2020-03-24 14:58:46');
INSERT INTO `sys_log` VALUES (15, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:47', '2020-03-24 14:58:47');
INSERT INTO `sys_log` VALUES (16, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:47', '2020-03-24 14:58:47');
INSERT INTO `sys_log` VALUES (17, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 14:58:48', '2020-03-24 14:58:48');
INSERT INTO `sys_log` VALUES (18, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入文章列表第1页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/index/1', NULL, '2020-03-24 14:59:18', '2020-03-24 14:59:18');
INSERT INTO `sys_log` VALUES (19, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入文章列表第23页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/index/23', NULL, '2020-03-24 14:59:24', '2020-03-24 14:59:24');
INSERT INTO `sys_log` VALUES (20, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入归档目录页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443//archives', NULL, '2020-03-24 14:59:50', '2020-03-24 14:59:50');
INSERT INTO `sys_log` VALUES (21, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入归档目录页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/archives', NULL, '2020-03-24 14:59:56', '2020-03-24 14:59:56');
INSERT INTO `sys_log` VALUES (22, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入归档目录页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/archives', NULL, '2020-03-24 15:02:10', '2020-03-24 15:02:10');
INSERT INTO `sys_log` VALUES (23, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 15:02:40', '2020-03-24 15:02:40');
INSERT INTO `sys_log` VALUES (24, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 15:02:55', '2020-03-24 15:02:55');
INSERT INTO `sys_log` VALUES (25, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:08:36', '2020-03-24 15:08:36');
INSERT INTO `sys_log` VALUES (26, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:10:49', '2020-03-24 15:10:49');
INSERT INTO `sys_log` VALUES (27, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:13:17', '2020-03-24 15:13:17');
INSERT INTO `sys_log` VALUES (28, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-24 15:14:04', '2020-03-24 15:14:04');
INSERT INTO `sys_log` VALUES (29, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:18:31', '2020-03-24 15:18:31');
INSERT INTO `sys_log` VALUES (30, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:22:26', '2020-03-24 15:22:26');
INSERT INTO `sys_log` VALUES (31, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:23:49', '2020-03-24 15:23:49');
INSERT INTO `sys_log` VALUES (32, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[1]详情页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/article/1', 'http://127.0.0.1:8443/', '2020-03-24 15:24:58', '2020-03-24 15:24:58');
INSERT INTO `sys_log` VALUES (33, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入关于页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/about', 'http://localhost:8443/article/1', '2020-03-24 15:25:20', '2020-03-24 15:25:20');
INSERT INTO `sys_log` VALUES (34, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入友情链接页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/links', 'http://localhost:8443/about', '2020-03-24 15:25:59', '2020-03-24 15:25:59');
INSERT INTO `sys_log` VALUES (35, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-24 15:29:05', '2020-03-24 15:29:05');
INSERT INTO `sys_log` VALUES (36, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-25 05:06:03', '2020-03-25 05:06:03');
INSERT INTO `sys_log` VALUES (37, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-25 05:06:19', '2020-03-25 05:06:19');
INSERT INTO `sys_log` VALUES (38, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-25 05:10:48', '2020-03-25 05:10:48');
INSERT INTO `sys_log` VALUES (39, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-25 05:15:17', '2020-03-25 05:15:17');
INSERT INTO `sys_log` VALUES (40, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-25 05:15:28', '2020-03-25 05:15:28');
INSERT INTO `sys_log` VALUES (41, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/swagger-ui.html', '2020-03-25 05:20:34', '2020-03-25 05:20:34');
INSERT INTO `sys_log` VALUES (42, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-25 05:24:43', '2020-03-25 05:24:43');
INSERT INTO `sys_log` VALUES (43, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入文章分类[1]列表页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/type/1', 'http://127.0.0.1:8443/', '2020-03-25 05:36:58', '2020-03-25 05:36:58');
INSERT INTO `sys_log` VALUES (44, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入文章分类[2]列表页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/type/2', 'http://127.0.0.1:8443/type/1', '2020-03-25 05:37:02', '2020-03-25 05:37:02');
INSERT INTO `sys_log` VALUES (45, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入文章分类[3]列表页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/type/3', 'http://127.0.0.1:8443/type/2', '2020-03-25 05:37:06', '2020-03-25 05:37:06');
INSERT INTO `sys_log` VALUES (46, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入留言板页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/guestbook', 'http://127.0.0.1:8443/type/3', '2020-03-25 05:37:08', '2020-03-25 05:37:08');
INSERT INTO `sys_log` VALUES (47, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{\"pageNumber\":[\"1\"],\"keywords\":[\"博客\"]}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', 'http://127.0.0.1:8443/guestbook', '2020-03-25 05:37:42', '2020-03-25 05:37:42');
INSERT INTO `sys_log` VALUES (48, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-26 14:40:43', '2020-03-26 14:40:43');
INSERT INTO `sys_log` VALUES (49, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-26 14:42:39', '2020-03-26 14:42:39');
INSERT INTO `sys_log` VALUES (50, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-26 14:42:41', '2020-03-26 14:42:41');
INSERT INTO `sys_log` VALUES (51, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', NULL, '2020-03-26 14:43:38', '2020-03-26 14:43:38');
INSERT INTO `sys_log` VALUES (52, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-03-26 14:43:48', '2020-03-26 14:43:48');
INSERT INTO `sys_log` VALUES (53, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-03-26 14:48:46', '2020-03-26 14:48:46');
INSERT INTO `sys_log` VALUES (54, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-03-26 14:48:52', '2020-03-26 14:48:52');
INSERT INTO `sys_log` VALUES (55, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-03-26 14:50:23', '2020-03-26 14:50:23');
INSERT INTO `sys_log` VALUES (56, NULL, 'SYSTEM', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入登录页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/login/;JSESSIONID=f144301f-6687-4d81-9c0f-04e19be7822b', 'http://localhost:8085/articles', '2020-03-26 14:50:31', '2020-03-26 14:50:31');
INSERT INTO `sys_log` VALUES (57, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/passport/login/;JSESSIONID=f144301f-6687-4d81-9c0f-04e19be7822b', '2020-03-26 14:50:47', '2020-03-26 14:50:47');
INSERT INTO `sys_log` VALUES (58, NULL, 'SYSTEM', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入登录页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/login/;JSESSIONID=15ee385c-91ce-4690-bc6c-006333215c32', 'http://localhost:8085/error/403', '2020-03-26 14:53:47', '2020-03-26 14:53:47');
INSERT INTO `sys_log` VALUES (59, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: [\"root\"]登录系统', '{\"username\":[\"root\"],\"password\":[\"123456\"],\"kaptcha\":[\"cfn7\"]}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/signin', 'http://localhost:8085/passport/login/;JSESSIONID=15ee385c-91ce-4690-bc6c-006333215c32', '2020-03-26 14:54:00', '2020-03-26 14:54:00');
INSERT INTO `sys_log` VALUES (60, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/passport/login/;JSESSIONID=15ee385c-91ce-4690-bc6c-006333215c32', '2020-03-26 14:54:00', '2020-03-26 14:54:00');
INSERT INTO `sys_log` VALUES (61, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-03-26 14:54:05', '2020-03-26 14:54:05');
INSERT INTO `sys_log` VALUES (62, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 删除文章[[1]]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/remove', 'http://localhost:8085/articles', '2020-03-26 14:54:15', '2020-03-26 14:54:15');
INSERT INTO `sys_log` VALUES (63, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 删除文章[[2]]', '{\"ids\":[\"2\"]}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/remove', 'http://localhost:8085/articles', '2020-03-26 14:54:24', '2020-03-26 14:54:24');
INSERT INTO `sys_log` VALUES (64, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入分类列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/types', 'http://localhost:8085/articles', '2020-03-26 14:54:27', '2020-03-26 14:54:27');
INSERT INTO `sys_log` VALUES (65, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入标签列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/tags', 'http://localhost:8085/article/types', '2020-03-26 14:54:33', '2020-03-26 14:54:33');
INSERT INTO `sys_log` VALUES (66, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入链接页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/links', 'http://localhost:8085/article/tags', '2020-03-26 14:54:37', '2020-03-26 14:54:37');
INSERT INTO `sys_log` VALUES (67, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 获取友情链接详情', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/link/get/1', 'http://localhost:8085/links', '2020-03-26 14:54:42', '2020-03-26 14:54:42');
INSERT INTO `sys_log` VALUES (68, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入评论页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/comments', 'http://localhost:8085/links', '2020-03-26 14:54:54', '2020-03-26 14:54:54');
INSERT INTO `sys_log` VALUES (69, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入模板管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/templates', 'http://localhost:8085/comments', '2020-03-26 14:55:05', '2020-03-26 14:55:05');
INSERT INTO `sys_log` VALUES (70, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入更新记录管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/updates', 'http://localhost:8085/templates', '2020-03-26 14:55:07', '2020-03-26 14:55:07');
INSERT INTO `sys_log` VALUES (71, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统通知页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notices', 'http://localhost:8085/updates', '2020-03-26 14:55:09', '2020-03-26 14:55:09');
INSERT INTO `sys_log` VALUES (72, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文件管理页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/files', 'http://localhost:8085/notices', '2020-03-26 14:55:19', '2020-03-26 14:55:19');
INSERT INTO `sys_log` VALUES (73, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入资源列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/resources', 'http://localhost:8085/files', '2020-03-26 14:55:25', '2020-03-26 14:55:25');
INSERT INTO `sys_log` VALUES (74, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入角色列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/roles', 'http://localhost:8085/resources', '2020-03-26 14:55:29', '2020-03-26 14:55:29');
INSERT INTO `sys_log` VALUES (75, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入用户列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/users', 'http://localhost:8085/roles', '2020-03-26 14:55:35', '2020-03-26 14:55:35');
INSERT INTO `sys_log` VALUES (76, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入通知管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notice', 'http://localhost:8085/users', '2020-03-26 14:55:43', '2020-03-26 14:55:43');
INSERT INTO `sys_log` VALUES (77, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入搬运工页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/remover', 'http://localhost:8085/notice', '2020-03-26 14:56:03', '2020-03-26 14:56:03');
INSERT INTO `sys_log` VALUES (78, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入编辑器测试用例页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/editor', 'http://localhost:8085/remover', '2020-03-26 14:56:14', '2020-03-26 14:56:14');
INSERT INTO `sys_log` VALUES (79, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入icons页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/icons', 'http://localhost:8085/editor', '2020-03-26 14:56:18', '2020-03-26 14:56:18');
INSERT INTO `sys_log` VALUES (80, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入shiro示例页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/shiro', 'http://localhost:8085/icons', '2020-03-26 14:56:24', '2020-03-26 14:56:24');
INSERT INTO `sys_log` VALUES (81, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入评论页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/comments', 'http://localhost:8085/shiro', '2020-03-26 14:56:41', '2020-03-26 14:56:41');
INSERT INTO `sys_log` VALUES (82, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/comments', '2020-03-26 14:56:45', '2020-03-26 14:56:45');
INSERT INTO `sys_log` VALUES (83, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[html]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publish', 'http://localhost:8085/articles', '2020-03-26 14:56:47', '2020-03-26 14:56:47');
INSERT INTO `sys_log` VALUES (84, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/article/publish', '2020-03-26 14:56:54', '2020-03-26 14:56:54');
INSERT INTO `sys_log` VALUES (85, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-03-26 14:58:17', '2020-03-26 14:58:17');
INSERT INTO `sys_log` VALUES (86, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入通知管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notice', 'http://localhost:8085/article/publishMd', '2020-03-26 14:58:42', '2020-03-26 14:58:42');
INSERT INTO `sys_log` VALUES (87, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 通过websocket向前台发送通知', '{\"msg\":[\"加油\"]}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/api/notice', 'http://localhost:8085/notice', '2020-03-26 14:58:50', '2020-03-26 14:58:50');
INSERT INTO `sys_log` VALUES (88, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入关于页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/about', 'http://127.0.0.1:8443/', '2020-03-26 14:59:03', '2020-03-26 14:59:03');
INSERT INTO `sys_log` VALUES (89, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入友情链接页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/links', 'http://127.0.0.1:8443/', '2020-03-26 14:59:09', '2020-03-26 14:59:09');
INSERT INTO `sys_log` VALUES (90, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/notice', '2020-03-26 14:59:34', '2020-03-26 14:59:34');
INSERT INTO `sys_log` VALUES (91, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-04-03 13:12:18', '2020-04-03 13:12:18');
INSERT INTO `sys_log` VALUES (92, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-04-03 13:12:43', '2020-04-03 13:12:43');
INSERT INTO `sys_log` VALUES (93, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-04-03 13:12:46', '2020-04-03 13:12:46');
INSERT INTO `sys_log` VALUES (94, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Linux', 'Chrome 8', 'http://127.0.0.1:8443/', NULL, '2020-04-03 13:12:56', '2020-04-03 13:12:56');
INSERT INTO `sys_log` VALUES (95, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Linux', 'Chrome 8', 'http://127.0.0.1:8443/', NULL, '2020-04-03 13:13:01', '2020-04-03 13:13:01');
INSERT INTO `sys_log` VALUES (96, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 查看sitemap.html', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/sitemap.html', 'http://127.0.0.1:8443/', '2020-04-03 13:13:36', '2020-04-03 13:13:36');
INSERT INTO `sys_log` VALUES (97, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入更新记录页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/updateLog', 'http://127.0.0.1:8443/', '2020-04-03 13:13:45', '2020-04-03 13:13:45');
INSERT INTO `sys_log` VALUES (98, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入免责声明页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/disclaimer', 'http://127.0.0.1:8443/', '2020-04-03 13:13:52', '2020-04-03 13:13:52');
INSERT INTO `sys_log` VALUES (99, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入留言板页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/guestbook', 'http://127.0.0.1:8443/', '2020-04-03 13:14:12', '2020-04-03 13:14:12');
INSERT INTO `sys_log` VALUES (100, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-04-22 14:21:32', '2020-04-22 14:21:32');
INSERT INTO `sys_log` VALUES (101, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 查看sitemap.html', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/sitemap.html', 'http://127.0.0.1:8443/', '2020-04-22 14:21:51', '2020-04-22 14:21:51');
INSERT INTO `sys_log` VALUES (102, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 查看sitemap.html', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/sitemap.html', 'http://127.0.0.1:8443/', '2020-04-22 14:21:54', '2020-04-22 14:21:54');
INSERT INTO `sys_log` VALUES (103, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入站长推荐页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/recommended', 'http://127.0.0.1:8443/', '2020-04-22 14:21:59', '2020-04-22 14:21:59');
INSERT INTO `sys_log` VALUES (104, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入更新记录页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/updateLog', 'http://127.0.0.1:8443/', '2020-04-22 14:22:06', '2020-04-22 14:22:06');
INSERT INTO `sys_log` VALUES (105, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入归档目录页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/archives', 'http://127.0.0.1:8443/', '2020-04-22 14:22:10', '2020-04-22 14:22:10');
INSERT INTO `sys_log` VALUES (106, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入免责声明页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/disclaimer', 'http://127.0.0.1:8443/', '2020-04-22 14:22:15', '2020-04-22 14:22:15');
INSERT INTO `sys_log` VALUES (107, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入友情链接页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/links', 'http://127.0.0.1:8443/', '2020-04-22 14:23:59', '2020-04-22 14:23:59');
INSERT INTO `sys_log` VALUES (108, NULL, 'SYSTEM', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入登录页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/login/;JSESSIONID=00259371-c602-432e-bd81-231ce7a010e0', NULL, '2020-04-22 14:28:17', '2020-04-22 14:28:17');
INSERT INTO `sys_log` VALUES (109, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: [\"admin\"]登录系统', '{\"username\":[\"admin\"],\"password\":[\"123456\"],\"kaptcha\":[\"dfxu\"],\"rememberMe\":[\"on\"]}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/signin', 'http://localhost:8085/passport/login/;JSESSIONID=00259371-c602-432e-bd81-231ce7a010e0', '2020-04-22 14:28:33', '2020-04-22 14:28:33');
INSERT INTO `sys_log` VALUES (110, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/passport/login/;JSESSIONID=00259371-c602-432e-bd81-231ce7a010e0', '2020-04-22 14:28:33', '2020-04-22 14:28:33');
INSERT INTO `sys_log` VALUES (111, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/passport/login/;JSESSIONID=00259371-c602-432e-bd81-231ce7a010e0', '2020-04-22 14:31:01', '2020-04-22 14:31:01');
INSERT INTO `sys_log` VALUES (112, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/passport/login/;JSESSIONID=00259371-c602-432e-bd81-231ce7a010e0', '2020-04-22 14:31:24', '2020-04-22 14:31:24');
INSERT INTO `sys_log` VALUES (113, 2, 'SYSTEM', 'INFO', '用户: [admin] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-04-22 14:31:40', '2020-04-22 14:31:40');
INSERT INTO `sys_log` VALUES (114, NULL, 'SYSTEM', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入登录页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/login/;JSESSIONID=92e7cbd3-eabe-4d98-8d63-8927735ad636', 'http://localhost:8085/articles', '2020-04-22 14:31:51', '2020-04-22 14:31:51');
INSERT INTO `sys_log` VALUES (115, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: [\"root\"]登录系统', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/signin', 'http://localhost:8085/passport/login/;JSESSIONID=92e7cbd3-eabe-4d98-8d63-8927735ad636', '2020-04-22 14:32:02', '2020-04-22 14:32:02');
INSERT INTO `sys_log` VALUES (116, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/passport/login/;JSESSIONID=92e7cbd3-eabe-4d98-8d63-8927735ad636', '2020-04-22 14:32:02', '2020-04-22 14:32:02');
INSERT INTO `sys_log` VALUES (117, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入编辑器测试用例页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/editor', 'http://localhost:8085/', '2020-04-22 14:32:09', '2020-04-22 14:32:09');
INSERT INTO `sys_log` VALUES (118, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入icons页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/icons', 'http://localhost:8085/editor', '2020-04-22 14:32:13', '2020-04-22 14:32:13');
INSERT INTO `sys_log` VALUES (119, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入shiro示例页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/shiro', 'http://localhost:8085/icons', '2020-04-22 14:32:21', '2020-04-22 14:32:21');
INSERT INTO `sys_log` VALUES (120, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入shiro示例页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/shiro', 'http://localhost:8085/icons', '2020-04-22 14:36:57', '2020-04-22 14:36:57');
INSERT INTO `sys_log` VALUES (121, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入通知管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notice', 'http://localhost:8085/shiro', '2020-04-22 14:37:04', '2020-04-22 14:37:04');
INSERT INTO `sys_log` VALUES (122, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入搬运工页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/remover', 'http://localhost:8085/notice', '2020-04-22 14:37:07', '2020-04-22 14:37:07');
INSERT INTO `sys_log` VALUES (123, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入资源列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/resources', 'http://localhost:8085/remover', '2020-04-22 14:37:20', '2020-04-22 14:37:20');
INSERT INTO `sys_log` VALUES (124, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入角色列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/roles', 'http://localhost:8085/resources', '2020-04-22 14:37:28', '2020-04-22 14:37:28');
INSERT INTO `sys_log` VALUES (125, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入链接页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/links', 'http://localhost:8085/roles', '2020-04-22 14:37:33', '2020-04-22 14:37:33');
INSERT INTO `sys_log` VALUES (126, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 获取友情链接详情', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/link/get/1', 'http://localhost:8085/links', '2020-04-22 14:37:43', '2020-04-22 14:37:43');
INSERT INTO `sys_log` VALUES (127, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 编辑友情链接', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/link/edit', 'http://localhost:8085/links', '2020-04-22 14:38:19', '2020-04-22 14:38:19');
INSERT INTO `sys_log` VALUES (128, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入评论页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/comments', 'http://localhost:8085/links', '2020-04-22 14:38:24', '2020-04-22 14:38:24');
INSERT INTO `sys_log` VALUES (129, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 删除评论[[1]]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/comment/remove', 'http://localhost:8085/comments', '2020-04-22 14:38:31', '2020-04-22 14:38:31');
INSERT INTO `sys_log` VALUES (130, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入模板管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/templates', 'http://localhost:8085/comments', '2020-04-22 14:38:35', '2020-04-22 14:38:35');
INSERT INTO `sys_log` VALUES (131, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入更新记录管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/updates', 'http://localhost:8085/templates', '2020-04-22 14:38:37', '2020-04-22 14:38:37');
INSERT INTO `sys_log` VALUES (132, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统通知页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notices', 'http://localhost:8085/updates', '2020-04-22 14:38:39', '2020-04-22 14:38:39');
INSERT INTO `sys_log` VALUES (133, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 删除公告通知', '{\"ids\":[\"2\"]}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notice/remove', 'http://localhost:8085/notices', '2020-04-22 14:38:50', '2020-04-22 14:38:50');
INSERT INTO `sys_log` VALUES (134, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文件管理页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/files', 'http://localhost:8085/notices', '2020-04-22 14:38:53', '2020-04-22 14:38:53');
INSERT INTO `sys_log` VALUES (135, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/files', '2020-04-22 14:39:10', '2020-04-22 14:39:10');
INSERT INTO `sys_log` VALUES (136, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[html]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publish', 'http://localhost:8085/articles', '2020-04-22 14:39:14', '2020-04-22 14:39:14');
INSERT INTO `sys_log` VALUES (137, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/article/publish', '2020-04-22 14:39:32', '2020-04-22 14:39:32');
INSERT INTO `sys_log` VALUES (138, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统配置页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/config', 'http://localhost:8085/article/publishMd', '2020-04-22 14:39:47', '2020-04-22 14:39:47');
INSERT INTO `sys_log` VALUES (139, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改系统配置', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/config/save', 'http://localhost:8085/config', '2020-04-22 14:40:35', '2020-04-22 14:40:35');
INSERT INTO `sys_log` VALUES (140, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改系统配置', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/config/save', 'http://localhost:8085/config', '2020-04-22 14:40:51', '2020-04-22 14:40:51');
INSERT INTO `sys_log` VALUES (141, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改系统配置', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/config/save', 'http://localhost:8085/config', '2020-04-22 14:41:14', '2020-04-22 14:41:14');
INSERT INTO `sys_log` VALUES (142, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/config', '2020-04-22 14:42:00', '2020-04-22 14:42:00');
INSERT INTO `sys_log` VALUES (143, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/', '2020-04-22 14:42:04', '2020-04-22 14:42:04');
INSERT INTO `sys_log` VALUES (144, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:42:07', '2020-04-22 14:42:07');
INSERT INTO `sys_log` VALUES (145, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:43:03', '2020-04-22 14:43:03');
INSERT INTO `sys_log` VALUES (146, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:44:29', '2020-04-22 14:44:29');
INSERT INTO `sys_log` VALUES (147, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入通知管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notice', 'http://localhost:8085/article/publishMd', '2020-04-22 14:44:44', '2020-04-22 14:44:44');
INSERT INTO `sys_log` VALUES (148, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入用户列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/users', 'http://localhost:8085/notice', '2020-04-22 14:44:50', '2020-04-22 14:44:50');
INSERT INTO `sys_log` VALUES (149, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入分类列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/types', 'http://localhost:8085/users', '2020-04-22 14:46:59', '2020-04-22 14:46:59');
INSERT INTO `sys_log` VALUES (150, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/article/types', '2020-04-22 14:47:04', '2020-04-22 14:47:04');
INSERT INTO `sys_log` VALUES (151, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:47:09', '2020-04-22 14:47:09');
INSERT INTO `sys_log` VALUES (152, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:47:25', '2020-04-22 14:47:25');
INSERT INTO `sys_log` VALUES (153, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:51:19', '2020-04-22 14:51:19');
INSERT INTO `sys_log` VALUES (154, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 14:57:21', '2020-04-22 14:57:21');
INSERT INTO `sys_log` VALUES (155, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[markdown]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/publishMd', 'http://localhost:8085/articles', '2020-04-22 15:06:20', '2020-04-22 15:06:20');
INSERT INTO `sys_log` VALUES (156, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 发布文章', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/save', 'http://localhost:8085/article/publishMd', '2020-04-22 15:07:03', '2020-04-22 15:07:03');
INSERT INTO `sys_log` VALUES (157, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/article/publishMd', '2020-04-22 15:07:07', '2020-04-22 15:07:07');
INSERT INTO `sys_log` VALUES (158, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改文章[3]的状态[\"recommend\"]', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/update/recommend', 'http://localhost:8085/articles', '2020-04-22 15:07:11', '2020-04-22 15:07:11');
INSERT INTO `sys_log` VALUES (159, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/articles', 'http://localhost:8085/article/publishMd', '2020-04-22 15:08:05', '2020-04-22 15:08:05');
INSERT INTO `sys_log` VALUES (160, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入分类列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/types', 'http://localhost:8085/articles', '2020-04-22 15:08:25', '2020-04-22 15:08:25');
INSERT INTO `sys_log` VALUES (161, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入标签列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/article/tags', 'http://localhost:8085/article/types', '2020-04-22 15:08:29', '2020-04-22 15:08:29');
INSERT INTO `sys_log` VALUES (162, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/article/tags', '2020-04-22 15:08:33', '2020-04-22 15:08:33');
INSERT INTO `sys_log` VALUES (163, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/article/tags', '2020-04-22 15:10:04', '2020-04-22 15:10:04');
INSERT INTO `sys_log` VALUES (164, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/', 'http://localhost:8085/article/tags', '2020-04-22 15:13:53', '2020-04-22 15:13:53');
INSERT INTO `sys_log` VALUES (165, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入链接页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/links', 'http://localhost:8085/', '2020-04-22 15:14:05', '2020-04-22 15:14:05');
INSERT INTO `sys_log` VALUES (166, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入评论页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/comments', 'http://localhost:8085/links', '2020-04-22 15:14:12', '2020-04-22 15:14:12');
INSERT INTO `sys_log` VALUES (167, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入评论页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/comments', 'http://localhost:8085/comments', '2020-04-22 15:16:27', '2020-04-22 15:16:27');
INSERT INTO `sys_log` VALUES (168, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入模板管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/templates', 'http://localhost:8085/comments', '2020-04-22 15:16:31', '2020-04-22 15:16:31');
INSERT INTO `sys_log` VALUES (169, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入更新记录管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/updates', 'http://localhost:8085/templates', '2020-04-22 15:16:34', '2020-04-22 15:16:34');
INSERT INTO `sys_log` VALUES (170, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统通知页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notices', 'http://localhost:8085/updates', '2020-04-22 15:16:38', '2020-04-22 15:16:38');
INSERT INTO `sys_log` VALUES (171, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文件管理页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/files', 'http://localhost:8085/notices', '2020-04-22 15:16:44', '2020-04-22 15:16:44');
INSERT INTO `sys_log` VALUES (172, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入资源列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/resources', 'http://localhost:8085/files', '2020-04-22 15:16:54', '2020-04-22 15:16:54');
INSERT INTO `sys_log` VALUES (173, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入角色列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/roles', 'http://localhost:8085/resources', '2020-04-22 15:16:58', '2020-04-22 15:16:58');
INSERT INTO `sys_log` VALUES (174, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入用户列表页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/users', 'http://localhost:8085/roles', '2020-04-22 15:17:04', '2020-04-22 15:17:04');
INSERT INTO `sys_log` VALUES (175, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入通知管理页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/notice', 'http://localhost:8085/users', '2020-04-22 15:17:08', '2020-04-22 15:17:08');
INSERT INTO `sys_log` VALUES (176, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入搬运工页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/remover', 'http://localhost:8085/notice', '2020-04-22 15:17:16', '2020-04-22 15:17:16');
INSERT INTO `sys_log` VALUES (177, NULL, 'SYSTEM', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入登录页面', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8085/passport/login/;JSESSIONID=23e5045a-c2a0-48dc-a2bb-a6204fb1705f', 'http://localhost:8085/remover', '2020-04-22 15:17:22', '2020-04-22 15:17:22');
INSERT INTO `sys_log` VALUES (178, NULL, 'VISIT', 'INFO', '访客: [127.0.0.1] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8443/', NULL, '2020-04-22 15:19:07', '2020-04-22 15:19:07');
INSERT INTO `sys_log` VALUES (179, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[3]详情页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/article/3', 'http://127.0.0.1:8443/', '2020-04-22 15:19:12', '2020-04-22 15:19:12');
INSERT INTO `sys_log` VALUES (180, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[3]详情页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/article/3', 'http://127.0.0.1:8443/', '2020-04-22 15:23:53', '2020-04-22 15:23:53');
INSERT INTO `sys_log` VALUES (181, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 点赞文章3', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/api/doPraise/3', 'http://localhost:8443/article/3', '2020-04-22 15:24:17', '2020-04-22 15:24:17');
INSERT INTO `sys_log` VALUES (182, NULL, 'SYSTEM', 'INFO', '访客: [127.0.0.1] | 操作: 进入登录页面', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/passport/login/;JSESSIONID=3e4df614-78d9-42c1-82a0-752441f3740a', NULL, '2020-04-22 15:26:15', '2020-04-22 15:26:15');
INSERT INTO `sys_log` VALUES (183, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: [\"root\"]登录系统', '{\"username\":[\"root\"],\"password\":[\"123456\"],\"kaptcha\":[\"j9qz\"]}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/passport/signin', 'http://127.0.0.1:8085/passport/login/;JSESSIONID=3e4df614-78d9-42c1-82a0-752441f3740a', '2020-04-22 15:26:27', '2020-04-22 15:26:27');
INSERT INTO `sys_log` VALUES (184, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/', 'http://127.0.0.1:8085/passport/login/;JSESSIONID=3e4df614-78d9-42c1-82a0-752441f3740a', '2020-04-22 15:26:27', '2020-04-22 15:26:27');
INSERT INTO `sys_log` VALUES (185, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统配置页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/config', 'http://127.0.0.1:8085/', '2020-04-22 15:26:33', '2020-04-22 15:26:33');
INSERT INTO `sys_log` VALUES (186, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改系统配置', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/config/save', 'http://127.0.0.1:8085/config', '2020-04-22 15:26:52', '2020-04-22 15:26:52');
INSERT INTO `sys_log` VALUES (187, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[3]详情页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/article/3', 'http://127.0.0.1:8443/', '2020-04-22 15:26:57', '2020-04-22 15:26:57');
INSERT INTO `sys_log` VALUES (188, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入留言板页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/guestbook', 'http://localhost:8443/article/3', '2020-04-22 15:27:04', '2020-04-22 15:27:04');
INSERT INTO `sys_log` VALUES (189, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入留言板页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/guestbook', 'http://localhost:8443/guestbook', '2020-04-22 15:27:29', '2020-04-22 15:27:29');
INSERT INTO `sys_log` VALUES (190, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入评论页', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/comments', 'http://127.0.0.1:8085/config', '2020-04-22 15:27:39', '2020-04-22 15:27:39');
INSERT INTO `sys_log` VALUES (191, 1, 'SYSTEM', 'INFO', '用户: [root] | 操作: 审核评论', '{}', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://127.0.0.1:8085/comment/audit', 'http://127.0.0.1:8085/comments', '2020-04-22 15:27:56', '2020-04-22 15:27:56');
INSERT INTO `sys_log` VALUES (192, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 进入留言板页', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/guestbook', 'http://localhost:8443/guestbook', '2020-04-22 15:28:01', '2020-04-22 15:28:01');
INSERT INTO `sys_log` VALUES (193, NULL, 'VISIT', 'INFO', '访客: [0:0:0:0:0:0:0:1] | 操作: 点赞评论2', '{}', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36 OPR/64.0.3417.61', 'Linux', 'Opera', 'http://localhost:8443/api/doSupport/2', 'http://localhost:8443/guestbook', '2020-04-22 15:28:07', '2020-04-22 15:28:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '被通知的用户ID',
  `status` enum('RELEASE','NOT_RELEASE') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'NOT_RELEASE' COMMENT '通知状态',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通知的内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, 1, 'RELEASE', 'PxBlog博客', 'PxBlog博客，一款超好用的Java版开源博客', '2020-03-24 06:02:00', '2020-03-24 06:02:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT '0',
  `sort` int unsigned DEFAULT NULL,
  `external` tinyint unsigned DEFAULT NULL COMMENT '是否外部链接',
  `available` tinyint unsigned DEFAULT '0',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_resource_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
BEGIN;
INSERT INTO `sys_resources` VALUES (1, '用户管理', 'menu', '', '', 0, 4, 0, 1, 'fa fa-users', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (2, '用户列表', 'menu', '/users', 'users', 1, 1, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (3, '新增用户', 'button', NULL, 'user:add', 2, 2, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (4, '批量删除用户', 'button', NULL, 'user:batchDelete', 2, 3, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (5, '编辑用户', 'button', NULL, 'user:edit,user:get', 2, 4, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (6, '删除用户', 'button', NULL, 'user:delete', 2, 5, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (7, '分配用户角色', 'button', NULL, 'user:allotRole', 2, 6, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (8, '权限管理', 'menu', '', '', 0, 3, 0, 1, 'fa fa-cogs', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (9, '资源管理', 'menu', '/resources', 'resources', 8, 1, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (10, '新增资源', 'button', NULL, 'resource:add', 9, 2, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (11, '批量删除资源', 'button', NULL, 'resource:batchDelete', 9, 3, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (12, '编辑资源', 'button', NULL, 'resource:edit,resource:get', 9, 4, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (13, '删除资源', 'button', NULL, 'resource:delete', 9, 5, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (14, '角色管理', 'menu', '/roles', 'roles', 8, 2, 0, 1, '', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (15, '新增角色', 'button', NULL, 'role:add', 14, 2, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (16, '批量删除角色', 'button', NULL, 'role:batchDelete', 14, 3, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (17, '编辑角色', 'button', NULL, 'role:edit,role:get', 14, 4, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (18, '删除角色', 'button', NULL, 'role:delete', 14, 5, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (19, '分配角色资源', 'button', NULL, 'role:allotResource', 14, 6, 0, 1, NULL, '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_resources` VALUES (20, '文章管理', 'menu', '', '', 0, 1, 0, 1, 'fa fa-list', '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (21, '文章列表', 'menu', '/articles', 'articles', 20, 1, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (22, '发表文章', 'button', NULL, 'article:publish', 21, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (23, '批量删除文章', 'button', NULL, 'article:batchDelete', 21, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (24, '批量推送文章', 'button', NULL, 'article:batchPush', 21, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (25, '推送文章', 'button', NULL, 'article:push', 21, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (26, '置顶文章', 'button', NULL, 'article:top', 21, 6, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (27, '推荐文章', 'button', NULL, 'article:recommend', 21, 7, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (28, '编辑文章', 'button', NULL, 'article:edit,article:get', 21, 8, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (29, '删除文章', 'button', NULL, 'article:delete', 21, 9, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (30, '分类列表', 'menu', '/article/types', 'types', 20, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (31, '添加分类', 'button', NULL, 'type:add', 30, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (32, '批量删除分类', 'button', NULL, 'type:batchDelete', 30, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (33, '编辑分类', 'button', NULL, 'type:edit,type:get', 30, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (34, '删除分类', 'button', NULL, 'type:delete', 30, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (35, '标签列表', 'menu', '/article/tags', 'tags', 20, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (36, '添加标签', 'button', NULL, 'tag:add', 35, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (37, '批量删除标签', 'button', NULL, 'tag:batchDelete', 35, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (38, '编辑标签', 'button', NULL, 'tag:edit,tag:get', 35, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (39, '删除标签', 'button', NULL, 'tag:delete', 35, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (40, '网站管理', 'menu', '', '', 0, 2, 0, 1, 'fa fa-globe', '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (41, '友情链接', 'menu', '/links', 'links', 40, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (42, '添加友情链接', 'button', NULL, 'link:add', 41, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (43, '批量删除友情链接', 'button', NULL, 'link:batchDelete', 41, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (44, '编辑友情链接', 'button', NULL, 'link:edit,link:get', 41, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (45, '删除友情链接', 'button', NULL, 'link:delete', 41, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (46, '评论管理', 'menu', '/comments', 'comments', 40, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (47, '批量删除评论', 'button', NULL, 'comment:batchDelete', 46, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (48, '回复评论', 'button', NULL, 'comment:reply', 46, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (49, '审核评论', 'button', NULL, 'comment:audit', 46, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (50, '删除评论', 'button', NULL, 'comment:delete', 46, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (51, '模板管理', 'menu', '/templates', 'templates', 40, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (52, '添加模板', 'button', NULL, 'template:add', 51, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (53, '批量删除模板', 'button', NULL, 'template:batchDelete', 51, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (54, '编辑模板', 'button', NULL, 'template:edit,template:get', 51, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (55, '删除模板', 'button', NULL, 'template:delete', 51, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (56, '更新日志', 'menu', '/updates', 'updateLogs', 40, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (57, '添加更新日志', 'button', NULL, 'updateLog:add', 51, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (58, '批量删除更新日志', 'button', NULL, 'updateLog:batchDelete', 51, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (59, '编辑更新日志', 'button', NULL, 'updateLog:edit,updateLog:get', 51, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (60, '删除更新日志', 'button', NULL, 'updateLog:delete', 51, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (61, '公告管理', 'menu', '/notices', 'notices', 40, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (62, '添加公告', 'button', NULL, 'notice:add', 61, 2, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (63, '批量删除公告', 'button', NULL, 'notice:batchDelete', 61, 3, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (64, '编辑公告', 'button', NULL, 'notice:edit,notice:get', 61, 4, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (65, '删除公告', 'button', NULL, 'notice:delete', 61, 5, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (66, '发布公告', 'button', NULL, 'notice:release', 61, 6, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (67, '撤回公告', 'button', NULL, 'notice:withdraw', 61, 7, 0, 1, NULL, '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (71, '推送消息', 'menu', '/notice', 'notice', 72, NULL, 0, 1, '', '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (72, '实验室', 'menu', '', '', 0, 5, 0, 1, 'fa fa-flask', '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (73, '文章搬运工', 'menu', '/remover', 'remover', 72, NULL, 0, 1, '', '2020-03-24 06:02:02', '2020-03-24 06:02:02');
INSERT INTO `sys_resources` VALUES (75, '文件管理', 'menu', '/files', 'files', 40, 6, 0, 1, NULL, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 'role:root', '超级管理员', 1, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role` VALUES (2, 'role:admin', '管理员', 1, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role` VALUES (3, 'role:comment', '评论审核管理员', 1, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `resources_id` bigint unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resources` VALUES (1, 1, 1, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (2, 1, 2, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (3, 1, 3, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (4, 1, 4, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (5, 1, 5, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (6, 1, 6, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (7, 1, 7, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (8, 1, 8, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (9, 1, 9, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (10, 1, 10, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (11, 1, 11, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (12, 1, 12, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (13, 1, 13, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (14, 1, 14, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (15, 1, 15, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (16, 1, 16, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (17, 1, 17, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (18, 1, 18, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (19, 1, 19, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (20, 1, 20, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (21, 1, 21, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (22, 1, 22, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (23, 1, 23, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (24, 1, 24, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (25, 1, 25, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (26, 1, 26, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (27, 1, 27, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (28, 1, 28, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (29, 1, 29, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (30, 1, 30, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (31, 1, 31, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (32, 1, 32, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (33, 1, 33, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (34, 1, 34, '2020-03-24 06:02:03', '2020-03-24 06:02:03');
INSERT INTO `sys_role_resources` VALUES (35, 1, 35, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (36, 1, 36, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (37, 1, 37, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (38, 1, 38, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (39, 1, 39, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (40, 1, 40, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (41, 1, 41, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (42, 1, 42, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (43, 1, 43, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (44, 1, 44, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (45, 1, 45, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (46, 1, 46, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (47, 1, 47, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (48, 1, 48, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (49, 1, 49, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (50, 1, 50, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (51, 1, 51, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (52, 1, 52, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (53, 1, 57, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (54, 1, 53, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (55, 1, 58, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (56, 1, 54, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (57, 1, 59, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (58, 1, 55, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (59, 1, 60, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (60, 1, 56, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (61, 1, 61, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (62, 1, 62, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (63, 1, 63, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (64, 1, 64, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (65, 1, 65, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (66, 1, 66, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (67, 1, 67, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (68, 1, 68, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (84, 2, 20, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (85, 2, 21, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (86, 2, 24, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (87, 2, 25, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (88, 2, 26, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (89, 2, 27, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (93, 3, 40, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (94, 3, 46, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (95, 3, 48, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
INSERT INTO `sys_role_resources` VALUES (96, 3, 49, '2020-03-24 06:02:04', '2020-03-24 06:02:04');
COMMIT;

-- ----------------------------
-- Table structure for sys_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE `sys_template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ref_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '键',
  `ref_value` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_template
-- ----------------------------
BEGIN;
INSERT INTO `sys_template` VALUES (1, 'TM_SITEMAP_XML', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n	<url>\r\n		<loc>${config.siteUrl}</loc>\r\n		<priority>1.0</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/about</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/links</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/guestbook</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/updateLog</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/recommended</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<#list articleList as item>\r\n		<url>\r\n			<loc>${config.siteUrl}/article/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	<#list articleTypeList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/type/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	\r\n	<#list articleTagsList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/tag/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n</urlset>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (2, 'TM_SITEMAP_TXT', '${config.siteUrl}\r\n${config.siteUrl}/about\r\n${config.siteUrl}/links\r\n${config.siteUrl}/guestbook\r\n${config.siteUrl}/updateLog\r\n${config.siteUrl}/recommended\r\n<#list articleList as item>\r\n${config.siteUrl}/article/${item.id}\r\n</#list>\r\n<#list articleTypeList as item>\r\n${config.siteUrl}/type/${item.id}\r\n</#list>\r\n<#list articleTagsList as item>\r\n${config.siteUrl}/tag/${item.id}\r\n</#list>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (3, 'TM_SITEMAP_HTML', '<!DOCTYPE html>\r\n<html lang=\"zh-CN\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n    <title>${config.siteName} 网站地图</title>\r\n    <meta name=\"author\" content=\"SiteMapX.com\"/>\r\n    <meta name=\"robots\" content=\"index,follow\"/>\r\n    <style type=\"text/css\">\r\n        body {\r\n            color: #000000;\r\n            background: #ffffff;\r\n            margin: 20px;\r\n            font-family: Verdana, Arial, Helvetica, sans-serif;\r\n            font-size: 12px;\r\n        }\r\n\r\n        #myTable {\r\n            list-style: none;\r\n            margin: 10px 0px 10px 0px;\r\n            padding: 0px;\r\n            width: 100%;\r\n            min-width: 804px;\r\n        }\r\n\r\n        #myTable li {\r\n            list-style-type: none;\r\n            width: 100%;\r\n            min-width: 404px;\r\n            height: 20px;\r\n            line-height: 20px;\r\n        }\r\n\r\n        .pull-left{\r\n            float: left!important;\r\n        }\r\n        .pull-right{\r\n            float: right!important;\r\n        }\r\n\r\n        #myTable li .T1-h {\r\n            font-weight: bold;\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T3-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T4-h {\r\n            width: 100px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T1 {\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T3 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T4 {\r\n            width: 100px;\r\n        }\r\n\r\n        #footer {\r\n            padding: 2px;\r\n            margin: 0px;\r\n            font-size: 8pt;\r\n            color: gray;\r\n            min-width: 900px;\r\n        }\r\n\r\n        #footer a {\r\n            color: gray;\r\n        }\r\n\r\n        .myClear {\r\n            clear: both;\r\n        }\r\n\r\n        #nav, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 95%; margin: auto; margin-top: 10px;}\r\n\r\n    </style>\r\n</head>\r\n<body>\r\n<h2 style=\"text-align: center; margin-top: 20px\">${config.siteName?if_exists} 网站地图 </h2>\r\n<div id=\"nav\"><a href=\"${config.siteUrl?if_exists}\"><strong>${config.siteName?if_exists}</strong></a> &raquo; <a href=\"${config.siteUrl?if_exists}/sitemap.html\">站点地图</a></div>\r\n<div id=\"content\">\r\n    <h3>最新文章</h3>\r\n    <ul id=\"myTable\">\r\n        <li>\r\n            <div class=\"T1-h pull-left\">URL</div>\r\n            <div class=\"T2-h pull-right\">Last Change</div>\r\n            <div class=\"T3-h pull-right\">Change Frequency</div>\r\n            <div class=\"T4-h pull-right\">Priority</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName} | 一个程序员的个人博客</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">1</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/about\" title=\"${config.siteName}\">关于 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/links\" title=\"${config.siteName}\">友情链接 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/guestbook\" title=\"${config.siteName}\">留言板 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/updateLog\" title=\"${config.siteName}\">网站更新记录 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n		<div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/recommended\" title=\"${config.siteName}\">站长推荐 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <#list articleList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/article/${item.id}\" title=\"${item.title}\">${item.title} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>分类目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTypeList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/type/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>标签目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTagsList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/tag/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"footer\">\r\n    该文件由<a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName}</a>网站自动生成。\r\n</div>\r\n</body>\r\n</html>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (4, 'TM_ROBOTS', 'Crawl-delay: 5\r\nSitemap: ${config.cmsUrl}/sitemap.txt\r\nSitemap: ${config.cmsUrl}/sitemap.xml\r\nSitemap: ${config.cmsUrl}/sitemap.html\r\n', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (5, 'TM_LINKS', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>站长<a href=\"${link.url?if_exists}\" target=\"_blank\">${link.name?if_exists}</a>，您好!</p>\r\n        <p>您于 ${link.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <li>${link.email?if_exists}</li>\r\n            <li>${link.qq?if_exists}</li>\r\n            <li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li>\r\n        </ul>\r\n        </p>\r\n        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>\r\n        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>\r\n        <ul>\r\n            <li>私自取消本站友情链接</li>\r\n            <li>更换域名且未通知本站</li>\r\n            <li>网站内容长期不更新</li>\r\n            <li>友链上使用诸如nofollow之类的属性</li>\r\n        </ul>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl?if_exists}\" target=\"_blank\">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (6, 'TM_COMMENT_AUDIT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论审核结果通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论审核结果通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname?if_exists}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <#if comment.status == \'APPROVED\'>\r\n        <p>已通过管理员审核并显示。</p>\r\n        <p>\r\n            您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <#elseif comment.status == \'REJECT\'>\r\n        <p>审核失败！失败原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#elseif comment.status == \'DELETED\'>\r\n        <p>已被管理员删除！删除原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#else>\r\n        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>\r\n        </#if>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (7, 'TM_COMMENT_REPLY', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论回复通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论回复通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl}${comment.sourceUrl}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <p>\r\n            有了 <strong>新的回复</strong>！您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (8, 'TM_LINKS_TO_ADMIN', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>有新的友情链接加入，信息如下</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <#if link.favicon?exists><li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li></#if>\r\n        </ul>\r\n        </p>\r\n        <p><a style=\"text-decoration:none;\" href=\"${config.cmsUrl}\" target=\"_blank\">去后台继续审核</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (9, 'TM_NEW_COMMENT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>新评论通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            新评论通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>\r\n            评论内容：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>\r\n        <p>\r\n            <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">查看完整评论</a>\r\n        </p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
INSERT INTO `sys_template` VALUES (10, 'TM_NGINX_FILE_SERVER', 'server {\r\n    listen 80;\r\n    server_name serverName;\r\n    root serverPath;\r\n	error_page 403 /error.html;\r\n	location = /error.html {\r\n		return 404;\r\n	}\r\n	autoindex off; \r\n	autoindex_exact_size off; \r\n	autoindex_localtime off; \r\n	\r\n	location ^~ / {\r\n		proxy_set_header Host $host:$server_port;\r\n    }\r\n	\r\n	location ~*\\.(jpg|gif|png|swf|flv|wma|wmv|asf|mp3|mmf|zip|rar|js|css)$ {\r\n		expires 30d;\r\n		valid_referers serverReferers;\r\n		if ($invalid_referer) {\r\n			rewrite ^/ serverLogoPath;\r\n		}\r\n    }\r\n}\r\n', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_update_recorde
-- ----------------------------
DROP TABLE IF EXISTS `sys_update_recorde`;
CREATE TABLE `sys_update_recorde` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新版本',
  `description` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新记录备注',
  `recorde_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '项目更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_update_recorde
-- ----------------------------
BEGIN;
INSERT INTO `sys_update_recorde` VALUES (1, '1.0.1', '第一版', '2020-03-24 06:02:01', '2020-03-24 06:02:01', '2020-03-24 06:02:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` smallint DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `user_type` enum('ROOT','ADMIN','USER') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'ADMIN' COMMENT '超级管理员、管理员、普通用户',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司',
  `blog` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人博客地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `source` enum('GITHUB','GITEE','WEIBO','DINGTALK','BAIDU','CSDN','CODING','OSCHINA','TENCENT_CLOUD','ALIPAY','TAOBAO','QQ','WECHAT','GOOGLE','FACEBOOK') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户来源',
  `uuid` varchar(50) DEFAULT NULL COMMENT '用户唯一表示(第三方网站)',
  `privacy` tinyint DEFAULT NULL COMMENT '隐私（1：公开，0：不公开）',
  `notification` tinyint unsigned DEFAULT NULL COMMENT '通知：(1：通知显示消息详情，2：通知不显示详情)',
  `score` int unsigned DEFAULT '0' COMMENT '金币值',
  `experience` int unsigned DEFAULT '0' COMMENT '经验值',
  `reg_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int unsigned DEFAULT '0' COMMENT '登录次数',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户备注',
  `status` int unsigned DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'root', 'CGUx1FN++xS+4wNDFeN6DA==', '超级管理员', '15151551516', '843977358@qq.com', '843977358', NULL, NULL, 'https://static.zhyd.me/static/img/favicon.ico', 'ROOT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '127.0.0.1', '2020-04-22 15:26:27', 257, NULL, 1, '2020-03-24 06:02:04', '2020-04-22 15:26:27');
INSERT INTO `sys_user` VALUES (2, 'admin', 'gXp2EbyZ+sB/A6QUMhiUJQ==', '管理员', '15151551516', '843977358@qq.com', '843977358', NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2020-04-22 14:28:33', 4, NULL, 1, '2020-03-24 06:02:05', '2020-04-22 14:28:33');
INSERT INTO `sys_user` VALUES (3, 'comment-admin', 'x9qCx3yP05yWfIE5wXbCsg==', '评论审核管理员', '', '', '', NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2020-03-24 06:02:05', 1, NULL, 1, '2020-03-24 06:02:05', '2020-03-24 06:02:05');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2020-03-24 06:02:05', '2020-03-24 06:02:05');
INSERT INTO `sys_user_role` VALUES (2, 2, 2, '2020-03-24 06:02:05', '2020-03-24 06:02:05');
INSERT INTO `sys_user_role` VALUES (3, 3, 3, '2020-03-24 06:02:05', '2020-03-24 06:02:05');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
