/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-06-17 22:23:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Android');
INSERT INTO `categories` VALUES ('2', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Java');
INSERT INTO `categories` VALUES ('3', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Php');
INSERT INTO `categories` VALUES ('4', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Spring');
INSERT INTO `categories` VALUES ('5', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Laravel');
INSERT INTO `categories` VALUES ('6', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Vue');
INSERT INTO `categories` VALUES ('7', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'Js');
INSERT INTO `categories` VALUES ('8', '2017-06-06 21:09:57', '2017-06-06 21:09:57', 'rqwer');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `commentable_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `html_content` text COLLATE utf8_unicode_ci NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_index` (`user_id`),
  KEY `comments_commentable_id_index` (`commentable_id`),
  KEY `comments_commentable_type_index` (`commentable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '37', '评论', '<p>评论</p>', 'App\\Post', 'Justen Fisher', 'collier.fredrick@example.net', null, '2017-01-14 09:51:22', '2017-01-14 09:51:22', null);
INSERT INTO `comments` VALUES ('2', '1', '37', '评论2', '<p>评论2</p>', 'App\\Post', 'Justen Fisher', 'collier.fredrick@example.net', null, '2017-01-14 09:51:31', '2017-01-14 09:51:31', null);
INSERT INTO `comments` VALUES ('3', '1', '40', 'gdfsgafdgf', '<p>gdfsgafdgf</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:06:18', '2017-06-13 10:06:18', null);
INSERT INTO `comments` VALUES ('4', '1', '40', 'dadf', '<p>dadf</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:06:21', '2017-06-13 10:06:21', null);
INSERT INTO `comments` VALUES ('5', '1', '40', 'fasdfds', '<p>fasdfds</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:06:24', '2017-06-13 10:06:24', null);
INSERT INTO `comments` VALUES ('6', '1', '40', 'fdasfd', '<p>fdasfd</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:06:26', '2017-06-13 10:06:26', null);
INSERT INTO `comments` VALUES ('7', '1', '40', 'asdfd', '<p>asdfd</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:14:19', '2017-06-13 10:14:19', null);
INSERT INTO `comments` VALUES ('8', '1', '40', 'gsdfg', '<p>gsdfg</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:17:58', '2017-06-13 10:17:58', null);
INSERT INTO `comments` VALUES ('9', '1', '40', 'ddd', '<p>ddd</p>', 'App\\Post', 'liu', '1662853651@163.com', null, '2017-06-13 10:30:29', '2017-06-13 10:30:29', null);
INSERT INTO `comments` VALUES ('10', null, '40', '[@liu](http://www.blog.com/user/liu) ddd', '<p><a href=\"http://www.blog.com/user/liu\">@liu</a> ddd</p>', 'App\\Post', '33', 'undefined@qq.com', null, '2017-06-15 21:49:45', '2017-06-15 21:49:45', 'undefined');

-- ----------------------------
-- Table structure for configurations
-- ----------------------------
DROP TABLE IF EXISTS `configurations`;
CREATE TABLE `configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configurable_id` int(10) unsigned NOT NULL,
  `configurable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `configurations_configurable_id_index` (`configurable_id`),
  KEY `configurations_configurable_type_index` (`configurable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of configurations
-- ----------------------------
INSERT INTO `configurations` VALUES ('1', '37', 'App\\Post', '{\"comment_type\":\"default\",\"comment_info\":\"default\"}');
INSERT INTO `configurations` VALUES ('2', '38', 'App\\Post', '{\"comment_type\":\"raw\",\"comment_info\":\"force_enable\"}');
INSERT INTO `configurations` VALUES ('3', '39', 'App\\Post', '{\"comment_type\":\"disqus\",\"comment_info\":\"force_enable\"}');
INSERT INTO `configurations` VALUES ('4', '2', 'App\\Page', '{\"comment_type\":\"default\",\"comment_info\":\"default\",\"display\":\"true\",\"sort_order\":\"1\"}');
INSERT INTO `configurations` VALUES ('5', '40', 'App\\Post', '{\"comment_type\":\"default\",\"comment_info\":\"force_enable\"}');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_key_unique` (`key`),
  KEY `files_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('1', 'bizhi362_15.jpg', 'xblog/image/72344ff3c91b0f480130a8ccaf261026.jpeg', 'image', '331287', '2017-01-14 11:56:04', '2017-01-14 11:56:04');
INSERT INTO `files` VALUES ('2', '1384998229592.jpg', '/xblog/image/d2658f022087316d86043db5dc6af353.jpeg', 'image', '138143', '2017-01-17 10:04:06', '2017-01-17 10:04:06');
INSERT INTO `files` VALUES ('3', '1384998236580.jpg', '/xblog/image/0aa6cdfa4980ec7ae6e857c295e5ecc0.jpeg', 'image', '1451111', '2017-01-17 10:04:30', '2017-01-17 10:04:30');

-- ----------------------------
-- Table structure for maps
-- ----------------------------
DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `meta` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maps_key_unique` (`key`),
  KEY `maps_tag_index` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of maps
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_08_17_020525_create_post_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_08_17_100718_create_category_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_08_17_100746_create_tag_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_08_17_100824_create_post_tag_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_08_19_031942_create_page_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_09_17_180623_create_files_table', '1');
INSERT INTO `migrations` VALUES ('9', '2016_09_18_184119_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('10', '2016_09_21_135514_create_maps_table', '1');
INSERT INTO `migrations` VALUES ('11', '2016_09_24_200043_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('12', '2016_10_05_010705_create_notifications_table', '1');
INSERT INTO `migrations` VALUES ('13', '2016_10_08_074142_create_configurations_table', '1');
INSERT INTO `migrations` VALUES ('14', '2016_12_03_132259_add_site_to_table_comments', '1');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('b26ea0bf-6c78-45a0-b755-7b77e7f12ee5', 'App\\Notifications\\ReceivedComment', '1', 'App\\User', '{\"id\":10,\"user_id\":null,\"commentable_id\":40,\"content\":\"[@liu](http:\\/\\/www.blog.com\\/user\\/liu) ddd\",\"html_content\":\"<p><a href=\\\"http:\\/\\/www.blog.com\\/user\\/liu\\\">@liu<\\/a> ddd<\\/p>\",\"commentable_type\":\"App\\\\Post\",\"username\":\"33\",\"email\":\"undefined@qq.com\",\"deleted_at\":null,\"created_at\":\"2017-06-15 21:49:45\",\"updated_at\":\"2017-06-15 21:49:45\",\"site\":\"undefined\"}', '2017-06-17 21:52:20', '2017-06-15 21:49:45', '2017-06-17 21:52:20');
INSERT INTO `notifications` VALUES ('f7f740a6-d904-4cc1-927e-64640a43ff20', 'App\\Notifications\\MentionedInComment', '1', 'App\\User', '{\"id\":10,\"user_id\":null,\"commentable_id\":40,\"content\":\"[@liu](http:\\/\\/www.blog.com\\/user\\/liu) ddd\",\"html_content\":\"<p><a href=\\\"http:\\/\\/www.blog.com\\/user\\/liu\\\">@liu<\\/a> ddd<\\/p>\",\"commentable_type\":\"App\\\\Post\",\"username\":\"33\",\"email\":\"undefined@qq.com\",\"deleted_at\":null,\"created_at\":\"2017-06-15 21:49:45\",\"updated_at\":\"2017-06-15 21:49:45\",\"site\":\"undefined\"}', '2017-06-17 21:52:20', '2017-06-15 21:49:45', '2017-06-17 21:52:20');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('2', null, '2017-05-30 21:52:47', '22', '22', '22333', '<p>22333</p>');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_index` (`user_id`),
  KEY `posts_category_id_index` (`category_id`),
  KEY `posts_published_at_index` (`published_at`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '6', '4', 'Odit voluptatem quos qui nobis.', 'In occaecati in iusto soluta quis tenetur architecto similique laudantium architecto aut iste optio aperiam.', 'est-sunt-nesciunt-vel-dignissimos', 'Est corrupti qui consectetur molestias voluptatum. Harum voluptas quidem dolorem nesciunt quia. Perferendis omnis sunt sit.\n\nDolorum veniam et deleniti non perspiciatis harum illo. Quo id quaerat commodi totam similique voluptatem enim. Sunt eos maxime aut architecto sunt eaque. Quibusdam et quis fugit natus.\n\nAut sed dolores rem repellat. Ipsa voluptatem optio reiciendis exercitationem quas temporibus earum.\n\nMaxime dolore repellat eos occaecati est suscipit illum sed. Suscipit voluptatem et et quos delectus ab aut. Eligendi facilis ipsum beatae distinctio sed nostrum enim.\n\nIpsa aut necessitatibus cupiditate ullam dolor. Expedita alias eum similique asperiores qui consequatur. Quis dignissimos veritatis beatae enim rem repellendus corrupti fugit.\n\nDolorem aperiam et tempora necessitatibus iure. Nulla vero ducimus incidunt sequi sunt cupiditate.\n\nNihil explicabo qui harum nesciunt illum quia qui labore. Aut nulla unde aut sunt eum. Vel qui est accusamus maiores. Quas odio ipsam vero porro provident.', 'Est corrupti qui consectetur molestias voluptatum. Harum voluptas quidem dolorem nesciunt quia. Perferendis omnis sunt sit.\n\nDolorum veniam et deleniti non perspiciatis harum illo. Quo id quaerat commodi totam similique voluptatem enim. Sunt eos maxime aut architecto sunt eaque. Quibusdam et quis fugit natus.\n\nAut sed dolores rem repellat. Ipsa voluptatem optio reiciendis exercitationem quas temporibus earum.\n\nMaxime dolore repellat eos occaecati est suscipit illum sed. Suscipit voluptatem et et quos delectus ab aut. Eligendi facilis ipsum beatae distinctio sed nostrum enim.\n\nIpsa aut necessitatibus cupiditate ullam dolor. Expedita alias eum similique asperiores qui consequatur. Quis dignissimos veritatis beatae enim rem repellendus corrupti fugit.\n\nDolorem aperiam et tempora necessitatibus iure. Nulla vero ducimus incidunt sequi sunt cupiditate.\n\nNihil explicabo qui harum nesciunt illum quia qui labore. Aut nulla unde aut sunt eum. Vel qui est accusamus maiores. Quas odio ipsam vero porro provident.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1982-06-16 18:51:17', null);
INSERT INTO `posts` VALUES ('2', '6', '4', 'Ut culpa esse magni ratione pariatur animi consequatur dolores recusandae.', 'Et tenetur tempore inventore consequuntur fugit aut fugiat quia quo praesentium modi doloribus aut harum.', 'dolor-harum-et-et-maiores-aut-iste', 'Nostrum reprehenderit libero porro eius reiciendis eaque cumque. Voluptate est voluptatem est. Quo consectetur dolorem sed qui eum explicabo quis. Ipsa et omnis sunt inventore ut numquam. Ratione aperiam est incidunt at inventore magnam eum et.\n\nRepellendus sit ad eos et sed. Aliquam aut aliquid ut. Vero nihil a corrupti earum id non enim.\n\nAliquam cupiditate quidem modi harum molestiae molestias. Itaque deleniti fugiat voluptas asperiores hic perferendis deleniti.\n\nEsse sequi cumque ducimus pariatur. Labore excepturi delectus architecto sed voluptatem aut aut. Ut aspernatur dolor omnis maiores. Cum hic eum et velit. Ut illum quidem et.\n\nEa voluptas eum suscipit qui suscipit velit iusto. Ut magni qui omnis quibusdam aut.\n\nTotam ullam quae odit adipisci omnis laudantium. Neque eligendi ipsam corrupti et.\n\nEius amet aut fugiat ullam vel corrupti. Labore vel in enim amet modi quia officiis.\n\nAd nemo eum quas eos. Quo omnis dolor sint. Et veniam harum et.', 'Nostrum reprehenderit libero porro eius reiciendis eaque cumque. Voluptate est voluptatem est. Quo consectetur dolorem sed qui eum explicabo quis. Ipsa et omnis sunt inventore ut numquam. Ratione aperiam est incidunt at inventore magnam eum et.\n\nRepellendus sit ad eos et sed. Aliquam aut aliquid ut. Vero nihil a corrupti earum id non enim.\n\nAliquam cupiditate quidem modi harum molestiae molestias. Itaque deleniti fugiat voluptas asperiores hic perferendis deleniti.\n\nEsse sequi cumque ducimus pariatur. Labore excepturi delectus architecto sed voluptatem aut aut. Ut aspernatur dolor omnis maiores. Cum hic eum et velit. Ut illum quidem et.\n\nEa voluptas eum suscipit qui suscipit velit iusto. Ut magni qui omnis quibusdam aut.\n\nTotam ullam quae odit adipisci omnis laudantium. Neque eligendi ipsam corrupti et.\n\nEius amet aut fugiat ullam vel corrupti. Labore vel in enim amet modi quia officiis.\n\nAd nemo eum quas eos. Quo omnis dolor sint. Et veniam harum et.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '2005-05-24 11:45:54', null);
INSERT INTO `posts` VALUES ('3', '6', '4', 'Aliquam suscipit minima ea sit.', 'Dolorem cum dolores soluta culpa.', 'assumenda-excepturi-sunt-nisi', 'Nemo earum et animi placeat animi. Quia dicta eos in itaque necessitatibus.\n\nDoloremque nesciunt dolore suscipit harum labore. Qui nisi corporis dolor autem blanditiis. Dolor sed velit ut et iusto velit ex. Consequatur molestiae facere repudiandae quidem. Distinctio et rerum consequuntur.\n\nConsectetur velit facilis facere. Hic ab quo officiis magni consequatur. Vitae reiciendis sint consequatur est minima repudiandae quos. Eaque modi ad recusandae harum voluptate a expedita.\n\nIure maxime ex repellat fuga. Molestiae non minus ex distinctio dolores et voluptates. Magni est et ratione voluptatum suscipit voluptatem quis. Praesentium voluptatem quo quia. Non perspiciatis dicta temporibus sint.\n\nConsectetur est deleniti et harum. Sapiente sequi praesentium reprehenderit. Non nemo ea architecto minus excepturi quaerat numquam et. Itaque qui enim architecto atque neque.\n\nEx dolores ratione dicta nihil est at reiciendis. Ducimus voluptates quia aut porro aut doloremque. Velit laudantium inventore sit doloremque. Ut fuga vero doloribus est voluptatum.\n\nId aliquid facere reprehenderit error. Ipsam rerum sapiente laborum possimus.\n\nEt et odit quia earum. Aut sequi quibusdam veniam provident. Quis ducimus quae ea et facere illum.\n\nIure sed enim voluptatem et consectetur cumque. Recusandae ipsam perspiciatis optio pariatur illum dolor.\n\nQuis tempora est sequi dolores eaque et. Aperiam est dolor facere consectetur dolores sit voluptates. Accusamus quam assumenda rerum minima eos.\n\nModi id a quae esse. Neque consequatur velit quia quis blanditiis ut. Autem pariatur suscipit impedit voluptatem tempore modi. Cum neque cum quia odit.\n\nEt eaque asperiores consequuntur consequatur. Repellendus fugiat voluptatem temporibus rerum. Corrupti harum quam natus hic ad error. Neque consequuntur voluptatem sit et reprehenderit.\n\nSimilique aspernatur consequatur ipsum ab ut aut sit. Veniam aliquid totam omnis ut. Nam et veritatis voluptatem fugiat mollitia necessitatibus.\n\nUllam omnis quod eos maxime id. Velit et et omnis saepe. Repellendus sit in pariatur.\n\nTempore a consectetur ipsam quasi fugit et reprehenderit. Voluptatum expedita ut modi perspiciatis quam eum aut. Assumenda aut aut ipsa rem impedit.\n\nAd ut dolorem dolore. Autem dolorem modi quia dolorum quisquam ratione. Id qui necessitatibus voluptas.\n\nReprehenderit magni magnam cumque earum consequatur. Voluptas aut facere voluptatum. Praesentium aut esse deserunt qui. Voluptates odio quia nam officiis et velit.\n\nAccusamus et eum labore facere sit. Dolores et aut eaque distinctio dolorem. Voluptates optio magnam accusamus quia qui placeat beatae.\n\nOccaecati molestiae quia cumque fugit. Aliquid ea architecto alias aut consectetur. Sed quasi libero asperiores consectetur minus.\n\nExplicabo aperiam corrupti commodi. Nemo vel ut ut sed voluptas veritatis. Cupiditate autem velit aliquam dolorem. Accusamus nostrum modi error enim magnam totam.', 'Nemo earum et animi placeat animi. Quia dicta eos in itaque necessitatibus.\n\nDoloremque nesciunt dolore suscipit harum labore. Qui nisi corporis dolor autem blanditiis. Dolor sed velit ut et iusto velit ex. Consequatur molestiae facere repudiandae quidem. Distinctio et rerum consequuntur.\n\nConsectetur velit facilis facere. Hic ab quo officiis magni consequatur. Vitae reiciendis sint consequatur est minima repudiandae quos. Eaque modi ad recusandae harum voluptate a expedita.\n\nIure maxime ex repellat fuga. Molestiae non minus ex distinctio dolores et voluptates. Magni est et ratione voluptatum suscipit voluptatem quis. Praesentium voluptatem quo quia. Non perspiciatis dicta temporibus sint.\n\nConsectetur est deleniti et harum. Sapiente sequi praesentium reprehenderit. Non nemo ea architecto minus excepturi quaerat numquam et. Itaque qui enim architecto atque neque.\n\nEx dolores ratione dicta nihil est at reiciendis. Ducimus voluptates quia aut porro aut doloremque. Velit laudantium inventore sit doloremque. Ut fuga vero doloribus est voluptatum.\n\nId aliquid facere reprehenderit error. Ipsam rerum sapiente laborum possimus.\n\nEt et odit quia earum. Aut sequi quibusdam veniam provident. Quis ducimus quae ea et facere illum.\n\nIure sed enim voluptatem et consectetur cumque. Recusandae ipsam perspiciatis optio pariatur illum dolor.\n\nQuis tempora est sequi dolores eaque et. Aperiam est dolor facere consectetur dolores sit voluptates. Accusamus quam assumenda rerum minima eos.\n\nModi id a quae esse. Neque consequatur velit quia quis blanditiis ut. Autem pariatur suscipit impedit voluptatem tempore modi. Cum neque cum quia odit.\n\nEt eaque asperiores consequuntur consequatur. Repellendus fugiat voluptatem temporibus rerum. Corrupti harum quam natus hic ad error. Neque consequuntur voluptatem sit et reprehenderit.\n\nSimilique aspernatur consequatur ipsum ab ut aut sit. Veniam aliquid totam omnis ut. Nam et veritatis voluptatem fugiat mollitia necessitatibus.\n\nUllam omnis quod eos maxime id. Velit et et omnis saepe. Repellendus sit in pariatur.\n\nTempore a consectetur ipsam quasi fugit et reprehenderit. Voluptatum expedita ut modi perspiciatis quam eum aut. Assumenda aut aut ipsa rem impedit.\n\nAd ut dolorem dolore. Autem dolorem modi quia dolorum quisquam ratione. Id qui necessitatibus voluptas.\n\nReprehenderit magni magnam cumque earum consequatur. Voluptas aut facere voluptatum. Praesentium aut esse deserunt qui. Voluptates odio quia nam officiis et velit.\n\nAccusamus et eum labore facere sit. Dolores et aut eaque distinctio dolorem. Voluptates optio magnam accusamus quia qui placeat beatae.\n\nOccaecati molestiae quia cumque fugit. Aliquid ea architecto alias aut consectetur. Sed quasi libero asperiores consectetur minus.\n\nExplicabo aperiam corrupti commodi. Nemo vel ut ut sed voluptas veritatis. Cupiditate autem velit aliquam dolorem. Accusamus nostrum modi error enim magnam totam.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1977-11-09 20:34:09', null);
INSERT INTO `posts` VALUES ('4', '6', '6', 'Cumque asperiores ipsa quis quis velit facere.', 'Corrupti id delectus soluta aut qui consequuntur enim.', 'enim-sequi-iusto-quibusdam-dolores', 'Aliquam sit facilis odio ut mollitia. Eos ex repellat a blanditiis ut qui laudantium recusandae. Quisquam eum quos odio unde et ex. Fugiat ipsam eaque alias nobis rerum.\n\nIllum odit vel illo necessitatibus maxime ut. Ipsa ea enim aut. Eum dolorem voluptatem similique repudiandae. Deserunt dolores sed dolore dolorem enim at aut debitis. Omnis magni unde quam non ipsam.\n\nReprehenderit ut doloribus cum ut consequatur voluptatum amet eos. Nihil nulla voluptatem aliquam voluptatum. Quia quo reiciendis libero.\n\nLabore aut eaque alias molestiae. Eum laudantium est sit commodi. Quam velit similique eum error voluptas ex inventore. Aliquid nihil id beatae perspiciatis facilis.\n\nIn rem dignissimos dolor voluptatem. Vero rem est voluptates similique. Et eum voluptas impedit atque nihil. Veniam hic quidem et ab nisi et fugiat.\n\nArchitecto illum et dolor quae et repellendus. Aut in labore ut. Eligendi id aut reprehenderit dolorum.\n\nMollitia voluptatibus ab in corporis possimus. Non doloremque illo deleniti commodi sit non. Aperiam aut possimus delectus sed possimus beatae fugiat. Sed ab aut fugit et dignissimos voluptas quidem.\n\nVelit iure placeat magnam molestiae. Ut quibusdam minus sint porro commodi.\n\nSuscipit ea sed veritatis quaerat et illum ut. In dicta accusantium nisi qui. Facilis ex illum inventore ut illo quis.\n\nArchitecto asperiores aut sequi cum suscipit dolorem. Iure quia aut mollitia omnis. Eos voluptatibus hic omnis nam.\n\nReprehenderit eius et exercitationem quos error voluptatem. Sequi commodi voluptatem et officia delectus. Iure id aut et incidunt aut. Nemo non incidunt et sint aut ab.', 'Aliquam sit facilis odio ut mollitia. Eos ex repellat a blanditiis ut qui laudantium recusandae. Quisquam eum quos odio unde et ex. Fugiat ipsam eaque alias nobis rerum.\n\nIllum odit vel illo necessitatibus maxime ut. Ipsa ea enim aut. Eum dolorem voluptatem similique repudiandae. Deserunt dolores sed dolore dolorem enim at aut debitis. Omnis magni unde quam non ipsam.\n\nReprehenderit ut doloribus cum ut consequatur voluptatum amet eos. Nihil nulla voluptatem aliquam voluptatum. Quia quo reiciendis libero.\n\nLabore aut eaque alias molestiae. Eum laudantium est sit commodi. Quam velit similique eum error voluptas ex inventore. Aliquid nihil id beatae perspiciatis facilis.\n\nIn rem dignissimos dolor voluptatem. Vero rem est voluptates similique. Et eum voluptas impedit atque nihil. Veniam hic quidem et ab nisi et fugiat.\n\nArchitecto illum et dolor quae et repellendus. Aut in labore ut. Eligendi id aut reprehenderit dolorum.\n\nMollitia voluptatibus ab in corporis possimus. Non doloremque illo deleniti commodi sit non. Aperiam aut possimus delectus sed possimus beatae fugiat. Sed ab aut fugit et dignissimos voluptas quidem.\n\nVelit iure placeat magnam molestiae. Ut quibusdam minus sint porro commodi.\n\nSuscipit ea sed veritatis quaerat et illum ut. In dicta accusantium nisi qui. Facilis ex illum inventore ut illo quis.\n\nArchitecto asperiores aut sequi cum suscipit dolorem. Iure quia aut mollitia omnis. Eos voluptatibus hic omnis nam.\n\nReprehenderit eius et exercitationem quos error voluptatem. Sequi commodi voluptatem et officia delectus. Iure id aut et incidunt aut. Nemo non incidunt et sint aut ab.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1996-05-12 22:51:22', null);
INSERT INTO `posts` VALUES ('5', '6', '6', 'Et ex quia quis ut dolor ea aut.', 'Consequatur et laborum sunt consequatur id pariatur labore nulla fugiat dolores omnis ab recusandae.', 'omnis-nisi-dicta-tempore-aut-qui-aut-voluptatem', 'Alias qui exercitationem nulla ut commodi. Facere voluptate culpa doloremque quos quam quia optio. Dolor aut reiciendis repellat doloremque ea natus saepe. Ipsum architecto aut qui esse.\n\nOmnis omnis qui fugiat qui qui. Qui ut odio qui quidem voluptatem voluptatem. Distinctio eos rerum tenetur id et voluptatem.\n\nSoluta minima nobis cupiditate expedita accusamus sunt sit necessitatibus. Ut est voluptates voluptatem dolores deleniti. Similique debitis quo recusandae magnam voluptates ad.\n\nSoluta officiis et porro atque. Voluptatibus eum enim culpa non repudiandae odit. Perspiciatis autem cumque nesciunt non pariatur est. Sapiente ea voluptates maxime.\n\nQuo ratione officiis consequatur accusantium. Possimus nesciunt voluptatem voluptatem quia.\n\nEt et non quis aut non. Doloremque quis et voluptas fugiat. Vitae molestias quas tempora in cum delectus.\n\nOccaecati ipsam pariatur minima similique sunt. Excepturi et et nulla labore rerum. Ex beatae sit tempora est nemo culpa maiores laboriosam. Asperiores incidunt aut doloremque quasi.\n\nEt ullam accusantium odit laudantium. Ea ab officia voluptatem aliquid. Sed suscipit laudantium consequatur atque enim labore sapiente.\n\nAut quis blanditiis autem earum recusandae. Dicta corrupti occaecati nulla harum inventore.\n\nIncidunt ullam vero dolor sequi voluptatum dolorem. In nihil blanditiis voluptatem quasi quod. Tempore ex amet qui. Ratione suscipit quam nemo iste.\n\nEaque id odio nostrum non odio magni. Corporis sapiente et nulla aspernatur fugiat dolore omnis quis. Voluptas sit est amet ea id nisi.\n\nNesciunt ullam sed vero nihil pariatur harum. Aliquid earum dolores non nihil vitae. Quam sed dolores aut reprehenderit dolor qui. Expedita unde qui nobis quia sint voluptatibus.\n\nPlaceat quo in inventore sunt enim aut qui. Voluptates ea voluptatem harum laboriosam. Tenetur blanditiis in qui molestias. Ipsum voluptatibus sit magni.\n\nAut quis quas cupiditate aliquid delectus harum illo. Ea ad qui earum sequi est earum. Aut consequatur natus molestiae mollitia voluptatum ut illum.\n\nOdit necessitatibus necessitatibus perspiciatis. Consequatur sit quos pariatur error quia molestias. Alias et facilis hic ut. Aperiam quia voluptates ut fugiat nihil nihil quam.\n\nCorrupti quisquam est non animi ducimus laborum. Error consectetur ad eos ducimus perferendis sint. Dignissimos illum doloribus ipsa assumenda tempora consequuntur. Doloribus quam nemo consectetur unde suscipit. Consequatur dicta corporis natus omnis iure.\n\nOfficia totam optio voluptas reprehenderit. Neque libero rerum ducimus consequatur qui libero enim. Voluptatibus et doloribus eum debitis dignissimos voluptatem accusantium.\n\nConsequuntur necessitatibus et consequatur et deleniti dignissimos ex. Tempore voluptatum libero accusamus quis. Saepe quis ut sit non.', 'Alias qui exercitationem nulla ut commodi. Facere voluptate culpa doloremque quos quam quia optio. Dolor aut reiciendis repellat doloremque ea natus saepe. Ipsum architecto aut qui esse.\n\nOmnis omnis qui fugiat qui qui. Qui ut odio qui quidem voluptatem voluptatem. Distinctio eos rerum tenetur id et voluptatem.\n\nSoluta minima nobis cupiditate expedita accusamus sunt sit necessitatibus. Ut est voluptates voluptatem dolores deleniti. Similique debitis quo recusandae magnam voluptates ad.\n\nSoluta officiis et porro atque. Voluptatibus eum enim culpa non repudiandae odit. Perspiciatis autem cumque nesciunt non pariatur est. Sapiente ea voluptates maxime.\n\nQuo ratione officiis consequatur accusantium. Possimus nesciunt voluptatem voluptatem quia.\n\nEt et non quis aut non. Doloremque quis et voluptas fugiat. Vitae molestias quas tempora in cum delectus.\n\nOccaecati ipsam pariatur minima similique sunt. Excepturi et et nulla labore rerum. Ex beatae sit tempora est nemo culpa maiores laboriosam. Asperiores incidunt aut doloremque quasi.\n\nEt ullam accusantium odit laudantium. Ea ab officia voluptatem aliquid. Sed suscipit laudantium consequatur atque enim labore sapiente.\n\nAut quis blanditiis autem earum recusandae. Dicta corrupti occaecati nulla harum inventore.\n\nIncidunt ullam vero dolor sequi voluptatum dolorem. In nihil blanditiis voluptatem quasi quod. Tempore ex amet qui. Ratione suscipit quam nemo iste.\n\nEaque id odio nostrum non odio magni. Corporis sapiente et nulla aspernatur fugiat dolore omnis quis. Voluptas sit est amet ea id nisi.\n\nNesciunt ullam sed vero nihil pariatur harum. Aliquid earum dolores non nihil vitae. Quam sed dolores aut reprehenderit dolor qui. Expedita unde qui nobis quia sint voluptatibus.\n\nPlaceat quo in inventore sunt enim aut qui. Voluptates ea voluptatem harum laboriosam. Tenetur blanditiis in qui molestias. Ipsum voluptatibus sit magni.\n\nAut quis quas cupiditate aliquid delectus harum illo. Ea ad qui earum sequi est earum. Aut consequatur natus molestiae mollitia voluptatum ut illum.\n\nOdit necessitatibus necessitatibus perspiciatis. Consequatur sit quos pariatur error quia molestias. Alias et facilis hic ut. Aperiam quia voluptates ut fugiat nihil nihil quam.\n\nCorrupti quisquam est non animi ducimus laborum. Error consectetur ad eos ducimus perferendis sint. Dignissimos illum doloribus ipsa assumenda tempora consequuntur. Doloribus quam nemo consectetur unde suscipit. Consequatur dicta corporis natus omnis iure.\n\nOfficia totam optio voluptas reprehenderit. Neque libero rerum ducimus consequatur qui libero enim. Voluptatibus et doloribus eum debitis dignissimos voluptatem accusantium.\n\nConsequuntur necessitatibus et consequatur et deleniti dignissimos ex. Tempore voluptatum libero accusamus quis. Saepe quis ut sit non.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '2015-06-24 01:38:05', null);
INSERT INTO `posts` VALUES ('6', '6', '6', 'Aliquam eum quasi autem et alias et repellendus in eum.', 'Et in consequatur quo qui et ratione et temporibus laudantium illum eos.', 'totam-eum-facilis-vero-est-et-est-voluptatem-sed', 'Quis magni qui deleniti recusandae placeat atque. Itaque sunt dignissimos cupiditate et beatae assumenda. Quibusdam voluptatem debitis non id vel ut. Aut est nihil recusandae ullam.\n\nMolestias saepe sit voluptas sint sed doloremque. Quas nostrum dolore quos et. Odio quo nihil animi est autem ea et. Fugit impedit sint ratione eos maxime vel.\n\nCulpa rerum eius pariatur nihil. Sapiente quia aliquid soluta qui officiis et. Voluptate non unde quibusdam velit delectus enim.\n\nOfficia voluptatem quo eos voluptatem tenetur aut libero. Consequuntur exercitationem nostrum tenetur quia. Nihil optio modi aut illo et enim.\n\nQui officiis minima ex sed modi quia eos. Sunt veritatis qui exercitationem laudantium itaque ratione quaerat aut.\n\nQuis eos occaecati dolorem aut natus. Commodi sit sit distinctio vero. Non quia fuga cupiditate voluptatem dolores dicta minus.\n\nEnim necessitatibus consectetur est est neque blanditiis. Qui quae aut nemo pariatur. Quae qui et est vel culpa vitae sint.\n\nEt ut error provident sit vel aut vero. Quae unde et quia natus. Deserunt totam ex praesentium fugiat repudiandae aut earum.\n\nMagni quisquam illo sit vel eum. Similique corporis magni tenetur. Optio ut maiores vero quia voluptatem.\n\nCorporis accusantium sit a nostrum necessitatibus omnis. Nihil dolorem saepe sit facere voluptatum. Deleniti non exercitationem voluptatem iusto.\n\nEx ipsam facilis fuga velit dignissimos. Rerum tenetur beatae impedit quod earum. Necessitatibus culpa et officiis quis rerum et. Animi ullam a exercitationem in. Placeat quibusdam et debitis placeat alias.\n\nQui veritatis hic reprehenderit assumenda odit. Quia sit veritatis facilis. Cumque eum ratione cum molestiae.', 'Quis magni qui deleniti recusandae placeat atque. Itaque sunt dignissimos cupiditate et beatae assumenda. Quibusdam voluptatem debitis non id vel ut. Aut est nihil recusandae ullam.\n\nMolestias saepe sit voluptas sint sed doloremque. Quas nostrum dolore quos et. Odio quo nihil animi est autem ea et. Fugit impedit sint ratione eos maxime vel.\n\nCulpa rerum eius pariatur nihil. Sapiente quia aliquid soluta qui officiis et. Voluptate non unde quibusdam velit delectus enim.\n\nOfficia voluptatem quo eos voluptatem tenetur aut libero. Consequuntur exercitationem nostrum tenetur quia. Nihil optio modi aut illo et enim.\n\nQui officiis minima ex sed modi quia eos. Sunt veritatis qui exercitationem laudantium itaque ratione quaerat aut.\n\nQuis eos occaecati dolorem aut natus. Commodi sit sit distinctio vero. Non quia fuga cupiditate voluptatem dolores dicta minus.\n\nEnim necessitatibus consectetur est est neque blanditiis. Qui quae aut nemo pariatur. Quae qui et est vel culpa vitae sint.\n\nEt ut error provident sit vel aut vero. Quae unde et quia natus. Deserunt totam ex praesentium fugiat repudiandae aut earum.\n\nMagni quisquam illo sit vel eum. Similique corporis magni tenetur. Optio ut maiores vero quia voluptatem.\n\nCorporis accusantium sit a nostrum necessitatibus omnis. Nihil dolorem saepe sit facere voluptatum. Deleniti non exercitationem voluptatem iusto.\n\nEx ipsam facilis fuga velit dignissimos. Rerum tenetur beatae impedit quod earum. Necessitatibus culpa et officiis quis rerum et. Animi ullam a exercitationem in. Placeat quibusdam et debitis placeat alias.\n\nQui veritatis hic reprehenderit assumenda odit. Quia sit veritatis facilis. Cumque eum ratione cum molestiae.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1999-08-25 20:35:46', null);
INSERT INTO `posts` VALUES ('7', '6', '6', 'Voluptatum veniam molestias autem quia facilis quis.', 'A tenetur illo aliquam rerum.', 'saepe-perspiciatis-expedita-omnis', 'Molestiae ut dolores voluptatem molestiae. Porro perspiciatis eum fugiat consequatur enim possimus sapiente. Architecto harum quod dignissimos quos dolor non.\n\nAutem voluptatibus eveniet cum consequatur ullam. Qui ratione ratione non totam. Error illum repellendus quis. Est deleniti ut omnis enim praesentium aut.\n\nArchitecto voluptas eius et saepe inventore numquam consequatur animi. Voluptatem et sit ut. Dolores consequatur illo magni ullam sapiente tempora illo. Consequuntur impedit numquam nam itaque.\n\nSed qui quod beatae et ut quasi autem. Dignissimos et perspiciatis dignissimos eos omnis. Et ad expedita sed quas aut.\n\nQuis numquam impedit aliquid maiores exercitationem illum laudantium. Aut totam quam et tempore est ut. Dolores nihil quo pariatur et iste.\n\nTotam in consequatur asperiores. Voluptas ut facere qui laboriosam aut vero quos laudantium. Omnis incidunt aut pariatur veritatis. Culpa fugiat nam officiis libero enim.\n\nNihil atque ullam tempora et aut. Quia architecto voluptatem soluta voluptatem aut.\n\nAb ut ad velit rerum et voluptatum. Assumenda molestias veritatis maxime occaecati officiis voluptatem. Reiciendis qui harum temporibus magnam numquam nobis reiciendis modi.\n\nQuae rerum recusandae enim provident et. Rerum qui voluptatem pariatur ea vitae tempora. Iure similique optio asperiores corporis vero saepe atque ea. Corrupti nisi et et ut numquam.\n\nIpsam facere ratione unde est. Veniam illum qui quia voluptatibus doloribus illo qui et. Porro culpa voluptatum eos commodi velit sed. Voluptatem placeat fugit distinctio aspernatur voluptate sed ad sint.\n\nFugit molestiae voluptatem necessitatibus et. Recusandae est nobis non nihil iure hic. Tenetur nemo numquam aut sapiente eum rerum deserunt facilis.\n\nAut nam nihil rerum ut veniam. Esse beatae qui autem vel. Velit est quod cupiditate ea aut. Cupiditate eaque molestias assumenda ea quo totam id.\n\nAperiam delectus officiis est id inventore quae. Cumque provident placeat minima ipsam quo est eveniet. Voluptas sit aut voluptatem rerum repellat.\n\nQuibusdam commodi aspernatur est veritatis sit soluta magnam dolorem. Impedit nesciunt eius maxime est est. Soluta quos placeat cum quo ipsam vel nesciunt. Aliquam non rerum ex occaecati sed magni dolorem.\n\nCommodi ipsam tempore ea temporibus qui placeat corporis. Quasi est laborum ab. Doloribus officiis distinctio aliquid non est aperiam quam.', 'Molestiae ut dolores voluptatem molestiae. Porro perspiciatis eum fugiat consequatur enim possimus sapiente. Architecto harum quod dignissimos quos dolor non.\n\nAutem voluptatibus eveniet cum consequatur ullam. Qui ratione ratione non totam. Error illum repellendus quis. Est deleniti ut omnis enim praesentium aut.\n\nArchitecto voluptas eius et saepe inventore numquam consequatur animi. Voluptatem et sit ut. Dolores consequatur illo magni ullam sapiente tempora illo. Consequuntur impedit numquam nam itaque.\n\nSed qui quod beatae et ut quasi autem. Dignissimos et perspiciatis dignissimos eos omnis. Et ad expedita sed quas aut.\n\nQuis numquam impedit aliquid maiores exercitationem illum laudantium. Aut totam quam et tempore est ut. Dolores nihil quo pariatur et iste.\n\nTotam in consequatur asperiores. Voluptas ut facere qui laboriosam aut vero quos laudantium. Omnis incidunt aut pariatur veritatis. Culpa fugiat nam officiis libero enim.\n\nNihil atque ullam tempora et aut. Quia architecto voluptatem soluta voluptatem aut.\n\nAb ut ad velit rerum et voluptatum. Assumenda molestias veritatis maxime occaecati officiis voluptatem. Reiciendis qui harum temporibus magnam numquam nobis reiciendis modi.\n\nQuae rerum recusandae enim provident et. Rerum qui voluptatem pariatur ea vitae tempora. Iure similique optio asperiores corporis vero saepe atque ea. Corrupti nisi et et ut numquam.\n\nIpsam facere ratione unde est. Veniam illum qui quia voluptatibus doloribus illo qui et. Porro culpa voluptatum eos commodi velit sed. Voluptatem placeat fugit distinctio aspernatur voluptate sed ad sint.\n\nFugit molestiae voluptatem necessitatibus et. Recusandae est nobis non nihil iure hic. Tenetur nemo numquam aut sapiente eum rerum deserunt facilis.\n\nAut nam nihil rerum ut veniam. Esse beatae qui autem vel. Velit est quod cupiditate ea aut. Cupiditate eaque molestias assumenda ea quo totam id.\n\nAperiam delectus officiis est id inventore quae. Cumque provident placeat minima ipsam quo est eveniet. Voluptas sit aut voluptatem rerum repellat.\n\nQuibusdam commodi aspernatur est veritatis sit soluta magnam dolorem. Impedit nesciunt eius maxime est est. Soluta quos placeat cum quo ipsam vel nesciunt. Aliquam non rerum ex occaecati sed magni dolorem.\n\nCommodi ipsam tempore ea temporibus qui placeat corporis. Quasi est laborum ab. Doloribus officiis distinctio aliquid non est aperiam quam.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1992-05-26 02:50:57', null);
INSERT INTO `posts` VALUES ('8', '6', '6', 'Eos neque nisi non perferendis quos et.', 'A recusandae necessitatibus magnam in omnis eaque nihil eum omnis blanditiis.', 'est-iure-laboriosam-consequatur-deserunt-tempore-sed-excepturi-ea', 'Assumenda mollitia aut ipsam fugiat dolor dolorum. Voluptatem sunt eos enim voluptatem quia non. Quia quo aut eum culpa velit quia.\n\nEsse magnam at quam itaque. Fugit dolor quaerat hic velit est inventore dolorem expedita. Aspernatur sint beatae accusamus quam dolore. Quas est sit adipisci sit et eius quos.\n\nNon nihil nihil et laborum. Exercitationem dignissimos praesentium aspernatur eius nihil rerum dolore. Et a est molestiae. Et voluptatibus consectetur ullam et.\n\nId et illo inventore quis officia quia nam. Aut et omnis molestiae recusandae quas tempore. Cupiditate eaque aut quis deleniti aliquid unde officia.\n\nQuia quo nihil ut voluptatem odit. Repudiandae fugiat iusto amet dolores. Magni laboriosam porro delectus et laborum velit. Repudiandae unde consequuntur voluptatem ea.\n\nEt exercitationem fuga magnam delectus. Est cupiditate neque deleniti a. Sequi enim minus praesentium debitis porro eum numquam.\n\nQui non a provident molestias. Autem vel et laborum et et quo mollitia. Omnis possimus animi velit voluptate aliquid molestiae. Quia dolorum ut provident quis totam libero dolores.\n\nSed temporibus voluptatem quo et. Doloremque saepe iusto delectus ipsum. Illo optio sapiente voluptatem perspiciatis eius.\n\nSoluta temporibus et cum debitis. Nesciunt et blanditiis distinctio quidem et. Natus doloribus fuga labore. Velit porro ea expedita consequatur explicabo magni ullam tempore. Sed ratione quas ut odit.\n\nFacere qui dolores qui et aut. Et et est dicta expedita. Doloribus eos et officiis modi. Quia nostrum adipisci aut repellendus iste rerum.\n\nEos officia ducimus adipisci quaerat repellat. Fuga quas doloribus fugit et et. Alias rerum blanditiis tempore ut. A eius voluptatem totam modi quidem ut aut.\n\nId qui dicta ratione itaque sint quam magni. Sed eos repudiandae et commodi consequatur repellat reprehenderit. Debitis magnam nostrum ut qui est maxime. Dolores qui nulla voluptatum quia magnam. Non ea qui nulla aut quaerat qui sit.\n\nEt et dolorum et et corrupti. Et non incidunt doloribus voluptatem natus dicta quo. Et et nihil omnis facere consequatur et soluta. Omnis mollitia molestiae laboriosam quia quia. Et consequatur distinctio non error.\n\nOfficiis reprehenderit consequatur alias ea earum voluptate. Ea animi nihil exercitationem fugit rerum et. Vero est ut omnis autem omnis voluptatibus cum.\n\nQuis est animi est sed id qui quos. Qui sed beatae aut possimus consectetur eum atque sed. Est nisi debitis unde ipsam dignissimos pariatur laudantium.\n\nEos natus deleniti inventore excepturi. Sint quis et iure suscipit mollitia sunt. Natus deleniti molestiae nulla nesciunt facere quam placeat optio. Ab aut nobis ut in distinctio neque. Ut autem sunt in accusantium.\n\nEt consequatur fuga facere illum. Non in eaque quasi quia sunt soluta est.\n\nItaque est ut in inventore iure blanditiis maxime. Labore est assumenda possimus ea dolorem tenetur delectus. Vel vel dolorum delectus ea aut qui.\n\nPorro enim ut aliquid quam. Aspernatur quis reprehenderit tempora officia sed aspernatur dolorem. Dolores rerum eum aut assumenda perspiciatis est quia. Vel voluptatem aut fugiat quia.\n\nAut porro cumque natus eligendi tempore. Voluptatem atque non sint eaque tenetur suscipit. Error vitae eveniet atque consequuntur. Dolorum libero et sunt est ut. Consequuntur sed et deleniti voluptatem.', 'Assumenda mollitia aut ipsam fugiat dolor dolorum. Voluptatem sunt eos enim voluptatem quia non. Quia quo aut eum culpa velit quia.\n\nEsse magnam at quam itaque. Fugit dolor quaerat hic velit est inventore dolorem expedita. Aspernatur sint beatae accusamus quam dolore. Quas est sit adipisci sit et eius quos.\n\nNon nihil nihil et laborum. Exercitationem dignissimos praesentium aspernatur eius nihil rerum dolore. Et a est molestiae. Et voluptatibus consectetur ullam et.\n\nId et illo inventore quis officia quia nam. Aut et omnis molestiae recusandae quas tempore. Cupiditate eaque aut quis deleniti aliquid unde officia.\n\nQuia quo nihil ut voluptatem odit. Repudiandae fugiat iusto amet dolores. Magni laboriosam porro delectus et laborum velit. Repudiandae unde consequuntur voluptatem ea.\n\nEt exercitationem fuga magnam delectus. Est cupiditate neque deleniti a. Sequi enim minus praesentium debitis porro eum numquam.\n\nQui non a provident molestias. Autem vel et laborum et et quo mollitia. Omnis possimus animi velit voluptate aliquid molestiae. Quia dolorum ut provident quis totam libero dolores.\n\nSed temporibus voluptatem quo et. Doloremque saepe iusto delectus ipsum. Illo optio sapiente voluptatem perspiciatis eius.\n\nSoluta temporibus et cum debitis. Nesciunt et blanditiis distinctio quidem et. Natus doloribus fuga labore. Velit porro ea expedita consequatur explicabo magni ullam tempore. Sed ratione quas ut odit.\n\nFacere qui dolores qui et aut. Et et est dicta expedita. Doloribus eos et officiis modi. Quia nostrum adipisci aut repellendus iste rerum.\n\nEos officia ducimus adipisci quaerat repellat. Fuga quas doloribus fugit et et. Alias rerum blanditiis tempore ut. A eius voluptatem totam modi quidem ut aut.\n\nId qui dicta ratione itaque sint quam magni. Sed eos repudiandae et commodi consequatur repellat reprehenderit. Debitis magnam nostrum ut qui est maxime. Dolores qui nulla voluptatum quia magnam. Non ea qui nulla aut quaerat qui sit.\n\nEt et dolorum et et corrupti. Et non incidunt doloribus voluptatem natus dicta quo. Et et nihil omnis facere consequatur et soluta. Omnis mollitia molestiae laboriosam quia quia. Et consequatur distinctio non error.\n\nOfficiis reprehenderit consequatur alias ea earum voluptate. Ea animi nihil exercitationem fugit rerum et. Vero est ut omnis autem omnis voluptatibus cum.\n\nQuis est animi est sed id qui quos. Qui sed beatae aut possimus consectetur eum atque sed. Est nisi debitis unde ipsam dignissimos pariatur laudantium.\n\nEos natus deleniti inventore excepturi. Sint quis et iure suscipit mollitia sunt. Natus deleniti molestiae nulla nesciunt facere quam placeat optio. Ab aut nobis ut in distinctio neque. Ut autem sunt in accusantium.\n\nEt consequatur fuga facere illum. Non in eaque quasi quia sunt soluta est.\n\nItaque est ut in inventore iure blanditiis maxime. Labore est assumenda possimus ea dolorem tenetur delectus. Vel vel dolorum delectus ea aut qui.\n\nPorro enim ut aliquid quam. Aspernatur quis reprehenderit tempora officia sed aspernatur dolorem. Dolores rerum eum aut assumenda perspiciatis est quia. Vel voluptatem aut fugiat quia.\n\nAut porro cumque natus eligendi tempore. Voluptatem atque non sint eaque tenetur suscipit. Error vitae eveniet atque consequuntur. Dolorum libero et sunt est ut. Consequuntur sed et deleniti voluptatem.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1987-02-03 08:08:47', null);
INSERT INTO `posts` VALUES ('9', '6', '6', 'Voluptate eius officia at quam.', 'Qui aperiam dolorum et sint atque aut.', 'ea-quia-impedit-rerum-delectus-architecto-voluptas', 'Quia qui asperiores qui eos. Hic officia ipsam laboriosam modi. Tenetur dolorem nulla enim odit. Qui iste ipsum qui.\n\nLaborum corporis in et ducimus delectus ea maiores. Rerum quia sunt voluptatem enim. Ratione eveniet non earum qui animi. Perferendis aut dolores quia tenetur corporis vero.\n\nAperiam numquam sunt sed inventore. Rerum corporis beatae perferendis voluptatum. Excepturi sit soluta perferendis ipsa sit magnam. Laboriosam sit omnis dolorem rerum consequatur excepturi.\n\nOmnis quisquam enim possimus culpa harum omnis. Aliquam quo beatae odit consequatur magnam nihil similique. Cum sapiente consectetur quis et. Id facere consequuntur beatae facilis dolorum iusto sunt.\n\nError optio accusantium quod modi. Reprehenderit neque sit et repudiandae possimus. Eum autem quo commodi.\n\nAutem et incidunt recusandae. Blanditiis temporibus sit doloribus eos expedita eos. Debitis aperiam sapiente autem eveniet cumque laboriosam error.\n\nUt qui mollitia assumenda tempora voluptatem blanditiis quidem est. Error ab quia omnis quam ut blanditiis. Tempora magnam quia rerum.\n\nLaudantium commodi aliquam id minus est. Natus culpa ut possimus id necessitatibus omnis molestiae autem.\n\nNobis ex doloribus deleniti nihil modi. Optio consectetur molestiae sed aliquid id repellat et. Modi aut quaerat ut culpa quisquam ut qui. Aliquid ut omnis et molestiae dolor ullam.', 'Quia qui asperiores qui eos. Hic officia ipsam laboriosam modi. Tenetur dolorem nulla enim odit. Qui iste ipsum qui.\n\nLaborum corporis in et ducimus delectus ea maiores. Rerum quia sunt voluptatem enim. Ratione eveniet non earum qui animi. Perferendis aut dolores quia tenetur corporis vero.\n\nAperiam numquam sunt sed inventore. Rerum corporis beatae perferendis voluptatum. Excepturi sit soluta perferendis ipsa sit magnam. Laboriosam sit omnis dolorem rerum consequatur excepturi.\n\nOmnis quisquam enim possimus culpa harum omnis. Aliquam quo beatae odit consequatur magnam nihil similique. Cum sapiente consectetur quis et. Id facere consequuntur beatae facilis dolorum iusto sunt.\n\nError optio accusantium quod modi. Reprehenderit neque sit et repudiandae possimus. Eum autem quo commodi.\n\nAutem et incidunt recusandae. Blanditiis temporibus sit doloribus eos expedita eos. Debitis aperiam sapiente autem eveniet cumque laboriosam error.\n\nUt qui mollitia assumenda tempora voluptatem blanditiis quidem est. Error ab quia omnis quam ut blanditiis. Tempora magnam quia rerum.\n\nLaudantium commodi aliquam id minus est. Natus culpa ut possimus id necessitatibus omnis molestiae autem.\n\nNobis ex doloribus deleniti nihil modi. Optio consectetur molestiae sed aliquid id repellat et. Modi aut quaerat ut culpa quisquam ut qui. Aliquid ut omnis et molestiae dolor ullam.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1981-02-07 23:53:15', null);
INSERT INTO `posts` VALUES ('10', '6', '6', 'Dignissimos dolorem sed adipisci totam maxime tenetur doloremque quidem nemo maxime non accusamus incidunt.', 'Repudiandae assumenda perferendis voluptatem minima omnis quis similique fugiat molestiae molestiae vel vel blanditiis eum officia.', 'officia-aliquam-officiis-maiores-iure-et-architecto-quo', 'Dolores omnis repudiandae sapiente rerum harum eveniet magnam est. Sed sit quo repudiandae quidem nobis iste facere reprehenderit. Velit sit quia sed facilis id tenetur ratione. Quasi quasi at at at perferendis cupiditate non.\n\nEt quam necessitatibus et quia ex ratione quia. Qui doloribus eius iste. Ipsa rerum totam eos aut ut vel. Aut molestiae nihil tempora laboriosam.\n\nAnimi sit dolorem odio quam sunt ut enim repudiandae. Quo voluptatum aut non iure atque autem. Ut recusandae voluptatem culpa sit minima ex recusandae deserunt.\n\nAut eius perferendis distinctio officia. Dicta ut culpa aut praesentium. Eos voluptatem quasi pariatur veniam saepe. Aliquam dignissimos adipisci eum est et nihil blanditiis.\n\nAmet adipisci hic consequatur quaerat. Consequatur eveniet voluptas et facilis explicabo sit. Consequatur ea non laboriosam sit.\n\nPerspiciatis dolore dolores officia aut in quia. Quidem qui aut amet quaerat non est. Occaecati illum vel ut adipisci. Assumenda alias quia deserunt consequatur.\n\nEst animi nemo nam saepe voluptatum saepe consequatur. Qui laborum nesciunt omnis consectetur at vitae dolor. Quasi repudiandae est dolor quam.\n\nEnim ad ut iure rerum. Explicabo nisi molestias amet qui tempore necessitatibus doloremque. Cupiditate quia aliquid dolor et.\n\nSit facere alias illum deserunt dolor. Commodi qui et expedita omnis et. Rerum rerum culpa animi in ex et. Est earum natus recusandae odio eos nemo quasi.\n\nSit error dolores aut quia possimus illo. Beatae distinctio magnam quia dolorem aliquam cupiditate. Ea culpa sint inventore eos. Nostrum ullam ipsam est repellat id quod tempora qui.\n\nEum eum asperiores enim nesciunt explicabo non. Omnis fuga perferendis sit recusandae non atque voluptatem. Commodi saepe officiis sed accusantium.\n\nNostrum dolor enim soluta nobis aspernatur aut dolorum doloribus. Ipsam quia dolorum voluptas laudantium tempore. Voluptatem sed similique expedita eveniet.', 'Dolores omnis repudiandae sapiente rerum harum eveniet magnam est. Sed sit quo repudiandae quidem nobis iste facere reprehenderit. Velit sit quia sed facilis id tenetur ratione. Quasi quasi at at at perferendis cupiditate non.\n\nEt quam necessitatibus et quia ex ratione quia. Qui doloribus eius iste. Ipsa rerum totam eos aut ut vel. Aut molestiae nihil tempora laboriosam.\n\nAnimi sit dolorem odio quam sunt ut enim repudiandae. Quo voluptatum aut non iure atque autem. Ut recusandae voluptatem culpa sit minima ex recusandae deserunt.\n\nAut eius perferendis distinctio officia. Dicta ut culpa aut praesentium. Eos voluptatem quasi pariatur veniam saepe. Aliquam dignissimos adipisci eum est et nihil blanditiis.\n\nAmet adipisci hic consequatur quaerat. Consequatur eveniet voluptas et facilis explicabo sit. Consequatur ea non laboriosam sit.\n\nPerspiciatis dolore dolores officia aut in quia. Quidem qui aut amet quaerat non est. Occaecati illum vel ut adipisci. Assumenda alias quia deserunt consequatur.\n\nEst animi nemo nam saepe voluptatum saepe consequatur. Qui laborum nesciunt omnis consectetur at vitae dolor. Quasi repudiandae est dolor quam.\n\nEnim ad ut iure rerum. Explicabo nisi molestias amet qui tempore necessitatibus doloremque. Cupiditate quia aliquid dolor et.\n\nSit facere alias illum deserunt dolor. Commodi qui et expedita omnis et. Rerum rerum culpa animi in ex et. Est earum natus recusandae odio eos nemo quasi.\n\nSit error dolores aut quia possimus illo. Beatae distinctio magnam quia dolorem aliquam cupiditate. Ea culpa sint inventore eos. Nostrum ullam ipsam est repellat id quod tempora qui.\n\nEum eum asperiores enim nesciunt explicabo non. Omnis fuga perferendis sit recusandae non atque voluptatem. Commodi saepe officiis sed accusantium.\n\nNostrum dolor enim soluta nobis aspernatur aut dolorum doloribus. Ipsam quia dolorum voluptas laudantium tempore. Voluptatem sed similique expedita eveniet.', '1', '0', '2017-01-14 09:24:52', '2017-01-14 09:24:53', '1977-05-25 21:30:55', null);
INSERT INTO `posts` VALUES ('11', '6', '4', 'Rerum eius molestiae accusamus totam.', 'Distinctio nihil et facilis nostrum nobis omnis distinctio labore quia ut autem non aut fugit deleniti voluptate.', 'voluptas-quia-adipisci-sint-ex', 'Natus et qui saepe a quae quas veniam incidunt. Placeat quos et alias doloremque commodi. Nobis consequatur ut inventore culpa doloremque numquam dolorem reprehenderit.\n\nItaque commodi quia qui aut quia dolor quo. Hic molestiae eaque perspiciatis et molestiae sint. Ad provident deleniti labore repellat ipsum esse. Rerum est fugit vel ea nisi fugiat.\n\nRepellendus quia cumque sapiente suscipit nostrum sed. Aspernatur omnis consequatur esse ab ad sunt fugiat. Aperiam aut autem cupiditate tempora vitae. Ut magni quibusdam eos ullam.\n\nNam ut qui repellat pariatur. Similique cupiditate rerum aut sapiente voluptatum consectetur. Impedit laboriosam dolorem inventore atque illum adipisci. Repudiandae quia sed autem saepe quos facere repudiandae. A hic est qui dolorem id magni quas culpa.\n\nLaborum ex tempora deserunt dolore vero. Quidem sed deleniti incidunt sit vitae. Saepe vel fugiat sit cumque voluptatibus iste ut.\n\nMinus illo repudiandae sit laboriosam. Voluptatibus corrupti officia nostrum iure ut dicta libero. Quod expedita quibusdam dolorem pariatur iusto.\n\nUnde nihil et non voluptatum. Distinctio dolorum nesciunt eum rem ea. Quam et vitae hic assumenda maiores aperiam eum. Dicta impedit accusantium consequatur facilis qui rerum et.\n\nAtque aut qui rerum aut quae vitae id. Aut ut omnis veritatis rerum quaerat consequatur consectetur mollitia. Enim velit quo qui tempora. Est recusandae vel magni ut officiis sit.\n\nVoluptas recusandae veritatis quos eos. Fugiat eveniet est laborum itaque. Quam harum cupiditate reprehenderit sed.\n\nAssumenda quis qui iusto quisquam sit. Ipsa esse nemo non dolor aut.\n\nVelit autem consequatur aliquam. Nemo ipsam omnis neque. Nemo repellat hic quisquam velit est. Laudantium eveniet sed enim autem.\n\nAccusantium unde dolorem esse facilis dolor aut magni magnam. Non nihil aliquid quod sint voluptatem rerum iste. Ipsum mollitia voluptas et voluptas nihil. Numquam aut dolores eaque et. Magni reiciendis id alias id unde.', 'Natus et qui saepe a quae quas veniam incidunt. Placeat quos et alias doloremque commodi. Nobis consequatur ut inventore culpa doloremque numquam dolorem reprehenderit.\n\nItaque commodi quia qui aut quia dolor quo. Hic molestiae eaque perspiciatis et molestiae sint. Ad provident deleniti labore repellat ipsum esse. Rerum est fugit vel ea nisi fugiat.\n\nRepellendus quia cumque sapiente suscipit nostrum sed. Aspernatur omnis consequatur esse ab ad sunt fugiat. Aperiam aut autem cupiditate tempora vitae. Ut magni quibusdam eos ullam.\n\nNam ut qui repellat pariatur. Similique cupiditate rerum aut sapiente voluptatum consectetur. Impedit laboriosam dolorem inventore atque illum adipisci. Repudiandae quia sed autem saepe quos facere repudiandae. A hic est qui dolorem id magni quas culpa.\n\nLaborum ex tempora deserunt dolore vero. Quidem sed deleniti incidunt sit vitae. Saepe vel fugiat sit cumque voluptatibus iste ut.\n\nMinus illo repudiandae sit laboriosam. Voluptatibus corrupti officia nostrum iure ut dicta libero. Quod expedita quibusdam dolorem pariatur iusto.\n\nUnde nihil et non voluptatum. Distinctio dolorum nesciunt eum rem ea. Quam et vitae hic assumenda maiores aperiam eum. Dicta impedit accusantium consequatur facilis qui rerum et.\n\nAtque aut qui rerum aut quae vitae id. Aut ut omnis veritatis rerum quaerat consequatur consectetur mollitia. Enim velit quo qui tempora. Est recusandae vel magni ut officiis sit.\n\nVoluptas recusandae veritatis quos eos. Fugiat eveniet est laborum itaque. Quam harum cupiditate reprehenderit sed.\n\nAssumenda quis qui iusto quisquam sit. Ipsa esse nemo non dolor aut.\n\nVelit autem consequatur aliquam. Nemo ipsam omnis neque. Nemo repellat hic quisquam velit est. Laudantium eveniet sed enim autem.\n\nAccusantium unde dolorem esse facilis dolor aut magni magnam. Non nihil aliquid quod sint voluptatem rerum iste. Ipsum mollitia voluptas et voluptas nihil. Numquam aut dolores eaque et. Magni reiciendis id alias id unde.', '0', '0', '2017-01-14 09:24:53', '2017-06-01 21:23:35', '2004-04-25 19:20:22', null);
INSERT INTO `posts` VALUES ('12', '6', '4', 'Explicabo reprehenderit mollitia ex voluptas non vel necessitatibus est autem itaque.', 'Ut deleniti commodi explicabo numquam eos qui voluptatem possimus fuga molestiae qui est repellendus ducimus.', 'iusto-ut-non-ut-pariatur-ut-minima-omnis', 'Magnam voluptatum voluptatum sit et. Asperiores voluptate dolor animi quia. Asperiores aut ut voluptate voluptatum molestiae sint.\n\nAliquam velit eum voluptatum ut quae molestiae sunt. Quisquam voluptatem asperiores tempore earum.\n\nNon minus aspernatur saepe adipisci maiores. Enim nostrum minima maxime suscipit autem atque. Quia totam occaecati aut debitis. Voluptatem est quisquam commodi et voluptatum alias enim.\n\nEst rerum dicta sunt sunt impedit. Aperiam accusantium corrupti vitae ducimus temporibus nihil debitis. Alias omnis est incidunt delectus sit velit consequatur.\n\nSed eum reiciendis velit est accusantium praesentium id. Vel velit dolor accusamus suscipit. Voluptatem quae ducimus pariatur ea. Quam quisquam aut aperiam eveniet facere quibusdam asperiores.\n\nOfficiis est explicabo magnam qui illo. Quo reprehenderit eos error incidunt aliquam numquam. Omnis sit deserunt nisi veniam. Totam est necessitatibus similique quibusdam quaerat.\n\nReprehenderit sunt possimus id dicta accusamus possimus facilis totam. Ad qui tempora aut commodi neque non. Ut sapiente natus cumque reiciendis nulla excepturi hic. Iure perspiciatis sed quisquam voluptate neque.\n\nAutem est et aut dolore qui aut. Deserunt optio aut sint enim nihil nostrum. Dolores voluptas praesentium harum nihil quasi aut.\n\nAsperiores reiciendis a mollitia placeat. Consequatur voluptas rerum dignissimos sed.\n\nSunt esse magni nemo nisi modi. Accusantium totam nulla qui corrupti omnis aut id. Mollitia fuga est labore repudiandae voluptas totam.\n\nIn esse deleniti recusandae delectus exercitationem. Voluptas qui quo eligendi totam neque.\n\nUt ipsa consequuntur atque quaerat beatae exercitationem adipisci. Id quia sint consequuntur dolorem mollitia. Impedit corrupti adipisci sit qui repellendus ut. Blanditiis sequi voluptas in est a non sapiente.\n\nEarum consequatur dicta ratione voluptas nemo dolor sed. Iste quod accusamus est ea. Labore non sunt aut et nam non. Praesentium eveniet vel dolorem quia assumenda.\n\nEt provident occaecati amet. Sit impedit qui blanditiis labore sint. Alias nisi consequatur dolor voluptatem velit.\n\nProvident aut quae ut deleniti aut. Dolores quod voluptatem aut et expedita. Autem ex molestias ad illo quos labore. Amet accusantium impedit voluptatem sed et dolore quasi in.\n\nEos odio autem ut perspiciatis nisi aut. Totam maxime dolore et nulla. Corrupti ut temporibus omnis. Excepturi eum sed quis rerum cum nemo.\n\nSed non numquam officia illo beatae. Voluptatem quis libero quam error corporis nam. Fugiat et architecto odio.\n\nFugiat officia cumque natus et culpa aut. Est dolorem cumque et placeat odio quidem atque autem. Vel est sit expedita adipisci.\n\nAdipisci cumque dicta officiis sunt vel. Rerum sit maiores sit minus in quibusdam. Nisi natus dolores quia voluptate tenetur aut.\n\nSit similique nam quibusdam nihil molestias earum illum ratione. Ratione et omnis voluptatum natus deleniti. Nobis distinctio omnis eligendi aut dolor.', 'Magnam voluptatum voluptatum sit et. Asperiores voluptate dolor animi quia. Asperiores aut ut voluptate voluptatum molestiae sint.\n\nAliquam velit eum voluptatum ut quae molestiae sunt. Quisquam voluptatem asperiores tempore earum.\n\nNon minus aspernatur saepe adipisci maiores. Enim nostrum minima maxime suscipit autem atque. Quia totam occaecati aut debitis. Voluptatem est quisquam commodi et voluptatum alias enim.\n\nEst rerum dicta sunt sunt impedit. Aperiam accusantium corrupti vitae ducimus temporibus nihil debitis. Alias omnis est incidunt delectus sit velit consequatur.\n\nSed eum reiciendis velit est accusantium praesentium id. Vel velit dolor accusamus suscipit. Voluptatem quae ducimus pariatur ea. Quam quisquam aut aperiam eveniet facere quibusdam asperiores.\n\nOfficiis est explicabo magnam qui illo. Quo reprehenderit eos error incidunt aliquam numquam. Omnis sit deserunt nisi veniam. Totam est necessitatibus similique quibusdam quaerat.\n\nReprehenderit sunt possimus id dicta accusamus possimus facilis totam. Ad qui tempora aut commodi neque non. Ut sapiente natus cumque reiciendis nulla excepturi hic. Iure perspiciatis sed quisquam voluptate neque.\n\nAutem est et aut dolore qui aut. Deserunt optio aut sint enim nihil nostrum. Dolores voluptas praesentium harum nihil quasi aut.\n\nAsperiores reiciendis a mollitia placeat. Consequatur voluptas rerum dignissimos sed.\n\nSunt esse magni nemo nisi modi. Accusantium totam nulla qui corrupti omnis aut id. Mollitia fuga est labore repudiandae voluptas totam.\n\nIn esse deleniti recusandae delectus exercitationem. Voluptas qui quo eligendi totam neque.\n\nUt ipsa consequuntur atque quaerat beatae exercitationem adipisci. Id quia sint consequuntur dolorem mollitia. Impedit corrupti adipisci sit qui repellendus ut. Blanditiis sequi voluptas in est a non sapiente.\n\nEarum consequatur dicta ratione voluptas nemo dolor sed. Iste quod accusamus est ea. Labore non sunt aut et nam non. Praesentium eveniet vel dolorem quia assumenda.\n\nEt provident occaecati amet. Sit impedit qui blanditiis labore sint. Alias nisi consequatur dolor voluptatem velit.\n\nProvident aut quae ut deleniti aut. Dolores quod voluptatem aut et expedita. Autem ex molestias ad illo quos labore. Amet accusantium impedit voluptatem sed et dolore quasi in.\n\nEos odio autem ut perspiciatis nisi aut. Totam maxime dolore et nulla. Corrupti ut temporibus omnis. Excepturi eum sed quis rerum cum nemo.\n\nSed non numquam officia illo beatae. Voluptatem quis libero quam error corporis nam. Fugiat et architecto odio.\n\nFugiat officia cumque natus et culpa aut. Est dolorem cumque et placeat odio quidem atque autem. Vel est sit expedita adipisci.\n\nAdipisci cumque dicta officiis sunt vel. Rerum sit maiores sit minus in quibusdam. Nisi natus dolores quia voluptate tenetur aut.\n\nSit similique nam quibusdam nihil molestias earum illum ratione. Ratione et omnis voluptatum natus deleniti. Nobis distinctio omnis eligendi aut dolor.', '0', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '1997-10-28 22:54:46', null);
INSERT INTO `posts` VALUES ('13', '6', '4', 'Nihil delectus magnam sequi rerum.', 'Tenetur adipisci eos placeat eaque quis repellendus aspernatur.', 'quas-quia-ea-nisi', 'Accusamus iusto est quia distinctio eum. Vitae praesentium sequi porro eius. Iusto molestiae molestiae numquam voluptas animi autem voluptatem. Aliquid nam neque ut. Nisi velit dolor sequi repudiandae veniam optio.\n\nSoluta sapiente voluptatem aut quia ex ea quis. Omnis quo id recusandae voluptates eos praesentium.\n\nQui doloremque sapiente quo at id iure veniam quas. Repellendus omnis et nam laborum aperiam sed. Occaecati quidem at aliquam perspiciatis voluptatem delectus. Eum et voluptas ratione aut.\n\nAutem sit neque quibusdam et in aperiam. Non iusto dolor id cum. Sapiente illum neque maiores eos est similique voluptatem. Dignissimos sint unde veniam.\n\nEst cum aut earum accusantium delectus magnam. Ab error quae voluptatum sunt impedit ut. Labore in ducimus amet aliquid commodi aspernatur.\n\nAspernatur esse sunt neque totam. Non dolor qui aut aperiam. Repudiandae totam voluptatem aut quos sint autem nulla. Nisi delectus expedita dignissimos et a eaque.\n\nRem est quia suscipit explicabo. Accusantium fugiat repellendus accusantium officiis nisi qui est. Rerum culpa quis asperiores magni consectetur saepe sed.', 'Accusamus iusto est quia distinctio eum. Vitae praesentium sequi porro eius. Iusto molestiae molestiae numquam voluptas animi autem voluptatem. Aliquid nam neque ut. Nisi velit dolor sequi repudiandae veniam optio.\n\nSoluta sapiente voluptatem aut quia ex ea quis. Omnis quo id recusandae voluptates eos praesentium.\n\nQui doloremque sapiente quo at id iure veniam quas. Repellendus omnis et nam laborum aperiam sed. Occaecati quidem at aliquam perspiciatis voluptatem delectus. Eum et voluptas ratione aut.\n\nAutem sit neque quibusdam et in aperiam. Non iusto dolor id cum. Sapiente illum neque maiores eos est similique voluptatem. Dignissimos sint unde veniam.\n\nEst cum aut earum accusantium delectus magnam. Ab error quae voluptatum sunt impedit ut. Labore in ducimus amet aliquid commodi aspernatur.\n\nAspernatur esse sunt neque totam. Non dolor qui aut aperiam. Repudiandae totam voluptatem aut quos sint autem nulla. Nisi delectus expedita dignissimos et a eaque.\n\nRem est quia suscipit explicabo. Accusantium fugiat repellendus accusantium officiis nisi qui est. Rerum culpa quis asperiores magni consectetur saepe sed.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '2012-11-30 20:07:45', null);
INSERT INTO `posts` VALUES ('14', '6', '4', 'Sapiente quos ex sed omnis ut et dolorum.', 'Reprehenderit sit illo non reiciendis autem quidem error ut natus nihil ut suscipit dolore dolor.', 'ullam-maiores-quia-sed-aut-ipsum-earum-incidunt-dolores', 'Expedita occaecati amet voluptatem delectus adipisci libero rerum. Itaque provident inventore voluptates ut fugit. Ut numquam officiis quia quia.\n\nSapiente facilis consequatur quos debitis et commodi. Quia consequatur necessitatibus nulla aut sed. Quibusdam amet natus ut dolorem iste quo sapiente.\n\nA ducimus itaque ipsam qui eos facilis. Est accusamus recusandae magni ut rem rerum odit et. Nihil dolor suscipit optio ipsam. Accusantium quasi et repudiandae saepe dicta.\n\nQuia debitis repellat harum at recusandae sequi tempora magnam. Aperiam maiores deleniti praesentium. Veritatis ab repellat eos non facilis quisquam.\n\nSuscipit quia ea possimus aperiam voluptas eligendi et sapiente. Commodi eos exercitationem eos ullam aperiam possimus. Culpa et aut laboriosam. Qui nulla debitis qui est quis quia et.\n\nNihil et distinctio soluta unde at odio. Quia voluptatem qui omnis beatae. Atque qui sit qui delectus reiciendis enim earum. Itaque nemo atque ex labore fugiat atque.\n\nNon sed iusto explicabo occaecati. Id corrupti qui maiores aliquam. Et et possimus nobis qui hic quidem ea. Eaque sit doloremque tempore sint. Voluptas nostrum non at nihil.\n\nUnde qui illum tempore et sapiente dolores inventore. Suscipit deserunt dolorem quo. Non numquam atque quod quibusdam. Omnis dicta magni voluptas debitis et voluptatem odio.\n\nAutem voluptate ut quo eos quo autem. Pariatur voluptas ipsum consectetur dolor. Fugit et velit exercitationem accusantium. Enim et qui et a aut fugit mollitia dolor.\n\nMolestiae corrupti aut molestiae placeat quisquam animi ut. Deleniti est quae illum voluptatem aut repellendus. Deleniti voluptatem temporibus cupiditate dolorem fugit id. At vel modi eum a.\n\nTemporibus quod aut laudantium ut aut perferendis molestiae accusantium. Sed ipsa quia mollitia sed. Non atque nesciunt dolorem. Facilis perferendis ullam quasi corrupti molestias illo.\n\nUt ea pariatur modi. Id vero voluptas commodi provident voluptate et hic ea. Consequatur corporis voluptas eaque similique repudiandae labore a. Consectetur fuga ut necessitatibus aut optio.\n\nSaepe saepe est ex eum dolorum minus iusto. Eveniet consequatur mollitia aliquam distinctio dignissimos. Adipisci ratione architecto sed aut laudantium deleniti. Ipsam dicta ipsa hic necessitatibus laboriosam earum esse.', 'Expedita occaecati amet voluptatem delectus adipisci libero rerum. Itaque provident inventore voluptates ut fugit. Ut numquam officiis quia quia.\n\nSapiente facilis consequatur quos debitis et commodi. Quia consequatur necessitatibus nulla aut sed. Quibusdam amet natus ut dolorem iste quo sapiente.\n\nA ducimus itaque ipsam qui eos facilis. Est accusamus recusandae magni ut rem rerum odit et. Nihil dolor suscipit optio ipsam. Accusantium quasi et repudiandae saepe dicta.\n\nQuia debitis repellat harum at recusandae sequi tempora magnam. Aperiam maiores deleniti praesentium. Veritatis ab repellat eos non facilis quisquam.\n\nSuscipit quia ea possimus aperiam voluptas eligendi et sapiente. Commodi eos exercitationem eos ullam aperiam possimus. Culpa et aut laboriosam. Qui nulla debitis qui est quis quia et.\n\nNihil et distinctio soluta unde at odio. Quia voluptatem qui omnis beatae. Atque qui sit qui delectus reiciendis enim earum. Itaque nemo atque ex labore fugiat atque.\n\nNon sed iusto explicabo occaecati. Id corrupti qui maiores aliquam. Et et possimus nobis qui hic quidem ea. Eaque sit doloremque tempore sint. Voluptas nostrum non at nihil.\n\nUnde qui illum tempore et sapiente dolores inventore. Suscipit deserunt dolorem quo. Non numquam atque quod quibusdam. Omnis dicta magni voluptas debitis et voluptatem odio.\n\nAutem voluptate ut quo eos quo autem. Pariatur voluptas ipsum consectetur dolor. Fugit et velit exercitationem accusantium. Enim et qui et a aut fugit mollitia dolor.\n\nMolestiae corrupti aut molestiae placeat quisquam animi ut. Deleniti est quae illum voluptatem aut repellendus. Deleniti voluptatem temporibus cupiditate dolorem fugit id. At vel modi eum a.\n\nTemporibus quod aut laudantium ut aut perferendis molestiae accusantium. Sed ipsa quia mollitia sed. Non atque nesciunt dolorem. Facilis perferendis ullam quasi corrupti molestias illo.\n\nUt ea pariatur modi. Id vero voluptas commodi provident voluptate et hic ea. Consequatur corporis voluptas eaque similique repudiandae labore a. Consectetur fuga ut necessitatibus aut optio.\n\nSaepe saepe est ex eum dolorum minus iusto. Eveniet consequatur mollitia aliquam distinctio dignissimos. Adipisci ratione architecto sed aut laudantium deleniti. Ipsam dicta ipsa hic necessitatibus laboriosam earum esse.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '1991-01-22 08:27:53', null);
INSERT INTO `posts` VALUES ('15', '6', '2', 'Doloribus illo non nemo.', 'Ea impedit nobis saepe ut et.', 'sequi-est-omnis-veritatis-nam-et', 'Iusto labore aliquam numquam et voluptates quos nulla. Quo omnis cumque aliquam nam. Deserunt fugiat magni sunt aut harum ut repellat.\n\nEst mollitia aperiam quia ut quia. Nesciunt nesciunt qui et suscipit accusantium repellendus eos. Facilis dolore aut rem ut sunt expedita et error.\n\nQuaerat numquam qui est ipsam quia suscipit. Est temporibus impedit ea corrupti. Illo fugiat nobis aliquid autem natus sequi reiciendis. Voluptatem similique corrupti quam animi praesentium. Eius nesciunt quia necessitatibus a.\n\nVoluptatibus eligendi voluptatem porro dolorum. Aliquam qui sit tempore a perferendis. Soluta illo nisi iusto voluptatem id.\n\nUt qui perspiciatis provident quidem fugiat. Iste aut reiciendis corporis similique rem reiciendis. Ut occaecati quae praesentium ab. Rerum sint corporis neque quia accusamus.\n\nDolore optio sint dolore officia voluptatibus. Quis illo a eum. Perspiciatis voluptas error non illo recusandae nesciunt neque suscipit.\n\nAut odit non non. Excepturi officia molestiae quas quo sit aut et. Error voluptates porro aliquam quis. Eos tempore necessitatibus aut inventore culpa.\n\nAut ut beatae ea iusto cum amet. Et qui harum in in itaque et aut. Aliquam tenetur ad numquam nihil explicabo distinctio.\n\nCupiditate velit quia quae voluptatem voluptatem aut soluta. Beatae velit iusto dolor ipsum dolore aut corporis natus. Vitae soluta ipsum at fugiat molestiae suscipit.', 'Iusto labore aliquam numquam et voluptates quos nulla. Quo omnis cumque aliquam nam. Deserunt fugiat magni sunt aut harum ut repellat.\n\nEst mollitia aperiam quia ut quia. Nesciunt nesciunt qui et suscipit accusantium repellendus eos. Facilis dolore aut rem ut sunt expedita et error.\n\nQuaerat numquam qui est ipsam quia suscipit. Est temporibus impedit ea corrupti. Illo fugiat nobis aliquid autem natus sequi reiciendis. Voluptatem similique corrupti quam animi praesentium. Eius nesciunt quia necessitatibus a.\n\nVoluptatibus eligendi voluptatem porro dolorum. Aliquam qui sit tempore a perferendis. Soluta illo nisi iusto voluptatem id.\n\nUt qui perspiciatis provident quidem fugiat. Iste aut reiciendis corporis similique rem reiciendis. Ut occaecati quae praesentium ab. Rerum sint corporis neque quia accusamus.\n\nDolore optio sint dolore officia voluptatibus. Quis illo a eum. Perspiciatis voluptas error non illo recusandae nesciunt neque suscipit.\n\nAut odit non non. Excepturi officia molestiae quas quo sit aut et. Error voluptates porro aliquam quis. Eos tempore necessitatibus aut inventore culpa.\n\nAut ut beatae ea iusto cum amet. Et qui harum in in itaque et aut. Aliquam tenetur ad numquam nihil explicabo distinctio.\n\nCupiditate velit quia quae voluptatem voluptatem aut soluta. Beatae velit iusto dolor ipsum dolore aut corporis natus. Vitae soluta ipsum at fugiat molestiae suscipit.', '2', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '1981-01-28 00:13:04', null);
INSERT INTO `posts` VALUES ('16', '6', '2', 'Enim at est iure et facilis minus esse suscipit voluptas quis voluptatum adipisci aspernatur.', 'Quam fugit adipisci est sit dignissimos ab ut velit perferendis eveniet nostrum tempora.', 'voluptatibus-et-libero-et-nemo', 'Est eius molestiae eaque distinctio quo. Exercitationem ullam sapiente tempora qui beatae dolorem id. Odit quibusdam natus rerum aut. Et eos id nobis.\n\nUt quaerat saepe molestias ut. Exercitationem hic veniam et magnam vero est. Quod et ullam et voluptatibus. Quasi cum omnis quas assumenda adipisci.\n\nSunt eaque mollitia qui facilis doloremque perspiciatis porro omnis. Eos quibusdam voluptates temporibus et. Ratione aut asperiores molestiae sint aliquid.\n\nOptio rerum occaecati aperiam et et. Repudiandae voluptas est consequatur fugit. Beatae magni dolor possimus laborum est.\n\nOfficiis voluptatibus eius aliquid. Natus illo non nemo. Rerum animi qui quos. Inventore nihil distinctio totam nostrum exercitationem.\n\nDoloribus nobis dolorum corrupti. Dolores repellat delectus laboriosam expedita error laboriosam. Amet nam animi dolor error.\n\nConsequuntur molestias et eos et. Vitae qui omnis sit voluptas. Molestiae eaque exercitationem quo quos deserunt explicabo. Quod et cum quas dolorem expedita aut impedit.\n\nNon eius deleniti qui nostrum aut odio nihil. Illum consequatur maiores et voluptatem atque amet nostrum. Dolor aliquam incidunt et. Voluptatibus qui nam asperiores.\n\nQuod in iste molestiae earum. Dolores in molestiae voluptas aliquid repellendus enim. Molestias rerum architecto perferendis amet quia ut eaque id. Et rerum magni sit nisi quia vel.\n\nTenetur ut in voluptatem ducimus. Corrupti repudiandae perspiciatis in assumenda pariatur qui.', 'Est eius molestiae eaque distinctio quo. Exercitationem ullam sapiente tempora qui beatae dolorem id. Odit quibusdam natus rerum aut. Et eos id nobis.\n\nUt quaerat saepe molestias ut. Exercitationem hic veniam et magnam vero est. Quod et ullam et voluptatibus. Quasi cum omnis quas assumenda adipisci.\n\nSunt eaque mollitia qui facilis doloremque perspiciatis porro omnis. Eos quibusdam voluptates temporibus et. Ratione aut asperiores molestiae sint aliquid.\n\nOptio rerum occaecati aperiam et et. Repudiandae voluptas est consequatur fugit. Beatae magni dolor possimus laborum est.\n\nOfficiis voluptatibus eius aliquid. Natus illo non nemo. Rerum animi qui quos. Inventore nihil distinctio totam nostrum exercitationem.\n\nDoloribus nobis dolorum corrupti. Dolores repellat delectus laboriosam expedita error laboriosam. Amet nam animi dolor error.\n\nConsequuntur molestias et eos et. Vitae qui omnis sit voluptas. Molestiae eaque exercitationem quo quos deserunt explicabo. Quod et cum quas dolorem expedita aut impedit.\n\nNon eius deleniti qui nostrum aut odio nihil. Illum consequatur maiores et voluptatem atque amet nostrum. Dolor aliquam incidunt et. Voluptatibus qui nam asperiores.\n\nQuod in iste molestiae earum. Dolores in molestiae voluptas aliquid repellendus enim. Molestias rerum architecto perferendis amet quia ut eaque id. Et rerum magni sit nisi quia vel.\n\nTenetur ut in voluptatem ducimus. Corrupti repudiandae perspiciatis in assumenda pariatur qui.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '2012-03-17 13:36:26', null);
INSERT INTO `posts` VALUES ('17', '6', '2', 'Magnam dicta iste iste perspiciatis eum aperiam fugit fuga animi eos aliquid et nemo.', 'Laboriosam earum ratione non ex velit.', 'cumque-consequatur-sunt-quia-reiciendis-error-eveniet', 'Doloribus unde nobis assumenda ut nesciunt asperiores voluptas. Officia debitis quam nesciunt et accusantium placeat. At sit vel alias. Occaecati assumenda ea et deleniti magni ut ullam.\n\nEsse ullam sapiente sunt et labore. Est debitis et incidunt cupiditate. Dicta sint quod autem quia.\n\nPossimus est quidem numquam enim. Saepe ad nihil hic ipsum dolorem magnam explicabo. Magnam corrupti saepe dicta veniam eveniet quam rem.\n\nReiciendis laborum adipisci officia beatae sint id. Tempora assumenda odio enim. Ducimus quae possimus unde voluptas aspernatur consectetur ad autem. Dignissimos molestiae velit aliquam aliquam ut doloremque voluptatem.\n\nQui inventore debitis rerum voluptatem. Ducimus tempore fugit distinctio non voluptas accusamus accusantium. Ipsam eos similique sunt consequatur ut deleniti quos repellat. Possimus voluptatum repudiandae voluptas voluptatum.\n\nCulpa reiciendis ipsam eum quos cupiditate labore. Quisquam magnam qui suscipit dolor impedit dolores. Aperiam et voluptatem quis eum a repellendus et.\n\nQui et nam aut sit quas. Exercitationem omnis et qui neque. Non laborum id ut.\n\nExpedita iusto tempora pariatur ad dolor velit. Fugit enim accusamus velit ut. Eos sequi voluptas non corrupti aut enim.\n\nQuia consequatur perspiciatis hic laudantium. Corporis earum quos rerum nostrum maiores. Eligendi illo sit eos at est aut.\n\nEt velit voluptatem fuga accusamus. Quia fugiat similique et voluptatum. Saepe unde mollitia velit commodi in dignissimos. Aperiam velit ea sequi.\n\nOdio amet totam qui eum. Et ducimus in impedit vel. Mollitia dolorem iste voluptas et consequatur consequatur.\n\nFacere quasi voluptates qui enim fugiat. Quas voluptas earum aliquam officia id. Voluptate esse voluptate accusamus veritatis numquam aliquam occaecati. Qui voluptatem beatae nulla suscipit.\n\nQui voluptates ullam inventore voluptates. Tempore voluptas quas blanditiis. Rerum est expedita et cupiditate sed veniam. Facilis rerum voluptatem blanditiis cupiditate non voluptatibus.\n\nConsequatur voluptate ut quidem alias ipsum atque. Deleniti beatae iste qui cumque voluptatibus. Ipsam fugiat dolorum non maiores ut.\n\nNihil quae exercitationem nihil voluptate. Nesciunt eos non quas consequuntur aut sapiente corrupti. Aperiam optio nesciunt at maxime ut.\n\nVoluptatibus occaecati autem repellendus consectetur. Cupiditate soluta incidunt optio ut. Natus aperiam voluptas magnam earum explicabo exercitationem vero. Explicabo consectetur non unde suscipit pariatur.\n\nA impedit nihil sit adipisci. Dolores vel dolores impedit optio. Fugiat aut tenetur odio non. Tempore repellat porro aut error eveniet iure.\n\nEt a dolore quia dolores vel. Aut et modi praesentium est qui. Quasi atque in nesciunt quis. Illum quaerat harum quia.', 'Doloribus unde nobis assumenda ut nesciunt asperiores voluptas. Officia debitis quam nesciunt et accusantium placeat. At sit vel alias. Occaecati assumenda ea et deleniti magni ut ullam.\n\nEsse ullam sapiente sunt et labore. Est debitis et incidunt cupiditate. Dicta sint quod autem quia.\n\nPossimus est quidem numquam enim. Saepe ad nihil hic ipsum dolorem magnam explicabo. Magnam corrupti saepe dicta veniam eveniet quam rem.\n\nReiciendis laborum adipisci officia beatae sint id. Tempora assumenda odio enim. Ducimus quae possimus unde voluptas aspernatur consectetur ad autem. Dignissimos molestiae velit aliquam aliquam ut doloremque voluptatem.\n\nQui inventore debitis rerum voluptatem. Ducimus tempore fugit distinctio non voluptas accusamus accusantium. Ipsam eos similique sunt consequatur ut deleniti quos repellat. Possimus voluptatum repudiandae voluptas voluptatum.\n\nCulpa reiciendis ipsam eum quos cupiditate labore. Quisquam magnam qui suscipit dolor impedit dolores. Aperiam et voluptatem quis eum a repellendus et.\n\nQui et nam aut sit quas. Exercitationem omnis et qui neque. Non laborum id ut.\n\nExpedita iusto tempora pariatur ad dolor velit. Fugit enim accusamus velit ut. Eos sequi voluptas non corrupti aut enim.\n\nQuia consequatur perspiciatis hic laudantium. Corporis earum quos rerum nostrum maiores. Eligendi illo sit eos at est aut.\n\nEt velit voluptatem fuga accusamus. Quia fugiat similique et voluptatum. Saepe unde mollitia velit commodi in dignissimos. Aperiam velit ea sequi.\n\nOdio amet totam qui eum. Et ducimus in impedit vel. Mollitia dolorem iste voluptas et consequatur consequatur.\n\nFacere quasi voluptates qui enim fugiat. Quas voluptas earum aliquam officia id. Voluptate esse voluptate accusamus veritatis numquam aliquam occaecati. Qui voluptatem beatae nulla suscipit.\n\nQui voluptates ullam inventore voluptates. Tempore voluptas quas blanditiis. Rerum est expedita et cupiditate sed veniam. Facilis rerum voluptatem blanditiis cupiditate non voluptatibus.\n\nConsequatur voluptate ut quidem alias ipsum atque. Deleniti beatae iste qui cumque voluptatibus. Ipsam fugiat dolorum non maiores ut.\n\nNihil quae exercitationem nihil voluptate. Nesciunt eos non quas consequuntur aut sapiente corrupti. Aperiam optio nesciunt at maxime ut.\n\nVoluptatibus occaecati autem repellendus consectetur. Cupiditate soluta incidunt optio ut. Natus aperiam voluptas magnam earum explicabo exercitationem vero. Explicabo consectetur non unde suscipit pariatur.\n\nA impedit nihil sit adipisci. Dolores vel dolores impedit optio. Fugiat aut tenetur odio non. Tempore repellat porro aut error eveniet iure.\n\nEt a dolore quia dolores vel. Aut et modi praesentium est qui. Quasi atque in nesciunt quis. Illum quaerat harum quia.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '1998-11-19 06:29:59', null);
INSERT INTO `posts` VALUES ('18', '6', '2', 'Maiores similique fugit aut veniam.', 'Modi quo aperiam dolor eum officia et consequatur nemo aut cum qui nemo omnis.', 'neque-modi-cum-dicta-voluptates', 'Quis non quo nam soluta fugit. Iste reprehenderit error reiciendis laborum optio aliquid et. Aspernatur sequi in magnam omnis laboriosam. Eveniet ea deserunt corrupti maxime dolor voluptas ipsa.\n\nEius molestiae est nemo. Consequatur amet saepe id impedit. Autem deleniti eos quas repellat quos est aliquam.\n\nVeritatis provident et esse repellendus ea fuga. Nobis praesentium omnis quia quia. Porro dolorem temporibus asperiores ea voluptatum beatae.\n\nEt et quaerat sunt qui in sed. Dicta totam velit dolorem id numquam amet delectus. Quis neque tenetur fugit itaque omnis autem.\n\nQuia pariatur non accusamus eius consequatur reiciendis. Qui ullam possimus earum optio molestiae est.\n\nVel repudiandae pariatur blanditiis excepturi reprehenderit illum nihil. Est odio sequi officia. Totam itaque id doloremque dicta commodi est. Atque quos eum dolorum voluptates.\n\nEst voluptatem molestiae qui autem aut minima eum. Natus autem quia ut reprehenderit. Velit ea earum adipisci aliquam. Non temporibus omnis accusantium quia dolorum pariatur saepe.', 'Quis non quo nam soluta fugit. Iste reprehenderit error reiciendis laborum optio aliquid et. Aspernatur sequi in magnam omnis laboriosam. Eveniet ea deserunt corrupti maxime dolor voluptas ipsa.\n\nEius molestiae est nemo. Consequatur amet saepe id impedit. Autem deleniti eos quas repellat quos est aliquam.\n\nVeritatis provident et esse repellendus ea fuga. Nobis praesentium omnis quia quia. Porro dolorem temporibus asperiores ea voluptatum beatae.\n\nEt et quaerat sunt qui in sed. Dicta totam velit dolorem id numquam amet delectus. Quis neque tenetur fugit itaque omnis autem.\n\nQuia pariatur non accusamus eius consequatur reiciendis. Qui ullam possimus earum optio molestiae est.\n\nVel repudiandae pariatur blanditiis excepturi reprehenderit illum nihil. Est odio sequi officia. Totam itaque id doloremque dicta commodi est. Atque quos eum dolorum voluptates.\n\nEst voluptatem molestiae qui autem aut minima eum. Natus autem quia ut reprehenderit. Velit ea earum adipisci aliquam. Non temporibus omnis accusantium quia dolorum pariatur saepe.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '1991-02-11 07:25:04', null);
INSERT INTO `posts` VALUES ('19', '6', '2', 'Doloremque et fuga est incidunt itaque autem aut sit laudantium.', 'Magnam quod optio mollitia ex delectus aliquid nihil provident officia perferendis consequuntur voluptates.', 'ipsam-enim-distinctio-aspernatur-ut-quod-nostrum-totam-non', 'Magni voluptatibus enim tempora rerum eaque dolorum. Qui ut cupiditate excepturi. Exercitationem repudiandae et magni delectus aliquid odio consequatur.\n\nNulla saepe expedita et. Beatae modi id similique maxime sed non ipsa. Dignissimos aut non quia et aliquid perspiciatis eum. Veritatis ea qui consectetur ut magni sint.\n\nHic et mollitia magni nisi reprehenderit qui sed aut. Neque et recusandae eos voluptatem. Dolorem architecto non dolore blanditiis.\n\nQuam sequi autem tempore voluptatem ad laudantium. Id molestiae eaque enim ex at modi. Distinctio nesciunt aut animi nihil. Nihil eius quas perspiciatis dolore et ut. Maiores recusandae laborum aspernatur nam.\n\nAut enim sit facilis nam quibusdam. Velit qui amet itaque cupiditate natus esse et. Cupiditate non nemo non autem. Magni sunt ipsa suscipit debitis atque iusto dolores quas.\n\nRem unde molestiae ipsum voluptas harum iusto sequi minima. Quia nisi vero voluptatibus qui aut et voluptas et. Assumenda ipsum voluptas non omnis facere. Deleniti aut optio deserunt. Voluptatibus explicabo qui impedit vel et.\n\nDistinctio voluptatibus consequatur laboriosam qui nostrum. Deleniti rem labore veniam eum reprehenderit. Velit voluptas dolore alias quia iure blanditiis ab. Et blanditiis sit eius aut.\n\nAutem corporis aspernatur qui aut mollitia. Numquam architecto qui minima fugit. Sit et consectetur rerum omnis. Pariatur assumenda nisi dolores qui explicabo necessitatibus.\n\nSequi laudantium debitis molestiae itaque et laborum modi cumque. Dolores et nobis placeat quae non aut nulla. Quisquam dolorem quidem earum. Qui consequatur recusandae necessitatibus. Consequuntur sunt ratione consequatur nesciunt non dolor.\n\nQuo expedita et tempore suscipit aut nostrum reprehenderit cumque. Sit voluptas doloremque quae. Tempore et quia ut autem. Ex dolores ullam ab accusantium inventore.\n\nExpedita odit blanditiis consectetur dolor. Sint beatae maxime sunt illum. Quia sit atque eum soluta omnis. Ipsa sit veritatis quia qui quia dicta.\n\nQui odio eum animi. Labore non corporis hic. Provident voluptatem minima corporis autem necessitatibus provident. Ut ut ea quia tempore saepe quis id.\n\nCorrupti debitis labore sit commodi. Cumque voluptas sunt numquam soluta. Sapiente quaerat ullam quia tenetur praesentium aut. Aliquam facilis qui id officiis minus non. Provident exercitationem blanditiis quibusdam nisi facilis suscipit.\n\nVeniam at vel aut inventore. Architecto perspiciatis aspernatur minima et et animi praesentium.\n\nConsequatur maxime sit sapiente dolorem itaque repellendus velit. Sed libero dolorem sunt. Aut quasi voluptate at ea fuga sit et blanditiis.\n\nOdio quisquam non repellendus at id aut et vel. Non est natus facere sint animi consequatur iste fugit. Consequatur velit temporibus est exercitationem praesentium. Illo dolorem unde illo.\n\nId excepturi saepe nulla et officia et. Nesciunt at in aut qui perferendis incidunt. Perferendis facere labore soluta in.\n\nEligendi in cupiditate voluptatum inventore ea. In repellat a doloremque sed eos laudantium enim. Incidunt consectetur et omnis consequatur aut velit.', 'Magni voluptatibus enim tempora rerum eaque dolorum. Qui ut cupiditate excepturi. Exercitationem repudiandae et magni delectus aliquid odio consequatur.\n\nNulla saepe expedita et. Beatae modi id similique maxime sed non ipsa. Dignissimos aut non quia et aliquid perspiciatis eum. Veritatis ea qui consectetur ut magni sint.\n\nHic et mollitia magni nisi reprehenderit qui sed aut. Neque et recusandae eos voluptatem. Dolorem architecto non dolore blanditiis.\n\nQuam sequi autem tempore voluptatem ad laudantium. Id molestiae eaque enim ex at modi. Distinctio nesciunt aut animi nihil. Nihil eius quas perspiciatis dolore et ut. Maiores recusandae laborum aspernatur nam.\n\nAut enim sit facilis nam quibusdam. Velit qui amet itaque cupiditate natus esse et. Cupiditate non nemo non autem. Magni sunt ipsa suscipit debitis atque iusto dolores quas.\n\nRem unde molestiae ipsum voluptas harum iusto sequi minima. Quia nisi vero voluptatibus qui aut et voluptas et. Assumenda ipsum voluptas non omnis facere. Deleniti aut optio deserunt. Voluptatibus explicabo qui impedit vel et.\n\nDistinctio voluptatibus consequatur laboriosam qui nostrum. Deleniti rem labore veniam eum reprehenderit. Velit voluptas dolore alias quia iure blanditiis ab. Et blanditiis sit eius aut.\n\nAutem corporis aspernatur qui aut mollitia. Numquam architecto qui minima fugit. Sit et consectetur rerum omnis. Pariatur assumenda nisi dolores qui explicabo necessitatibus.\n\nSequi laudantium debitis molestiae itaque et laborum modi cumque. Dolores et nobis placeat quae non aut nulla. Quisquam dolorem quidem earum. Qui consequatur recusandae necessitatibus. Consequuntur sunt ratione consequatur nesciunt non dolor.\n\nQuo expedita et tempore suscipit aut nostrum reprehenderit cumque. Sit voluptas doloremque quae. Tempore et quia ut autem. Ex dolores ullam ab accusantium inventore.\n\nExpedita odit blanditiis consectetur dolor. Sint beatae maxime sunt illum. Quia sit atque eum soluta omnis. Ipsa sit veritatis quia qui quia dicta.\n\nQui odio eum animi. Labore non corporis hic. Provident voluptatem minima corporis autem necessitatibus provident. Ut ut ea quia tempore saepe quis id.\n\nCorrupti debitis labore sit commodi. Cumque voluptas sunt numquam soluta. Sapiente quaerat ullam quia tenetur praesentium aut. Aliquam facilis qui id officiis minus non. Provident exercitationem blanditiis quibusdam nisi facilis suscipit.\n\nVeniam at vel aut inventore. Architecto perspiciatis aspernatur minima et et animi praesentium.\n\nConsequatur maxime sit sapiente dolorem itaque repellendus velit. Sed libero dolorem sunt. Aut quasi voluptate at ea fuga sit et blanditiis.\n\nOdio quisquam non repellendus at id aut et vel. Non est natus facere sint animi consequatur iste fugit. Consequatur velit temporibus est exercitationem praesentium. Illo dolorem unde illo.\n\nId excepturi saepe nulla et officia et. Nesciunt at in aut qui perferendis incidunt. Perferendis facere labore soluta in.\n\nEligendi in cupiditate voluptatum inventore ea. In repellat a doloremque sed eos laudantium enim. Incidunt consectetur et omnis consequatur aut velit.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '2007-03-13 17:09:39', null);
INSERT INTO `posts` VALUES ('20', '6', '4', 'Velit iusto labore consequuntur ipsum aut velit quia.', 'Velit voluptas minima vel maxime quam hic id voluptatum ipsa doloribus possimus autem.', 'quo-odio-quisquam-sit-ea-magni-et-amet', 'Optio sed illo dolorem voluptates. Ratione asperiores possimus eos et explicabo tenetur corrupti exercitationem. Voluptas est architecto eveniet non fugit. Vitae aut in ex quia consequatur hic voluptas nihil. Molestiae laboriosam maiores est sapiente voluptatibus.\n\nSapiente distinctio ratione quia praesentium aut vel. Sed temporibus repudiandae vel facere rerum temporibus perspiciatis.\n\nEst voluptas eum rerum et molestiae ducimus dignissimos dolorem. Velit similique fugit adipisci.\n\nSit iure inventore aperiam dolor. Sunt ratione autem veritatis dicta ipsa. Non cum consequatur mollitia aut.\n\nVoluptatem sapiente sunt voluptas repellat a. Dolorem dolor non repellendus omnis. Commodi inventore nihil recusandae nemo nostrum nulla. Maiores dignissimos rerum qui necessitatibus enim et eum.\n\nLaborum pariatur sed nobis maxime voluptatibus voluptas porro aut. Illo reiciendis nihil qui atque aut totam voluptatibus eum. Et enim labore minus dolores possimus.\n\nNeque corrupti porro et necessitatibus. Ut ea voluptatem perferendis est aperiam corporis praesentium.\n\nVelit ea molestiae cupiditate repudiandae vel. Quos qui deserunt sint voluptatem incidunt.\n\nEos atque voluptatem animi sunt iste. Nisi sapiente minima error laboriosam aut. Placeat cum aperiam est quia recusandae incidunt modi. Error perspiciatis et excepturi praesentium consequatur deserunt veniam.\n\nCupiditate aliquam natus incidunt et et doloremque. Similique debitis iusto unde et dolore suscipit eligendi. Dicta mollitia debitis nobis nobis voluptas. Itaque consequatur et voluptate reprehenderit.\n\nOfficiis modi vero voluptate nihil quia natus sequi. Aut laudantium sit dolorem dolorem. Dolorem ex quibusdam nostrum tempora.\n\nOdit deleniti et libero libero sapiente et debitis. Voluptatum veritatis quam tempore est. Sit ut optio cum modi dolorum ut eum. Hic est maxime enim a in quia aut.\n\nAut eius quo voluptas. In id vitae aliquam. Nihil iusto et harum eius maiores sint.\n\nQui nesciunt optio neque minima eum expedita magnam. Perferendis similique aut eos recusandae. Nam vel culpa voluptatum eum.', 'Optio sed illo dolorem voluptates. Ratione asperiores possimus eos et explicabo tenetur corrupti exercitationem. Voluptas est architecto eveniet non fugit. Vitae aut in ex quia consequatur hic voluptas nihil. Molestiae laboriosam maiores est sapiente voluptatibus.\n\nSapiente distinctio ratione quia praesentium aut vel. Sed temporibus repudiandae vel facere rerum temporibus perspiciatis.\n\nEst voluptas eum rerum et molestiae ducimus dignissimos dolorem. Velit similique fugit adipisci.\n\nSit iure inventore aperiam dolor. Sunt ratione autem veritatis dicta ipsa. Non cum consequatur mollitia aut.\n\nVoluptatem sapiente sunt voluptas repellat a. Dolorem dolor non repellendus omnis. Commodi inventore nihil recusandae nemo nostrum nulla. Maiores dignissimos rerum qui necessitatibus enim et eum.\n\nLaborum pariatur sed nobis maxime voluptatibus voluptas porro aut. Illo reiciendis nihil qui atque aut totam voluptatibus eum. Et enim labore minus dolores possimus.\n\nNeque corrupti porro et necessitatibus. Ut ea voluptatem perferendis est aperiam corporis praesentium.\n\nVelit ea molestiae cupiditate repudiandae vel. Quos qui deserunt sint voluptatem incidunt.\n\nEos atque voluptatem animi sunt iste. Nisi sapiente minima error laboriosam aut. Placeat cum aperiam est quia recusandae incidunt modi. Error perspiciatis et excepturi praesentium consequatur deserunt veniam.\n\nCupiditate aliquam natus incidunt et et doloremque. Similique debitis iusto unde et dolore suscipit eligendi. Dicta mollitia debitis nobis nobis voluptas. Itaque consequatur et voluptate reprehenderit.\n\nOfficiis modi vero voluptate nihil quia natus sequi. Aut laudantium sit dolorem dolorem. Dolorem ex quibusdam nostrum tempora.\n\nOdit deleniti et libero libero sapiente et debitis. Voluptatum veritatis quam tempore est. Sit ut optio cum modi dolorum ut eum. Hic est maxime enim a in quia aut.\n\nAut eius quo voluptas. In id vitae aliquam. Nihil iusto et harum eius maiores sint.\n\nQui nesciunt optio neque minima eum expedita magnam. Perferendis similique aut eos recusandae. Nam vel culpa voluptatum eum.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '2008-07-12 12:15:45', null);
INSERT INTO `posts` VALUES ('36', '10', '7', 'Quisquam voluptas sunt incidunt id maiores qui eligendi repellendus.', 'Consequatur facilis excepturi omnis similique esse.', 'sit-est-sint-ipsa-minima-sit-vitae', 'Et ut id alias repellendus illum voluptas aut. Totam minima perferendis eaque voluptatem iure. Recusandae ut rerum quia.\n\nAperiam porro ab nesciunt similique doloribus. Fuga vitae et beatae odit deserunt et. Nulla omnis repellat libero aut consequuntur id.\n\nExplicabo sapiente voluptas dicta ea quia commodi. Suscipit numquam laborum laboriosam molestiae. Ut voluptatem eum corrupti nisi qui nisi. Et velit molestias et neque autem atque ipsum.\n\nSequi accusamus animi ullam optio officia. Temporibus rem error temporibus omnis in. Veritatis in nostrum tempora cupiditate.\n\nDoloribus reiciendis pariatur nihil. Sequi earum omnis incidunt placeat.\n\nAdipisci ducimus beatae nihil aut omnis nostrum. Ipsum adipisci ea deleniti quis nulla ut. Animi aspernatur in quae natus impedit eos aspernatur. Qui earum quia inventore et dicta voluptas.\n\nEt nobis animi voluptatum sint rem aspernatur tempore voluptatem. Voluptatem inventore delectus quasi et minus. Facilis molestias voluptate asperiores consequatur. Id occaecati ad amet vero.\n\nDeserunt autem eos iure repellendus voluptatum deserunt in voluptas. Iste deserunt reprehenderit quos ea velit laborum. Eos doloribus dolore magni cum quo.\n\nVitae alias quisquam porro nemo fuga. Asperiores fugit commodi consequuntur.\n\nDeleniti molestiae aut cum laborum nisi nulla et. Amet ut nesciunt dolor ea. In dolorum architecto et enim.', 'Et ut id alias repellendus illum voluptas aut. Totam minima perferendis eaque voluptatem iure. Recusandae ut rerum quia.\n\nAperiam porro ab nesciunt similique doloribus. Fuga vitae et beatae odit deserunt et. Nulla omnis repellat libero aut consequuntur id.\n\nExplicabo sapiente voluptas dicta ea quia commodi. Suscipit numquam laborum laboriosam molestiae. Ut voluptatem eum corrupti nisi qui nisi. Et velit molestias et neque autem atque ipsum.\n\nSequi accusamus animi ullam optio officia. Temporibus rem error temporibus omnis in. Veritatis in nostrum tempora cupiditate.\n\nDoloribus reiciendis pariatur nihil. Sequi earum omnis incidunt placeat.\n\nAdipisci ducimus beatae nihil aut omnis nostrum. Ipsum adipisci ea deleniti quis nulla ut. Animi aspernatur in quae natus impedit eos aspernatur. Qui earum quia inventore et dicta voluptas.\n\nEt nobis animi voluptatum sint rem aspernatur tempore voluptatem. Voluptatem inventore delectus quasi et minus. Facilis molestias voluptate asperiores consequatur. Id occaecati ad amet vero.\n\nDeserunt autem eos iure repellendus voluptatum deserunt in voluptas. Iste deserunt reprehenderit quos ea velit laborum. Eos doloribus dolore magni cum quo.\n\nVitae alias quisquam porro nemo fuga. Asperiores fugit commodi consequuntur.\n\nDeleniti molestiae aut cum laborum nisi nulla et. Amet ut nesciunt dolor ea. In dolorum architecto et enim.', '1', '0', '2017-01-14 09:24:53', '2017-01-14 09:24:53', '1999-06-03 18:58:51', null);
INSERT INTO `posts` VALUES ('37', '1', '1', '测试标题一', '<h1>文章描述</h1>', '文章slug', '###怎么使用markdown\r\n>怎么发大发明买爱疯都是吗分码数的免费的撒范德萨发明的‘’马丁师傅马上免费的马萨飞马是免费的吗按什么', '<h3>怎么使用markdown</h3>\n<blockquote>\n<p>怎么发大发明买爱疯都是吗分码数的免费的撒范德萨发明的‘’马丁师傅马上免费的马萨飞马是免费的吗按什么</p>\n</blockquote>', '1', '2', '2017-01-14 09:46:24', '2017-06-09 22:22:08', '2017-01-14 09:48:11', null);
INSERT INTO `posts` VALUES ('38', '1', '1', 'ceshi', '<p>ceshi</p>', 'cehi', '[](http://)##怎么使用markdown[](http://)##怎么使用markdown[](http://)##怎么使用markdown[](http://)##怎么使用markdown![](![](http://)http://)![](\r\n\r\n| Column 1 | Column 2 | Column 3 |![](http://)\r\n| -------- | -------- | -------- |\r\n| Text     | Text     | Text     |\r\n\r\nhttp://)', '<p><a href=\"http://\"></a>##怎么使用markdown<a href=\"http://\"></a>##怎么使用markdown<a href=\"http://\"></a>##怎么使用markdown<a href=\"http://\"></a>##怎么使用markdown<img src=\"![](http://)http://\" alt=\"\" />![](</p>\n<table>\n<thead>\n<tr>\n<th>Column 1</th>\n<th>Column 2</th>\n<th>Column 3</th>\n<th><img src=\"http://\" alt=\"\" /></th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Text</td>\n<td>Text</td>\n<td>Text</td>\n</tr>\n</tbody>\n</table>\n<p>http://)</p>', '1', '0', '2017-02-01 10:48:27', '2017-02-01 10:48:27', '2017-02-01 10:48:27', null);
INSERT INTO `posts` VALUES ('39', '1', '1', '333', '<p>333</p>', '333', '\r\n\r\n3333', '<p>3333</p>', '1', '0', '2017-02-01 14:41:10', '2017-02-01 14:41:10', '2017-02-01 14:41:10', null);
INSERT INTO `posts` VALUES ('40', '1', '3', '标题', '<p>文章描述</p>', '订单', '\r\n\r\n| Column 1 | Column 2 | Column 3 |\r\n| -------- | -------- | -------- |\r\n| Text     | Text     | Text     |\r\n\r\nafasdf', '<table>\n<thead>\n<tr>\n<th>Column 1</th>\n<th>Column 2</th>\n<th>Column 3</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Text</td>\n<td>Text</td>\n<td>Text</td>\n</tr>\n</tbody>\n</table>\n<p>afasdf</p>', '1', '3', '2017-06-03 20:15:37', '2017-06-17 21:52:49', '2017-06-17 21:52:49', null);

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `post_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES ('1', '5');
INSERT INTO `post_tag` VALUES ('1', '6');
INSERT INTO `post_tag` VALUES ('2', '3');
INSERT INTO `post_tag` VALUES ('2', '5');
INSERT INTO `post_tag` VALUES ('2', '10');
INSERT INTO `post_tag` VALUES ('3', '2');
INSERT INTO `post_tag` VALUES ('3', '7');
INSERT INTO `post_tag` VALUES ('3', '10');
INSERT INTO `post_tag` VALUES ('4', '3');
INSERT INTO `post_tag` VALUES ('4', '9');
INSERT INTO `post_tag` VALUES ('4', '10');
INSERT INTO `post_tag` VALUES ('5', '4');
INSERT INTO `post_tag` VALUES ('5', '6');
INSERT INTO `post_tag` VALUES ('6', '2');
INSERT INTO `post_tag` VALUES ('6', '3');
INSERT INTO `post_tag` VALUES ('6', '6');
INSERT INTO `post_tag` VALUES ('7', '9');
INSERT INTO `post_tag` VALUES ('8', '2');
INSERT INTO `post_tag` VALUES ('8', '4');
INSERT INTO `post_tag` VALUES ('8', '8');
INSERT INTO `post_tag` VALUES ('9', '2');
INSERT INTO `post_tag` VALUES ('9', '5');
INSERT INTO `post_tag` VALUES ('10', '4');
INSERT INTO `post_tag` VALUES ('10', '7');
INSERT INTO `post_tag` VALUES ('11', '6');
INSERT INTO `post_tag` VALUES ('12', '4');
INSERT INTO `post_tag` VALUES ('12', '10');
INSERT INTO `post_tag` VALUES ('13', '2');
INSERT INTO `post_tag` VALUES ('13', '7');
INSERT INTO `post_tag` VALUES ('14', '4');
INSERT INTO `post_tag` VALUES ('14', '5');
INSERT INTO `post_tag` VALUES ('15', '3');
INSERT INTO `post_tag` VALUES ('15', '6');
INSERT INTO `post_tag` VALUES ('15', '7');
INSERT INTO `post_tag` VALUES ('15', '10');
INSERT INTO `post_tag` VALUES ('16', '8');
INSERT INTO `post_tag` VALUES ('16', '9');
INSERT INTO `post_tag` VALUES ('17', '2');
INSERT INTO `post_tag` VALUES ('18', '4');
INSERT INTO `post_tag` VALUES ('18', '6');
INSERT INTO `post_tag` VALUES ('19', '3');
INSERT INTO `post_tag` VALUES ('19', '10');
INSERT INTO `post_tag` VALUES ('20', '4');
INSERT INTO `post_tag` VALUES ('20', '6');
INSERT INTO `post_tag` VALUES ('20', '7');
INSERT INTO `post_tag` VALUES ('21', '6');
INSERT INTO `post_tag` VALUES ('21', '10');
INSERT INTO `post_tag` VALUES ('22', '2');
INSERT INTO `post_tag` VALUES ('22', '3');
INSERT INTO `post_tag` VALUES ('22', '4');
INSERT INTO `post_tag` VALUES ('23', '3');
INSERT INTO `post_tag` VALUES ('23', '4');
INSERT INTO `post_tag` VALUES ('24', '3');
INSERT INTO `post_tag` VALUES ('25', '3');
INSERT INTO `post_tag` VALUES ('25', '4');
INSERT INTO `post_tag` VALUES ('25', '6');
INSERT INTO `post_tag` VALUES ('26', '4');
INSERT INTO `post_tag` VALUES ('27', '2');
INSERT INTO `post_tag` VALUES ('27', '9');
INSERT INTO `post_tag` VALUES ('27', '10');
INSERT INTO `post_tag` VALUES ('28', '4');
INSERT INTO `post_tag` VALUES ('28', '8');
INSERT INTO `post_tag` VALUES ('28', '9');
INSERT INTO `post_tag` VALUES ('29', '3');
INSERT INTO `post_tag` VALUES ('29', '6');
INSERT INTO `post_tag` VALUES ('29', '8');
INSERT INTO `post_tag` VALUES ('29', '10');
INSERT INTO `post_tag` VALUES ('30', '5');
INSERT INTO `post_tag` VALUES ('31', '2');
INSERT INTO `post_tag` VALUES ('31', '3');
INSERT INTO `post_tag` VALUES ('31', '10');
INSERT INTO `post_tag` VALUES ('32', '2');
INSERT INTO `post_tag` VALUES ('32', '3');
INSERT INTO `post_tag` VALUES ('32', '4');
INSERT INTO `post_tag` VALUES ('33', '6');
INSERT INTO `post_tag` VALUES ('34', '3');
INSERT INTO `post_tag` VALUES ('34', '4');
INSERT INTO `post_tag` VALUES ('35', '8');
INSERT INTO `post_tag` VALUES ('36', '6');
INSERT INTO `post_tag` VALUES ('36', '9');
INSERT INTO `post_tag` VALUES ('37', '2');
INSERT INTO `post_tag` VALUES ('37', '4');
INSERT INTO `post_tag` VALUES ('38', '2');
INSERT INTO `post_tag` VALUES ('40', '1');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'a54hExU');
INSERT INTO `tags` VALUES ('2', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'uDZFdZq');
INSERT INTO `tags` VALUES ('3', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'mJtJiTx');
INSERT INTO `tags` VALUES ('4', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'RxO1TJq');
INSERT INTO `tags` VALUES ('5', '2017-01-14 09:24:52', '2017-01-14 09:24:52', '30q1a12');
INSERT INTO `tags` VALUES ('6', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'YMtVV3r');
INSERT INTO `tags` VALUES ('7', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'lxf03OJ');
INSERT INTO `tags` VALUES ('8', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'ZuzU9Cd');
INSERT INTO `tags` VALUES ('9', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'p4nrOPj');
INSERT INTO `tags` VALUES ('10', '2017-01-14 09:24:52', '2017-01-14 09:24:52', 'XumRRQ8');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `register_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'web_form',
  `github_id` int(11) DEFAULT NULL,
  `github_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_register_from_index` (`register_from`),
  KEY `users_github_id_index` (`github_id`),
  KEY `users_github_name_index` (`github_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'liu', '1662853651@163.com', '$2y$10$1zZJHSTEpIeiGLDLAAOP7uQhIW8.rfl9ST051VA9YBZkgY6mZCiYq', 'web_form', null, null, '', '', '', '{\"github\":\"\",\"facebook\":\"4rte\",\"weibo\":\"\",\"twitter\":\"\"}', '', null, 'vF9mHsrXE8ol8vd3lw5ER2QIkBTdhGZ5xHOuhzBbbrjwZdlzzkyPnj6njrbp', '2017-05-28 15:01:55', '2017-06-09 22:22:03');
INSERT INTO `users` VALUES ('2', 'Dr. Bette Braun', 'zakary53@example.com', '$2y$10$WvH08cY1V3Ap3hnGeHpVGuc1GWQd9ikw1x.WFReu3d0Dyq66NdNVi', 'web_form', null, null, null, null, null, null, null, null, 'BBiePHFIKz', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('3', 'Elvera Schultz', 'odibbert@example.net', '$2y$10$CWEBXithiLWTXMFIUX0SYuVzr6v.CkbZsPt1xbcERRDf2/ZPWYI4G', 'web_form', null, null, null, null, null, null, null, null, 'SoQGalhlIx', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('4', 'Frederic Schmidt', 'zgibson@example.net', '$2y$10$PyCgTGvm5uCHg/PnD3fhVuOgzfLz4QvXp/gtu2bwYI7MyK2pfwMZu', 'web_form', null, null, null, null, null, null, null, null, '0jjeFR8JTQ', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('5', 'Prof. Frederic Runte', 'yazmin51@example.org', '$2y$10$JrMXUPHyKAxpzb6tAbDHwOYNX5XaxnADeB0NIwx7yOcK4WLpDgSpu', 'web_form', null, null, null, null, null, null, null, null, 'UH3UA8uMjW', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('6', 'Dereck Rippin', 'fatima25@example.net', '$2y$10$ATjO9Oc31y0D0SIQkTWhA.hnzhJ2GZBPbjbVMLTp8dv/FMJs1iCd2', 'web_form', null, null, null, null, null, null, null, null, 'jHykCnJWZZ', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('7', 'Oren Rolfson', 'nayeli50@example.net', '$2y$10$5r92GwYnJhiLVH6gb/y1zeQmc6D9EfTZ9ST9Aubydo20RJApo2Hgm', 'web_form', null, null, null, null, null, null, null, null, 'qMjQwZRbtA', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('8', 'Dr. Rae Rippin II', 'eichmann.jayce@example.org', '$2y$10$0r4tCCpQLR0z.R.DMUAJduvI7TezGWXYg./oYNKxhNHBgL2X3PBki', 'web_form', null, null, null, null, null, null, null, null, 'L1XnHhuBt0', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('9', 'Natalia Batz', 'raphael.becker@example.org', '$2y$10$4Restx5aP1cf.8TmDWJXce8mIcn/W0s8zBGMImp2RGYCXEmh3IDaW', 'web_form', null, null, null, null, null, null, null, null, 'LnzMGbRXp5', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('10', 'Mrs. Emely Jaskolski', 'smitham.myrtie@example.org', '$2y$10$xdEzYSOx8Z4jaqjm0KGE9OMPVhzmnt9jTJFAvJMf1okjjXoCj71O2', 'web_form', null, null, null, null, null, null, null, null, 'jIrQy1zNMc', '2017-01-14 09:24:52', '2017-01-14 09:24:52');
INSERT INTO `users` VALUES ('12', 'Justen Fisher', 'collier.fredrick@example.net', '$2y$10$E9i922vdneaozvvzes0iL.N2omYtUpbFQOdi.afFhSKCUFgaRt/kG', 'web_form', null, null, null, null, null, null, null, null, 'rbACSzbRcs', '2017-01-14 09:24:52', '2017-01-14 09:24:52');

-- ----------------------------
-- Table structure for xx_article
-- ----------------------------
DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT ' 1 已发表 2.禁止显示 -1删除',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published_at` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0',
  `tag_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1,2,5',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xx_article
-- ----------------------------
INSERT INTO `xx_article` VALUES ('1', '6', '4', '22', 'cto aut iste optio aperiam.', 'est-sunt-nesciunt-vel-dignissimos', '333', '44', '2', '0', '2017-06-09 19:41:29', '1982', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('2', '1', '4', '22', 'm.', 'dolor-harum-et-et-maiores-aut-iste', '333', '44', '-1', '0', '2017-06-13 09:09:51', '2005', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('3', '6', '4', '22', 'Dolorem cum dolores soluta culpa.', 'assumenda-excepturi-sunt-nisi', '333', '44', '1', '0', '2017-01-14 09:24:52', '1977', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('4', '6', '6', '22', 'Corrupti id delectus soluta aut qui consequuntur enim.', 'enim-sequi-iusto-quibusdam-dolores', '333', '44', '1', '0', '2017-01-14 09:24:52', '1996', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('5', '6', '6', '22', 'ab recusandae.', 'omnis-nisi-dicta-tempore-aut-qui-aut-voluptatem', '333', '44', '1', '0', '2017-01-14 09:24:52', '2015', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('6', '6', '6', '22', 'ntium illum eos.', 'totam-eum-facilis-vero-est-et-est-voluptatem-sed', '333', '44', '1', '0', '2017-01-14 09:24:52', '1999', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('7', '6', '6', '22', 'A tenetur illo aliquam rerum.', 'saepe-perspiciatis-expedita-omnis', '333', '44', '1', '0', '2017-01-14 09:24:52', '1992', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('8', '6', '6', '22', 'nis blanditiis.', 'est-iure-laboriosam-consequatur-deserunt-tempore-sed-excepturi-ea', '333', '44', '1', '0', '2017-01-14 09:24:52', '1987', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('9', '6', '6', '22', 'Qui aperiam dolorum et sint atque aut.', 'ea-quia-impedit-rerum-delectus-architecto-voluptas', '333', '44', '1', '0', '2017-01-14 09:24:52', '1981', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('10', '6', '6', '22', 'eum officia.', 'officia-aliquam-officiis-maiores-iure-et-architecto-quo', '333', '44', '1', '0', '2017-01-14 09:24:52', '1977', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('27', '9', '3', '22', '', 'est-non-totam-architecto-animi-nobis', '333', '44', '1', '0', '2017-01-14 09:24:53', '2005', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('28', '10', '7', '22', 'Laudantium saepe quis quas ut.', 'quo-dignissimos-rerum-temporibus-magnam-tempore-corrupti', '333', '44', '-1', '0', '2017-06-04 21:16:17', '1996', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('29', '10', '7', '22', 'Labore accusantium et provident error.', 'est-unde-quod-suscipit-alias-sunt', '333', '44', '-1', '0', '2017-06-04 21:16:22', '2001', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('30', '10', '7', '22', 'orporis voluptates quis.', 'sed-eveniet-fugit-distinctio-cumque-eos', '333', '44', '1', '0', '2017-01-14 09:24:53', '2016', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('31', '10', '7', '22', 't alias ut.', 'voluptas-sit-dolore-molestiae-accusantium-accusantium-et', '333', '44', '1', '0', '2017-01-14 09:24:53', '1972', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('32', '10', '7', '22', 'ctio non ipsam et.', 'est-officiis-odit-praesentium-sequi', '333', '44', '1', '0', '2017-01-14 09:24:53', '1997', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('33', '10', '7', '22', 'io eos.', 'unde-ea-deleniti-dignissimos', '333', '44', '1', '0', '2017-01-14 09:24:53', '1991', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('34', '10', '7', '22', 'cere autem velit ut sint.', 'ducimus-numquam-officia-rerum-ex-omnis', '333', '44', '1', '0', '2017-01-14 09:24:53', '2003', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('35', '10', '7', '22', 'um inventore.', 'architecto-quibusdam-temporibus-modi', '333', '44', '1', '0', '2017-01-14 09:24:53', '2000', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('36', '10', '7', '22', 'Consequatur facilis excepturi omnis similique esse.', 'sit-est-sint-ipsa-minima-sit-vitae', '333', '44', '1', '0', '2017-01-14 09:24:53', '1999', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('37', '1', '1', '测试标题一', '<h1>文章描述</h1>', '文章slug', '333', '44', '1', '0', '2017-01-14 09:46:24', '2017', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('38', '1', '1', 'ceshi', '<p>ceshi</p>', 'cehi', '[](http://)##怎么使用markdown[](http://)##怎么使用markdown[](http://)##怎么使用markdown[](http://)##怎么使用markdown![](![](http://)http://)![](\r\n\r\n| Column 1 | Column 2 | Column 3 |![](http://)\r\n| -------- | -------- | -------- |\r\n| Text     | Text     | Text     |\r\n\r\nhttp://)', '<p><a href=\"http://\"></a>##怎么使用markdown<a href=\"http://\"></a>##怎么使用markdown<a href=\"http://\"></a>##怎么使用markdown<a href=\"http://\"></a>##怎么使用markdown<img src=\"![](http://)http://\" alt=\"\" />![](</p>\n<table>\n<thead>\n<tr>\n<th>Column 1</th>\n<th>Column 2</th>\n<th>Column 3</th>\n<th><img src=\"http://\" alt=\"\" /></th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Text</td>\n<td>Text</td>\n<td>Text</td>\n</tr>\n</tbody>\n</table>\n<p>http://)</p>', '1', '0', '2017-02-01 10:48:27', '2017', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('39', '1', '1', '333', '<p>333</p>', '333', '\r\n\r\n3333', '<p>3333</p>', '1', '0', '2017-02-01 14:41:10', '2017', '2017', '2,3', '0');
INSERT INTO `xx_article` VALUES ('40', '0', '3', '标题', '描述', '', '444444444444444444444444444', '<p>444444444444444444444444444</p>', '1', '0', '2017-06-03 20:41:34', '0', '0', '2', '0');
INSERT INTO `xx_article` VALUES ('44', '0', '1', '标题', '描述', '', '\r\n\r\n| Column 1 | Column 2 | Column 3 |\r\n| -------- | -------- | -------- |\r\n| Text     | Text     | Text     |\r\n\r\n\r\n', '<table>\n<thead>\n<tr>\n<th>Column 1</th>\n<th>Column 2</th>\n<th>Column 3</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Text</td>\n<td>Text</td>\n<td>Text</td>\n</tr>\n</tbody>\n</table>', '1', '0', '2017-06-03 20:46:56', '0', '0', '2', '0');
INSERT INTO `xx_article` VALUES ('45', '0', '1', '444', 'ddd', '', 'dasdfddfdd', '<p>dasdfddfdd</p>', '1', '0', '2017-06-04 21:09:39', '0', '0', '3', '0');
INSERT INTO `xx_article` VALUES ('46', '0', '4', 'mysql优化', '索引', '', '### mysql\r\n\r\n| id | name | sex |\r\n| -------- | -------- | -------- |\r\n| 2     | 刘安     | 35     |\r\n\r\n', '<h3>mysql</h3>\n<table>\n<thead>\n<tr>\n<th>id</th>\n<th>name</th>\n<th>sex</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>2</td>\n<td>刘安</td>\n<td>35</td>\n</tr>\n</tbody>\n</table>', '2', '1', '2017-06-17 21:44:01', '0', '0', '2', '0');

-- ----------------------------
-- Table structure for xx_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_category`;
CREATE TABLE `xx_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `article_count` int(11) NOT NULL DEFAULT '0' COMMENT '文章数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xx_category
-- ----------------------------
INSERT INTO `xx_category` VALUES ('2', '2017-06-13 09:42:30', 'PHP', '0');
INSERT INTO `xx_category` VALUES ('4', '2017-06-13 09:42:37', 'Mysql', '0');
INSERT INTO `xx_category` VALUES ('5', '2017-06-13 09:42:44', 'Thinkphp5', '0');
INSERT INTO `xx_category` VALUES ('6', '2017-06-13 09:43:47', 'Vue.js', '0');
INSERT INTO `xx_category` VALUES ('7', '2017-06-13 09:43:30', 'Linux', '0');

-- ----------------------------
-- Table structure for xx_comment
-- ----------------------------
DROP TABLE IF EXISTS `xx_comment`;
CREATE TABLE `xx_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `html_content` text COLLATE utf8_unicode_ci NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1，启用 2禁用',
  PRIMARY KEY (`id`),
  KEY `comments_user_id_index` (`user_id`),
  KEY `comments_commentable_id_index` (`article_id`),
  KEY `comments_commentable_type_index` (`commentable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xx_comment
-- ----------------------------
INSERT INTO `xx_comment` VALUES ('1', '1', '37', '评论', '<p>评论</p>', 'App\\Post', 'Justen Fisher', 'collier.fredrick@example.net', '2017-06-06 21:00:42', null, '2');
INSERT INTO `xx_comment` VALUES ('2', '1', '2', '评论2', '<p>评论2</p>', 'App\\Post', 'Justen Fisher', 'collier.fredrick@example.net', '2017-06-13 09:37:06', null, '2');
INSERT INTO `xx_comment` VALUES ('3', '1', '46', 'fdasfd', '<p>fdasfd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:20:28', null, '1');
INSERT INTO `xx_comment` VALUES ('4', '1', '46', 'dasd', '<p>dasd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:22:02', null, '1');
INSERT INTO `xx_comment` VALUES ('5', '1', null, 'dfasfd', '<p>dfasfd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:29:26', null, '1');
INSERT INTO `xx_comment` VALUES ('6', '1', null, 'dfasfd', '<p>dfasfd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:29:29', null, '1');
INSERT INTO `xx_comment` VALUES ('7', '1', null, 'dfasfd', '<p>dfasfd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:29:37', null, '1');
INSERT INTO `xx_comment` VALUES ('8', '1', '46', 'ddd', '<p>ddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:31:40', null, '1');
INSERT INTO `xx_comment` VALUES ('11', '1', null, 'ddd', '<p>ddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:37:15', null, '1');
INSERT INTO `xx_comment` VALUES ('12', '1', null, 'ddd', '<p>ddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:37:18', null, '1');
INSERT INTO `xx_comment` VALUES ('13', '1', null, '4444', '<p>4444</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:37:20', null, '1');
INSERT INTO `xx_comment` VALUES ('14', '1', null, 'ddddddddddddddddddddd', '<p>ddddddddddddddddddddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-13 10:37:30', null, '1');
INSERT INTO `xx_comment` VALUES ('15', '1', null, 'fdfdff', '<p>fdfdff</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 20:47:51', null, '1');
INSERT INTO `xx_comment` VALUES ('16', '1', null, '444444', '<p>444444</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 20:47:55', null, '1');
INSERT INTO `xx_comment` VALUES ('17', '1', null, '12345566', '<p>12345566</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 20:48:50', null, '1');
INSERT INTO `xx_comment` VALUES ('18', '1', '46', 'ddd', '<p>ddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 22:37:21', null, '1');
INSERT INTO `xx_comment` VALUES ('19', '1', null, '34333', '<p>34333</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 22:42:49', null, '1');
INSERT INTO `xx_comment` VALUES ('20', '1', null, 'dddddddddddd', '<p>dddddddddddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 22:43:37', null, '1');
INSERT INTO `xx_comment` VALUES ('21', '1', '46', 'ddddddddddddddddddd', '<p>ddddddddddddddddddd</p>', null, '刘安源', '1662853651@163.com', '2017-06-15 22:45:19', null, '1');
INSERT INTO `xx_comment` VALUES ('22', '1', '46', 'fasfasdfsdf', '<p>fasfasdfsdf</p>', null, '刘安源', '1662853651@163.com', '2017-06-17 21:18:28', null, '1');
INSERT INTO `xx_comment` VALUES ('23', '1', '46', 'fasfasdfsdffdasfdf', '<p>fasfasdfsdffdasfdf</p>', null, '刘安源', '1662853651@163.com', '2017-06-17 21:18:30', null, '1');
INSERT INTO `xx_comment` VALUES ('24', '1', '46', 'fasfasdfsdffdasfffdf', '<p>fasfasdfsdffdasfffdf</p>', null, '刘安源', '1662853651@163.com', '2017-06-17 21:20:00', null, '1');

-- ----------------------------
-- Table structure for xx_image
-- ----------------------------
DROP TABLE IF EXISTS `xx_image`;
CREATE TABLE `xx_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_key_unique` (`image_url`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xx_image
-- ----------------------------
INSERT INTO `xx_image` VALUES ('2', '1384998229592.jpg', '/xblog/image/d2658f022087316d86043db5dc6af353.jpeg', '138143', '2017-01-17 10:04:06');
INSERT INTO `xx_image` VALUES ('3', '1384998236580.jpg', '/xblog/image/0aa6cdfa4980ec7ae6e857c295e5ecc0.jpeg', '1451111', '2017-01-17 10:04:30');
INSERT INTO `xx_image` VALUES ('4', 'photo.jpg', '/demo/593f4474cec98.jpg', '13441', '2017-06-13 09:48:37');

-- ----------------------------
-- Table structure for xx_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_tag`;
CREATE TABLE `xx_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xx_tag
-- ----------------------------
INSERT INTO `xx_tag` VALUES ('13', 'mysql', '2017-06-13 09:39:49');
INSERT INTO `xx_tag` VALUES ('14', '索引', '2017-06-13 09:39:58');
INSERT INTO `xx_tag` VALUES ('15', '数据库', '2017-06-13 09:40:04');
INSERT INTO `xx_tag` VALUES ('16', 'php', '2017-06-13 09:40:15');
INSERT INTO `xx_tag` VALUES ('17', 'laravel', '2017-06-13 09:40:22');
INSERT INTO `xx_tag` VALUES ('18', 'thinkphp5', '2017-06-13 09:40:38');
INSERT INTO `xx_tag` VALUES ('19', 'linux', '2017-06-13 09:41:10');

-- ----------------------------
-- Table structure for xx_user
-- ----------------------------
DROP TABLE IF EXISTS `xx_user`;
CREATE TABLE `xx_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `register_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'web_form',
  `github_id` int(11) DEFAULT NULL,
  `github_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `weibo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `github` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_register_from_index` (`register_from`),
  KEY `users_github_id_index` (`github_id`),
  KEY `users_github_name_index` (`github_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xx_user
-- ----------------------------
INSERT INTO `xx_user` VALUES ('1', '刘安源', '1662853651@163.com', 'e10adc3949ba59abbe56e057f20f883e', 'web_form', null, null, 'dd', '2da', '', '', '2017-05-28 15:01:55', null, null);
