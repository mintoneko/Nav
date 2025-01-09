/*
 Navicat Premium Dump SQL

 Source Server         : macbook
 Source Server Type    : MySQL
 Source Server Version : 90001 (9.0.1)
 Source Host           : localhost:3306
 Source Schema         : nav

 Target Server Type    : MySQL
 Target Server Version : 90001 (9.0.1)
 File Encoding         : 65001

 Date: 10/01/2025 00:45:48
*/

-- 创建数据库 `nav`，如果不存在则创建
CREATE DATABASE IF NOT EXISTS `nav` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- 使用数据库 `nav`
USE `nav`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `name` varchar(30) DEFAULT NULL COMMENT '应用名',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用地址，唯一',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标路径',
  `category_id` bigint unsigned NOT NULL COMMENT '分类ID，逻辑外键',
  `description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `weight` int NOT NULL DEFAULT '0' COMMENT '应用权重，范围0-100，默认0',
  `click_count` int NOT NULL DEFAULT '0' COMMENT '点击量，默认0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态： 1:启用, 2:隐藏, 3:私有4:禁用,',
  `create_user` bigint unsigned NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` bigint unsigned DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `url_create_user` (`url`,`create_user`),
  KEY `app_category_idx` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用表';

-- ----------------------------
-- Records of app
-- ----------------------------
BEGIN;
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (33, 'iconfont', 'https://www.iconfont.cn/', 'https://img.alicdn.com/imgextra/i4/O1CN01Z5paLz1O0zuCC7osS_!!6000000001644-55-tps-83-82.svg', 34, 'iconfont-国内功能很强大且图标内容很丰富的矢量图标库，提供矢量图标下载、在线存储、格式转换等功能。阿里巴巴体验团队倾力打造，设计和前端开发的便捷工具', 1, 2, 1, 20, '2025-01-07 21:40:06', 20, '2025-01-07 22:20:43');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (35, 'Bootstarp', 'https://bootstrap.sbox.cn/docs/5.3/getting-started/introduction/', ' https://bootstrap.sbox.cn/docs/5.3/assets/img/favicons/android-chrome-192x192.png', 34, 'Bootstrap 是一个功能强大、功能丰富的前端工具包。在几分钟内构建从原型到生产的任何内容。', 1, 1, 1, 20, '2025-01-07 22:02:50', 20, '2025-01-07 22:06:34');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (36, 'NextUI', 'https://nextui.org/', 'https://nextui.org/favicon.ico', 34, 'Make beautiful websites regardless of your design experience.', 1, 1, 1, 20, '2025-01-07 22:06:09', 20, '2025-01-07 22:07:32');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (37, 'React', 'https://zh-hans.react.dev/', 'https://zh-hans.react.dev//apple-touch-icon.png', 34, 'React 让你可以通过组件来构建用户界面。你可以创建像 Thumbnail、LikeButton 和 Video 这样的组件。然后将它们组合成整个应用程序。', 1, 1, 1, 20, '2025-01-07 22:08:10', 20, '2025-01-07 22:20:54');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (38, 'Go', 'https://go.p2hp.com/', 'https://go.p2hp.com/favicon.ico', 35, 'Go 是谷歌支持的开源编程语言，易于学习和入门 内置并发和健壮的标准库，不断发展的合作伙伴、社区和工具生态系统', 1, 2, 1, 20, '2025-01-07 22:09:20', 20, '2025-01-07 23:10:07');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (39, 'Python', 'https://www.python.org/', 'https://www.python.org//static/favicon.ico', 35, 'Python is a programming language that lets you work quickly and integrate systems more effectively. ', 1, 0, 1, 20, '2025-01-07 22:09:55', 20, '2025-01-07 22:10:31');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (40, 'Java', 'https://docs.oracle.com/en/java/', 'https://www.java.com/favicon.ico', 35, 'Java是一种广泛应用于软件开发领域的高级编程语言。它具有简单易学、跨平台、安全可靠等特点，因此被广泛应用于各种领域，从大型企业应用到移动设备应用。', 1, 1, 1, 20, '2025-01-07 22:12:49', 20, '2025-01-07 22:13:20');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (41, 'C++', 'https://cplusplus.com/', 'https://c-cpp.com/icon.png', 35, 'C++ 是一种静态类型的、编译式的、通用的、大小写敏感的、不规则的编程语言，支持过程化编程、面向对象编程和泛型编程。', 1, 1, 1, 20, '2025-01-07 22:15:11', 20, '2025-01-07 22:16:08');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (42, 'LeetCode', 'https://leetcode.cn/', ' https://static.leetcode.cn/cn-frontendx-assets/production/_next/static/images/logo-711e116152be014f445f50aa6a369231.png?x-oss-process=image%2Fformat%2Cwebp', 36, '海量技术面试题库，拥有算法、数据结构、系统设计等 1000+题目，帮助你高效提升编程技能，轻松拿下世界 IT 名企 Dream Offer。', 1, 0, 1, 20, '2025-01-07 22:17:00', 20, '2025-01-07 22:17:32');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (43, '牛客', 'https://www.nowcoder.com/', 'https://static.nowcoder.com/fe/file/images/nowpick/web/www-favicon.ico', 36, '求职之前，先上牛客，就业找工作一站解决。互联网IT技术/产品/运营/硬件/汽车机械制造/金融/财务管理/审计/银行/市场营销/地产/快消/管培生等等专业技能学习/备考/求职神器，在线进行企业校招实习笔试面试真题模拟考试练习，全面提升求职竞争力，找到好工作，拿到好offer。_牛客网_牛客在手,offer不愁', 1, 0, 1, 20, '2025-01-07 22:18:07', 20, '2025-01-07 22:18:23');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (45, 'AcWing', 'https://www.acwing.com/', 'https://cdn.acwing.com/static/web/img/favicon.ico', 36, '一个专属于程序员的平台，为大家在漫漫的刷题之旅中，提供最优质的解答', 1, 0, 1, 20, '2025-01-07 22:20:32', 20, '2025-01-07 22:21:04');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (46, '洛谷', 'https://www.luogu.com.cn/', 'https://cdn.luogu.com.cn/upload/usericon/397.png', 36, '洛谷创建于 2013 年 6 月 15 日，至今已有数万用户，致力于为编程爱好者提供清爽、快捷的编程体验。它不仅仅是一个在线测题系统，更拥有强大的社区、在线学习功能。', 1, 0, 1, 20, '2025-01-07 22:22:49', 20, '2025-01-08 12:33:14');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (47, '阿里云', 'https://www.aliyun.com/', 'https://img.alicdn.com/tfs/TB1_ZXuNcfpK1RjSZFOXXa6nFXa-32-32.ico', 37, '阿里云——阿里巴巴集团旗下公司，是全球领先的云计算及人工智能科技公司之一。提供免费试用、云服务器、云数据库、云安全、云企业应用等云计算服务，以及大数据、人工智能服务、精准定制基于场景的行业解决方案。免费备案，7x24小时售后支持，助企业无忧上云。', 1, 0, 1, 20, '2025-01-07 22:25:19', 20, '2025-01-07 22:25:27');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (48, '腾讯云', 'https://cloud.tencent.com/', 'https://qcloudimg.tencent-cloud.cn/raw/3c38d33728331235771a7b57a4b00b09.png', 37, '腾讯云(tencent cloud)为数百万的企业和开发者提供安全稳定的云计算服务，涵盖云服务器、云数据库、云存储、视频与CDN、域名注册等全方位云服务和各行业解决方案。', 1, 1, 1, 20, '2025-01-07 22:25:50', 20, '2025-01-07 22:27:24');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (49, '谷歌云', 'https://cloud.google.com/?hl=zh-CN', 'https://www.gstatic.com/devrel-devsite/prod/v0d244f667a3683225cca86d0ecf9b9b81b1e734e55a030bdcd3f3094b835c987/cloud/images/favicons/onecloud/favicon.ico', 37, 'Meet your business challenges head on with cloud computing services from Google, including data management, hybrid & multi-cloud, and AI & ML.', 1, 0, 1, 20, '2025-01-07 22:28:00', 20, '2025-01-07 22:28:00');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (50, 'AWS', 'https://aws.amazon.com/cn/', 'https://a0.awsstatic.com/libra-css/images/site/fav/favicon.ico', 37, 'Amazon Web Services 提供的云计算服务可靠、可扩展且费用合理。免费加入，只需按使用量付费。', 1, 1, 1, 20, '2025-01-07 22:28:34', 20, '2025-01-07 22:28:41');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (52, 'ChatGPT', 'https://chatgpt.com/', 'https://cdn.oaistatic.com/assets/favicon-o20kmmos.svg', 39, 'ChatGPT是一种基于Transformer结构的自然语言处理模型，由OpenAI公司开发。它具有强大的文本生成和对话生成能力，被广泛应用于各种NLP应用场景。', 1, 0, 1, 20, '2025-01-07 22:34:34', 20, '2025-01-07 22:35:36');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (53, 'DeepSeek', 'https://chat.deepseek.com/', 'https://cdn.deepseek.com/chat/icon.png', 39, '这是一种强大的专家混合 (MoE) 语言模型，总参数为 671B，每个令牌激活 37B。为了实现高效的推理和经济高效的训练，DeepSeek-V3 采用了多头潜在注意力（MLA）和 DeepSeekMoE 架构，这些架构在 DeepSeek-V2 中得到了彻底的验证。此外，DeepSeek-V3首创了负载均衡的辅助无损策略，并设置了多令牌预测训练目标以获得更强的性能。', 1, 0, 1, 20, '2025-01-07 22:36:49', 20, '2025-01-07 22:36:49');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (54, '文心一言', 'https://yiyan.baidu.com/', 'https://nlp-eb.cdn.bcebos.com/logo/favicon.ico', 39, '文心一言既是你的智能伙伴，可以陪你聊天、回答问题、画图识图；也是你的AI助手，可以提供灵感、撰写文案、阅读文档、智能翻译，帮你高效完成工作和学习任务。', 1, 0, 1, 20, '2025-01-07 22:37:20', 20, '2025-01-07 22:37:20');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (55, '通义千问', 'https://tongyi.aliyun.com/', 'https://img.alicdn.com/imgextra/i1/O1CN01AKUdEM1qP6BQVaYhT_!!6000000005487-2-tps-512-512.png', 39, '通义是一个通情、达义的国产AI模型，可以帮你解答问题、文档阅读、联网搜索并写作总结，最多支持1000万字的文档速读。通义tongyi.ai_你的全能AI助手', 1, 0, 1, 20, '2025-01-07 22:37:56', 20, '2025-01-07 22:38:10');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (56, 'iLovePDF', 'https://www.ilovepdf.com/zh-cn', 'https://www.ilovepdf.com/img/favicons-pdf/favicon-32x32.png', 40, 'iLovePDF网站提供PDF文件在线转换服务。它完全免费，而且使用方便。无论是合并PDF文件、拆分PDF文件、压缩PDF文件、Office文件转换为PDF文件，还是PDF转换为JPG图片等，iLovePDF都能满足您的需求！', 1, 0, 1, 20, '2025-01-08 01:04:31', 20, '2025-01-08 01:05:57');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (58, 'iLoveIMG', 'https://www.iloveimg.com/zh-cn', 'https://www.iloveimg.com/img/favicons-img/favicon-16x16.png', 40, 'iLoveIMG是一款在线处理图片文件的网站。我们的服务完全免费，而且使用简便。网站的功能有：压缩图像文件、调整文件尺寸、裁剪文件，以及转换文件格式等！', 1, 0, 1, 20, '2025-01-08 01:06:21', 20, '2025-01-08 01:08:53');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (66, '在线Adobe', 'https://acrobat.adobe.com/link/home/', 'https://acrobat.adobe.com/home/a36706b/pwa/pwa-images/acrobat_reader_pro_standard_appicons_macos11_256x256@1x.png', 40, 'Adobe 提供的一个平台，主要用于 PDF 文档的创建、编辑、共享和管理。', 1, 1, 1, 20, '2025-01-08 01:09:32', 20, '2025-01-08 01:12:56');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (67, 'darw', 'https://app.diagrams.net/', 'https://app.diagrams.net/favicon.ico', 40, 'draw.io is free online diagram software for making flowcharts, process diagrams, org charts, UML, ER and network diagrams', 1, 0, 1, 20, '2025-01-08 01:11:31', 20, '2025-01-08 01:11:31');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (68, '抖音', 'https://www.douyin.com', 'https://lf1-cdn-tos.bytegoofy.com/goofy/ies/douyin_web/public/favicon.ico', 41, '抖音是由字节跳动公司于2016年9月推出的一款短视频社交应用，主要面向中国大陆、香港和澳门地区运营。 ￼用户可以通过抖音录制并分享15秒至10分钟的短视频，展示个人才艺、生活片段或创意内容。', 1, 0, 1, 20, '2025-01-08 01:15:26', 20, '2025-01-08 12:11:50');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (69, '哔哩哔哩', 'https://www.bilibili.com/', 'https://i.111666.best/image/Y2W6x7YJy5nLtwSHs1z1g0.jpeg', 41, '中国领先的年轻人文化社区和视频平台，成立于2009年6月26日。 ￼最初，B站以ACG（动画、漫画、游戏）内容为主，现已扩展至音乐、舞蹈、科技、生活、时尚等多个领域，形成了多元化的内容生态。', 1, 0, 1, 20, '2025-01-08 12:12:36', 20, '2025-01-08 12:22:14');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (70, '腾讯视频', 'https://v.qq.com/', 'https://vfiles.gtimg.cn/wuji_dashboard/xy/starter/4ea79867.png', 41, '中国领先的在线视频媒体平台,海量高清视频在线观看', 1, 0, 1, 20, '2025-01-08 12:23:02', 20, '2025-01-08 12:23:19');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (71, '爱奇艺', 'https://www.iqiyi.com', 'https://i.111666.best/image/iC2P9eVDUu5FaNAw1TrX6y.png', 41, '爱奇艺（iQIYI）是中国领先的在线视频网站，成立于2010年4月22日，总部位于北京市。最初名为“奇艺”，于2011年11月26日更名为“爱奇艺” ', 1, 0, 1, 20, '2025-01-08 12:28:02', 20, '2025-01-08 12:32:13');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (72, '知乎', 'https://www.zhihu.com/', 'https://static.zhihu.com/heifetz/favicon.ico', 42, '知乎是一个中文互联网平台，成立于2011年，是一个以问答社区为核心的综合性内容分享平台。用户可以在知乎上提问、回答问题、发表文章、参与讨论，并通过分享知识和观点获得他人的关注与认可。', 1, 1, 1, 21, '2025-01-08 15:21:21', 21, '2025-01-08 19:47:16');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (73, '微博', 'https://m.weibo.cn/', 'https://m.weibo.cn//favicon.ico', 42, '微博是一个以信息分享、传播与交流为核心的社交媒体平台，由新浪公司于2009年推出，是中国最具影响力的社交网络之一，被称为“中文Twitter”。微博通过文字、图片、视频等形式，为用户提供实时信息和互动的场所。', 1, 1, 1, 21, '2025-01-08 19:48:57', 21, '2025-01-08 19:53:24');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (74, '百度贴吧', 'https://tieba.baidu.com/index.html', 'https://tb3.bdstatic.com/public/icon/favicon-v2.ico', 42, '百度公司于2003年推出的一个基于兴趣的中文网络社区，它是中国最大的网络论坛之一，也是一个结合兴趣主题、用户讨论和社交功能的平台。', 1, 1, 1, 21, '2025-01-08 19:50:05', 21, '2025-01-08 19:51:12');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (75, '网易新闻', 'https://news.163.com/', 'https://news.163.com/favicon.ico', 42, '新闻,新闻中心,包含有时政新闻,国内新闻,国际新闻,社会新闻,时事评论,新闻图片,新闻专题,新闻论坛,军事,历史,的专业时事报道门户网站', 1, 0, 1, 21, '2025-01-08 19:52:07', 21, '2025-01-08 19:52:29');
INSERT INTO `app` (`id`, `name`, `url`, `icon_url`, `category_id`, `description`, `weight`, `click_count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (78, '新华网_让新闻离你更近', 'http://www.news.cn/', 'http://www.news.cn//favicon.ico', 44, '中国主要重点新闻网站,依托新华社遍布全球的采编网络,记者遍布世界100多个国家和地区,地方频道分布全国31个省市自治区,每天24小时同时使用6种语言滚动发稿,权威、准确、及时播发国内外重要新闻和重大突发事件,受众覆盖200多个国家和地区,发展论坛是全球知名的中文论坛。', 1, 1, 1, 23, '2025-01-08 21:30:40', 23, '2025-01-08 21:30:40');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父分类的ID，NULL表示没有父分类',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名，唯一',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分类描述',
  `weight` int NOT NULL DEFAULT '0' COMMENT '分类权重，范围0-100，默认0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0表示禁用，1表示启用',
  `create_user` bigint unsigned NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` bigint unsigned DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_parent_idx` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (33, NULL, '软件开发', '', 1, 1, 20, '2025-01-07 21:14:53', 20, '2025-01-07 21:14:53');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (34, 33, '前端开发', '', 1, 1, 20, '2025-01-07 21:15:11', 20, '2025-01-07 21:15:11');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (35, 33, '后端开发', '', 1, 1, 20, '2025-01-07 21:15:23', 20, '2025-01-07 21:15:23');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (36, 33, '笔试面试', '', 1, 1, 20, '2025-01-07 21:15:35', 20, '2025-01-07 21:15:35');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (37, 33, '云服务', '', 1, 1, 20, '2025-01-07 21:15:44', 20, '2025-01-07 21:15:44');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (38, NULL, '常用工具', '', 1, 1, 20, '2025-01-07 22:33:40', 20, '2025-01-07 22:33:40');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (39, 38, 'AI工具', '', 1, 1, 20, '2025-01-07 22:33:49', 20, '2025-01-07 22:33:49');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (40, 38, '文件处理', '', 1, 1, 20, '2025-01-08 01:04:04', 20, '2025-01-08 01:04:04');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (41, NULL, '影视娱乐', '', 1, 1, 20, '2025-01-08 01:15:11', 20, '2025-01-08 01:15:11');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (42, NULL, '个人收藏', '', 1, 1, 21, '2025-01-08 15:20:50', 21, '2025-01-08 15:20:50');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `weight`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (44, NULL, '热点新闻', '', 1, 1, 23, '2025-01-08 21:29:44', 23, '2025-01-08 21:29:44');
COMMIT;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value_varchar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `value_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设置';

-- ----------------------------
-- Records of setting
-- ----------------------------
BEGIN;
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (1, 'announce', NULL, '<p>helloworld</p>');
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (2, 'bottom_company_name', '', '');
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (3, 'bottom_icp', '', '');
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (4, 'bottom_police', '', '');
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (5, 'site_name', 'Go导航', NULL);
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (6, 'site_logo', 'http://localhost/src/assets/logo.png', NULL);
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (7, 'login_github', 'false', '');
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (8, 'login_linuxdo', 'false', '');
INSERT INTO `setting` (`id`, `key`, `value_varchar`, `value_text`) VALUES (9, 'github_logo', 'true', '');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话号码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '游客' COMMENT '昵称',
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '角色，0表示禁用用户，1表示用户，2表示管理员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  CONSTRAINT `user_chk_1` CHECK ((`role` in (0,1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `email`, `phone`, `password`, `nickname`, `role`, `create_time`, `update_time`) VALUES (20, 'admin', 'mobaisilent@gmail.com', NULL, '$2a$10$w/speRI4Uoq.VObsM/4ka.sHGdW/AzsPZrdWWHwzf5V26i0mUGDwS', '管理员', 2, '2025-01-07 14:02:54', '2025-01-07 21:16:16');
INSERT INTO `user` (`id`, `username`, `email`, `phone`, `password`, `nickname`, `role`, `create_time`, `update_time`) VALUES (21, '2789221517@qq.com', '2789221517@qq.com', NULL, '$2a$10$2fvmUK1eJwi9GnKcsyryFuZsfypytjMoaJPo7BtyktLL3ZiQqaO6e', '游客', 1, '2025-01-07 21:49:57', '2025-01-08 13:40:49');
INSERT INTO `user` (`id`, `username`, `email`, `phone`, `password`, `nickname`, `role`, `create_time`, `update_time`) VALUES (22, 'nekoclawo@gmail.com', 'nekoclawo@gmail.com', NULL, '$2a$10$RLvgCDUomBE5mNDWqH8KfO5k9W30zGZmT8l/Z0u/mnYBw4lLyFnmm', '游客', 1, '2025-01-08 16:31:26', '2025-01-08 16:31:26');
INSERT INTO `user` (`id`, `username`, `email`, `phone`, `password`, `nickname`, `role`, `create_time`, `update_time`) VALUES (23, '484547374@qq.com', '484547374@qq.com', NULL, '$2a$10$g3KR7pKxnn5juOH5j9goyOd0zbwSDupJgOGazs1tye/ZnLKUPUHUi', '游客', 1, '2025-01-08 21:29:00', '2025-01-08 21:29:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
