/*
 Navicat Premium Data Transfer

 Source Server         : mysql-local
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : adopt

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 02/06/2024 22:35:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员的名字',
  `adminPwd` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `realName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '真实的名字',
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `Email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `sex` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'a.png',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, '齐达内', 'yi123', '杨一', '13902193927', '2425902914@qq.com', '1993-09-10', '男', 'a1.png', '外号 玄宗。这位可是我们团队的玄学的代表。由他在似乎任何困难都能解决。');
INSERT INTO `admins` VALUES (2, '卡瓦哈尔', 'wemz123', '王二麻子', '14402193927', '2425902016@qq.com', '1994-09-12', '男', 'a2.png', '外号 大傻；他是我们团队中最热心的人。他积极参加团队活动，并且在团队需要他的时候总是全力完成 ');
INSERT INTO `admins` VALUES (3, '瓦拉内', 'zs123', '张三', '14495893927', '2917902016@qq.com', '1994-10-12', '男', 'a3.png', '外号 学霸。这是为真正的学霸，他平时热心团队活动，并且负责团队的财务管理，认真严谨。');
INSERT INTO `admins` VALUES (4, '拉莫斯', 'ls123', '李四', '14495893012', '2107902016@qq.com', '1994-06-09', '男', 'a4.png', '外号 水爷。这位团队外号虽然有水，但是一点也不水，他是我们的队长，为了团队他付出了最多的精力，而且他经常保护队员的安全.');
INSERT INTO `admins` VALUES (5, '纳乔', 'ww123', '王五', '14495890112', '2992902016@qq.com', '1995-06-12', '女', 'a5.png', '外号 万金油。这位队员人如其名，是我们团队的万金油，当我们团队成员，紧急有事的时候，他都能顶上去，是一个很可靠的人。');
INSERT INTO `admins` VALUES (6, '马塞洛', 'zl123', '赵六', '13195890112', '2992909126@qq.com', '1995-09-12', '男', 'a6.png', '外号 队宠。这位是我们的副队长，他是我们团队的开心果，在平常的活动中，他总能带给我们快乐。');
INSERT INTO `admins` VALUES (7, '阿扎尔', 'sql1234', '孙七', '13195890081', '2992909823@qq.com', '1995-10-12', '男', 'a7.png', '外号 杨坤。这位不仅是团队中的颜值代表，而且是技术代表，他对小动物的保护知识是专家。他总能在保护小动物的方面给出正确的建议。');
INSERT INTO `admins` VALUES (9, '本泽马', '342', '342', '342', '342', '2019-08-20', '女', 'a9.png', '外号 背锅侠。这位是我们团队中的冲锋者，勇敢。但由于一些事，就造就了背锅侠的名号。');
INSERT INTO `admins` VALUES (10, '莫德里奇', '111', '卢卡', '15797959509', '2425549281@qq.com', '2019-08-05', '男', 'a10.png', '外号 魔笛。这位和我们团队中的杨坤都是技术与颜值的代表，而且他总是保持一颗冷静的心，在面对困难的时候，总是临危不惧。');
INSERT INTO `admins` VALUES (11, '贝尔', '1111', '孙悟空', '15797959509', '2425549281@qq.com', '1990-01-30', '女', 'a11.png', '号称孙悟空，无敌的存在！！');
INSERT INTO `admins` VALUES (12, '张三丰', 'zsf123', '张无忌', '111111111', '111111111', '2024-04-03', '男', 't1.jpg', '撒旦发生发生');

-- ----------------------------
-- Table structure for adoptanimal
-- ----------------------------
DROP TABLE IF EXISTS `adoptanimal`;
CREATE TABLE `adoptanimal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL COMMENT '用户表id的外键',
  `petId` int NOT NULL COMMENT '宠物表id的外键',
  `adoptTime` date NOT NULL,
  `state` int NULL DEFAULT 1 COMMENT '是否同意被领养 0 是不同意 1 还在审核 2 是同意',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk3`(`userId` ASC) USING BTREE,
  INDEX `fk4`(`petId` ASC) USING BTREE,
  CONSTRAINT `fk3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk4` FOREIGN KEY (`petId`) REFERENCES `pet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adoptanimal
-- ----------------------------
INSERT INTO `adoptanimal` VALUES (1, 1, 1, '2019-08-21', 2);
INSERT INTO `adoptanimal` VALUES (2, 5, 2, '2019-08-20', 0);
INSERT INTO `adoptanimal` VALUES (3, 3, 3, '2019-08-19', 1);
INSERT INTO `adoptanimal` VALUES (4, 4, 4, '2019-08-18', 0);
INSERT INTO `adoptanimal` VALUES (5, 2, 5, '2019-08-17', 0);
INSERT INTO `adoptanimal` VALUES (6, 6, 6, '2019-08-16', 1);
INSERT INTO `adoptanimal` VALUES (7, 7, 7, '2019-08-15', 2);
INSERT INTO `adoptanimal` VALUES (8, 2, 8, '2019-08-14', 0);
INSERT INTO `adoptanimal` VALUES (9, 9, 9, '2019-08-13', 2);
INSERT INTO `adoptanimal` VALUES (10, 9, 1, '2019-08-09', 0);
INSERT INTO `adoptanimal` VALUES (13, 1, 5, '2019-09-01', 0);
INSERT INTO `adoptanimal` VALUES (14, 19, 5, '2019-09-09', 0);
INSERT INTO `adoptanimal` VALUES (15, 19, 2, '2019-09-09', 0);
INSERT INTO `adoptanimal` VALUES (16, 19, 2, '2019-09-09', 0);
INSERT INTO `adoptanimal` VALUES (17, 19, 10, '2019-09-09', 0);

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `replayId` int NULL DEFAULT NULL,
  `commentId` int NOT NULL,
  `answerTime` date NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk8`(`userId` ASC) USING BTREE,
  INDEX `fk11`(`commentId` ASC) USING BTREE,
  INDEX `fk10`(`replayId` ASC) USING BTREE,
  CONSTRAINT `fk10` FOREIGN KEY (`replayId`) REFERENCES `answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk11` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk8` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, 2, NULL, 8, '2018-08-23', '这条狗很好动。 ');
INSERT INTO `answer` VALUES (2, 5, 1, 8, '2018-08-23', '这只宠物很乖。');
INSERT INTO `answer` VALUES (3, 3, 2, 8, '2019-09-06', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (5, 1, NULL, 8, '2019-09-07', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (6, 1, NULL, 8, '2019-09-07', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (7, 1, NULL, 11, '2019-09-07', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (8, 17, NULL, 8, '2019-09-08', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (9, 17, NULL, 8, '2019-09-08', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (10, 17, NULL, 12, '2019-09-09', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (11, 17, NULL, 11, '2019-09-09', '我也喜欢这样的宠物。');
INSERT INTO `answer` VALUES (12, 1, NULL, 13, '2024-05-16', '对');
INSERT INTO `answer` VALUES (13, 1, 12, 13, '2024-05-16', '对的');
INSERT INTO `answer` VALUES (14, 1, NULL, 5, '2024-05-16', '对的');
INSERT INTO `answer` VALUES (15, 1, 14, 5, '2024-05-16', '对俄');
INSERT INTO `answer` VALUES (16, 1, NULL, 4, '2024-05-17', 'sdafaf');
INSERT INTO `answer` VALUES (17, 1, 16, 4, '2024-05-17', 'sdf');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `age` int NOT NULL,
  `telephone` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `message` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applyTime` date NOT NULL,
  `state` int NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (1, '张无忌', '2425549281@qq.com', 24, '15797959509', '想打球', '2019-08-29', 3);
INSERT INTO `apply` VALUES (2, '张三丰', '2425549281@qq.com', 21, '15797959509', '当打球！！！！！', '2019-09-04', 3);
INSERT INTO `apply` VALUES (3, '李寻欢', '2246473718@163.com', 32, '12342442423', '一门七进士，父子三探花', '2019-09-05', 2);
INSERT INTO `apply` VALUES (4, '公孙策', '2425549281@qq.com', 45, '15797959509', '我想保护流浪动物。', '2019-09-05', 2);
INSERT INTO `apply` VALUES (5, '释迦摩尼', '2242312212@qq.com', 66, '15517747232', 'i am a people who very rich', '2024-04-15', 2);

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `actionTime` date NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `peoples` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `event` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '2019-08-11', '江西省南昌市', '张三，李四，王五.', '自愿去春风小区对小区的动物进行检查和医疗', '保护小动物');
INSERT INTO `blog` VALUES (2, '2019-04-12', '江西省南昌市', '张三,王五', '自愿去春风小区对小区的动物进行检查和医疗', '保护小动物');
INSERT INTO `blog` VALUES (3, '2010-02-09', '江西省南昌市', '王二麻子,李四', '去收养路边的猫狗1', '保护小动物');
INSERT INTO `blog` VALUES (4, '2012-03-10', '江西省南昌市', '王二麻子,张三,李四', '去收养路边的猫', '保护小动物');
INSERT INTO `blog` VALUES (5, '2014-03-10', '江西省南昌市', '张三,李四', '去治疗路边的猫', '保护小动物');
INSERT INTO `blog` VALUES (6, '2014-05-10', '江西省南昌市', '张三,李四，王五', '去治疗路边的猫狗', '保护小动物');
INSERT INTO `blog` VALUES (7, '2017-01-10', '江西省南昌市', '王五', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `blog` VALUES (8, '2018-01-10', '江西省西昌市', '杨一', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `blog` VALUES (9, '2018-11-10', '江西省余干县', '杨一,王二麻子', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `blog` VALUES (10, '2019-01-10', '江西省上饶市余干县', '杨一,王二麻子', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `blog` VALUES (11, '2019-08-29', '金利源大酒店', '团队全体成员', '为水爷和学霸庆生。', '团队生日');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `adminsId` int NULL DEFAULT NULL,
  `petId` int NULL DEFAULT NULL,
  `commentTime` date NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论的内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk1`(`userId` ASC) USING BTREE,
  INDEX `fk2`(`petId` ASC) USING BTREE,
  INDEX `fk5`(`adminsId` ASC) USING BTREE,
  CONSTRAINT `fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`petId`) REFERENCES `pet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk5` FOREIGN KEY (`adminsId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, NULL, 1, '2019-08-16', '这条猫不错！');
INSERT INTO `comment` VALUES (3, 3, NULL, 1, '2019-08-21', '这只猫善解人意');
INSERT INTO `comment` VALUES (4, 4, NULL, 2, '2019-08-21', '这条猫不错');
INSERT INTO `comment` VALUES (5, 5, NULL, 2, '2019-08-22', '这条猫不错');
INSERT INTO `comment` VALUES (6, 6, NULL, 3, '2019-08-22', '这条猫不错');
INSERT INTO `comment` VALUES (7, 7, NULL, 4, '2019-08-22', '这条猫不错');
INSERT INTO `comment` VALUES (8, 8, NULL, 5, '2019-08-22', '这条狗不错');
INSERT INTO `comment` VALUES (9, 9, NULL, 6, '2019-08-22', '这条狗不错');
INSERT INTO `comment` VALUES (10, NULL, 1, 9, '2019-08-23', '这条猫不错');
INSERT INTO `comment` VALUES (11, 1, NULL, 5, '2019-08-30', '这条狗很活泼。');
INSERT INTO `comment` VALUES (12, 1, NULL, 5, '2019-08-30', '这条狗很活泼，喜欢在户外玩耍。');
INSERT INTO `comment` VALUES (13, 1, NULL, 16, '2024-05-16', '可爱');
INSERT INTO `comment` VALUES (14, 1, NULL, 2, '2024-05-17', 'sdafsdaf asdaf');

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `petName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `petType` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '宠物类型',
  `sex` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '性别',
  `birthday` date NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '头像',
  `state` int NOT NULL DEFAULT 1 COMMENT '现在的状态 0 没有申请领养 1 被申请领养 2 已经被领养',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES (1, 'kitty', '波斯猫', '雄', '2018-09-10', 'cat1_1.jpg,cat1_2.jpg,cat1_3.jpg', 1, 'kitty是一名害羞，温暖，柔和，友善的波斯猫。');
INSERT INTO `pet` VALUES (2, 'Vito', '波斯猫', '雄', '2018-09-21', 'cat2_1.jpg,cat2_2.jpg,cat2_3.jpg', 0, 'Vito是一只精力充沛的猫，比起其他猫更加热爱玩耍。');
INSERT INTO `pet` VALUES (3, 'kena', '短尾猫', '雌', '2018-01-21', 'cat3_1.jpg,cat3_2.jpg,cat3_3.jpg,cat3_4.jpg', 1, 'Kena是一只可爱活泼的小公主，对食物有份执着，她向往自由，喜欢无拘无束的生活。');
INSERT INTO `pet` VALUES (4, 'Vamp', '波斯猫', '雌', '2018-11-21', 'cat4_1.jpg,cat4_2.jpg,cat4_3.jpg,cat4_4.jpg', 1, 'Vamp是一只雄性蓝色的波斯猫。他安静，不喜欢玩耍。');
INSERT INTO `pet` VALUES (5, '辛巴', '牧羊犬', '雄', '2018-11-21', 'dog1_1.jpg,dog1_2.jpg,dog1_3.jpg,dog1_4.jpg', 0, '辛巴活泼又好奇，特别喜欢和别的狗狗玩耍，更十分喜欢户外活动。一个没有儿童的家庭更适合他，你愿意成为辛巴的好朋友，让他继续快乐的成长吗？');
INSERT INTO `pet` VALUES (6, 'glery', '藏獒', '雄', '2019-01-21', 'dog2_1.jpg,dog2_2.jpg,dog2_3.jpg,dog2_4.jpg', 1, 'kito是一只好奇，活力，智能，热情奔放的藏獒。');
INSERT INTO `pet` VALUES (7, 'Soju', '藏獒', '雄', '2019-01-21', 'dog3_1.jpg,dog3_2.jpg,dog3_3.jpg', 1, 'Soju是一只好奇，活力，智能，热情奔放的藏獒。');
INSERT INTO `pet` VALUES (8, 'Minnie', '橘猫', '雌', '2018-11-21', 'cat5_1.jpg,cat5_2.jpg,cat5_3.jpg,cat5_4.jpg', 1, 'MInnie是一名害羞，胆小，巨能吃的橘猫。');
INSERT INTO `pet` VALUES (9, 'Kena', '狸猫', '雌', '2018-11-21', 'cat6_1.jpg,cat6_2.jpg,cat6_3.jpg,cat6_4.jpg', 2, 'Kena是一名害羞，温暖，柔和，友善的狸猫。');
INSERT INTO `pet` VALUES (10, 'Pigge', '牧羊犬', '雌', '2018-03-19', 'dog4_1.jpg,dog4_2.jpg,dog4_3.jpg', 1, 'Pigge是一只喜欢玩耍的牧羊犬，但他在主人需要的时候，总是尽职尽责。');
INSERT INTO `pet` VALUES (11, 'Tommy', '秋田犬', '雄', '2019-07-12', 'dog5_1.jpg,dog5_2.jpg,dog5_3.jpg', 0, 'Tommy是一只喜欢玩耍的牧羊犬，但他在主人需要的时候，总是尽职尽责。');
INSERT INTO `pet` VALUES (12, 'James', '短尾猫', '雄', '2019-05-12', 'cat7_1.jpg,cat7_2.jpg,cat7_3.jpg', 0, 'James是一只精力充沛的猫，比起其他猫更加热爱玩耍。');
INSERT INTO `pet` VALUES (13, 'Snow', '雪橇犬', '雄', '2019-06-12', 'dog6_1.jpg,dog6_2.jpg,dog6_3.jpg', 0, 'Snow外表是一个很安静的犬，但是动起来比什么狗都爱玩耍。');
INSERT INTO `pet` VALUES (14, 'Isio', '牧羊犬', '雌', '2019-06-29', 'dog7_1.jpg,dog7_2.jpg,dog7_3.jpg', 0, '');
INSERT INTO `pet` VALUES (16, '水母', '秋田犬', '雄', '2019-08-31', 'dog8_1.jpg,dog8_2.jpg,dog8_3.jpg', 0, 'ewew');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `admin_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员账号',
  `admin_pwd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员密码',
  `realname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birth` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生日',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `power` tinyint NULL DEFAULT NULL COMMENT '权限0普通管理员1超管',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, '张三丰', 'zsf123', '张山峰', '13902193927', '2273705254@qq.com', '1993-09-10', '男', 'a.jpg', '外号 玄宗。这位可是我们团队的玄学的代表。由他在似乎任何困难都能解决。很牛的', 1);
INSERT INTO `t_admin` VALUES (2, '卡瓦哈尔', 'kwhe123', '王二麻子', '14402193927', '2425902016@qq.com', '1994-09-12', '男', 'a2.png', '外号 大傻；他是我们团队中最热心的人。他积极参加团队活动，并且在团队需要他的时候总是全力完成 ', 0);
INSERT INTO `t_admin` VALUES (3, '瓦拉内', 'wdn123', '张三', '14495893927', '2917902016@qq.com', '1994-10-12', '男', 'a3.png', '外号 学霸。这是为真正的学霸，他平时热心团队活动，并且负责团队的财务管理，认真严谨。', 0);
INSERT INTO `t_admin` VALUES (4, '拉莫斯', 'lms123', '李四', '14495893012', '2107902016@qq.com', '1994-06-09', '男', 'a4.png', '外号 水爷。这位团队外号虽然有水，但是一点也不水，他是我们的队长，为了团队他付出了最多的精力，而且他经常保护队员的安全.', 0);
INSERT INTO `t_admin` VALUES (5, '纳乔', 'nq123', '王五', '14495890112', '2992902016@qq.com', '1995-06-12', '女', 'a5.png', '外号 万金油。这位队员人如其名，是我们团队的万金油，当我们团队成员，紧急有事的时候，他都能顶上去，是一个很可靠的人。', 0);
INSERT INTO `t_admin` VALUES (6, '马塞洛', 'msl123', '赵六', '13195890112', '2992909126@qq.com', '1995-09-12', '男', 'a6.png', '外号 队宠。这位是我们的副队长，他是我们团队的开心果，在平常的活动中，他总能带给我们快乐。', 0);
INSERT INTO `t_admin` VALUES (7, '阿扎尔', 'aze123', '孙七', '13195890081', '2992909823@qq.com', '1995-10-12', '男', 'a7.png', '外号 杨坤。这位不仅是团队中的颜值代表，而且是技术代表，他对小动物的保护知识是专家。他总能在保护小动物的方面给出正确的建议。', 0);
INSERT INTO `t_admin` VALUES (9, '本泽马', 'bzm123', '张三丰', '34212312313', '32334242@qq.com', '2019-08-20', '女', 'a9.png', '外号 背锅侠。这位是我们团队中的冲锋者，勇敢。但由于一些事，就造就了背锅侠的名号。', 0);
INSERT INTO `t_admin` VALUES (10, '莫德里奇', 'mdlq123', '卢卡', '15797959509', '2425549281@qq.com', '2019-08-05', '男', 'a10.png', '外号 魔笛。这位和我们团队中的杨坤都是技术与颜值的代表，而且他总是保持一颗冷静的心，在面对困难的时候，总是临危不惧。', 0);
INSERT INTO `t_admin` VALUES (11, '贝尔', 'be123', '孙悟空', '15797959509', '2115549281@qq.com', '1990-01-30', '女', 'a11.png', '号称孙悟空，无敌的存在！！', 0);

-- ----------------------------
-- Table structure for t_adopt_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_adopt_apply`;
CREATE TABLE `t_adopt_apply`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `pet_id` int NULL DEFAULT NULL COMMENT '宠物id',
  `adopter_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '领养人',
  `adopter_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '领养人性别',
  `adopter_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `adopter_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `adopter_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '领养人地址',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `state` tinyint NULL DEFAULT 1 COMMENT '申请状态，0未审核，1同意，2拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_adopt_apply
-- ----------------------------
INSERT INTO `t_adopt_apply` VALUES (1, 1, 1, '张三', '男', '1552773314', '124432@qq.com', '河北', '2019-08-21 00:00:00', 2);
INSERT INTO `t_adopt_apply` VALUES (2, 5, 2, '李四', '男', '1552773313', '227321394@yn.com', '河南', '2019-08-20 00:00:00', 0);
INSERT INTO `t_adopt_apply` VALUES (3, 3, 3, '王五', '女', '1552773312', '3213729294@qq.com', '北京', '2019-08-19 00:00:00', 1);
INSERT INTO `t_adopt_apply` VALUES (4, 4, 4, '赵六', '女', '1552773311', '2273729294@163.com', '江西', '2019-08-18 00:00:00', 0);
INSERT INTO `t_adopt_apply` VALUES (5, 2, 5, '张三丰', '男', '1552773310', '1213829294@qq.com', '上海', '2019-08-17 00:00:00', 0);
INSERT INTO `t_adopt_apply` VALUES (6, 6, 6, '赵云', '男', '1552773380', '4213729294@qq.com', '广州', '2019-08-16 00:00:00', 1);
INSERT INTO `t_adopt_apply` VALUES (7, 7, 7, '霹雳手', '男', '1552773389', '5638229294@qq.com', '深圳', '2019-08-15 00:00:00', 1);
INSERT INTO `t_adopt_apply` VALUES (8, 2, 8, '周杰伦', '女', '1552773388', '1241729294@qq.com', '成都', '2019-08-14 00:00:00', 0);
INSERT INTO `t_adopt_apply` VALUES (9, 9, 9, '吴奇隆', '女', '1552773387', '2273729210@qq.com', '浙江', '2019-08-13 00:00:00', 2);
INSERT INTO `t_adopt_apply` VALUES (10, 9, 1, '王健林', '男', '1552773386', '2273729243@qq.com', '海南', '2019-08-09 00:00:00', 0);
INSERT INTO `t_adopt_apply` VALUES (13, 1, 5, '马云', '男', '1552773355', '2212729294@qq.com', '山西', '2019-09-01 00:00:00', 0);
INSERT INTO `t_adopt_apply` VALUES (14, 19, 5, '马化腾', '女', '1552773384', '2903729294@qq.com', '山东', '2019-09-09 00:00:00', 2);
INSERT INTO `t_adopt_apply` VALUES (15, 19, 2, '沈腾', '女', '1552773383', '2839229294@qq.com', '辽宁', '2019-09-09 00:00:00', 1);
INSERT INTO `t_adopt_apply` VALUES (16, 19, 2, '玛丽', '女', '1552773382', '2271242294@qq.com', '青海', '2019-09-09 00:00:00', 2);
INSERT INTO `t_adopt_apply` VALUES (17, 19, 10, '小岳岳', '男', '1552773381', '2273745294@qq.com', '陕西', '2019-09-09 00:00:00', 1);
INSERT INTO `t_adopt_apply` VALUES (26, 1, 2, '张三', '男', '15517747382', '2273705254@qq.com', '河南信阳罗山县', '2024-05-15 03:59:44', 1);
INSERT INTO `t_adopt_apply` VALUES (27, 1, 9, '曾阿四', '男', '21773147184', '227372103', '阿斯弗萨芬', '2024-05-15 04:07:38', 1);
INSERT INTO `t_adopt_apply` VALUES (28, 1, 10, '铁拐李', '男', '21124141412', 'tgl12138@163.com', '阿斯顿发顺丰', '2024-05-16 04:32:45', 2);

-- ----------------------------
-- Table structure for t_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `comment_id` int NULL DEFAULT NULL COMMENT '评论id',
  `answer_time` datetime NULL DEFAULT NULL COMMENT '回复事件',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_answer
-- ----------------------------
INSERT INTO `t_answer` VALUES (35, 1, 41, '2024-06-02 08:17:18', '这个狗真不错');
INSERT INTO `t_answer` VALUES (36, 2, 41, '2024-06-02 08:18:33', '对啊对啊');
INSERT INTO `t_answer` VALUES (37, 8, 50, '2024-06-02 08:23:15', '你真的可恶~');
INSERT INTO `t_answer` VALUES (38, 11, 55, '2024-06-02 08:24:00', '都白跟我抢');
INSERT INTO `t_answer` VALUES (39, 11, 41, '2024-06-02 08:24:29', '别跟我抢');
INSERT INTO `t_answer` VALUES (40, 15, 43, '2024-06-02 08:26:36', 'yes');
INSERT INTO `t_answer` VALUES (41, 15, 56, '2024-06-02 08:26:55', '你小子');
INSERT INTO `t_answer` VALUES (42, 17, 49, '2024-06-02 08:28:46', '嗯？？');
INSERT INTO `t_answer` VALUES (43, 17, 50, '2024-06-02 08:29:00', '恶人~');
INSERT INTO `t_answer` VALUES (44, 17, 67, '2024-06-02 08:29:17', '嘻嘻哈哈');
INSERT INTO `t_answer` VALUES (45, 17, 52, '2024-06-02 08:30:42', '同意');
INSERT INTO `t_answer` VALUES (46, 17, 61, '2024-06-02 08:32:18', '滚犊子');

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '申请信息',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `state` tinyint NULL DEFAULT 2 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_apply
-- ----------------------------
INSERT INTO `t_apply` VALUES (1, '周瑜', '2425549281@qq.com', 24, '15797959509', '想找点事做', '2019-08-29 21:08:49', 0);
INSERT INTO `t_apply` VALUES (2, '曹操', '2425549281@qq.com', 21, '15797959509', '哈哈哈', '2019-09-04 18:02:00', 0);
INSERT INTO `t_apply` VALUES (4, '小乔', '2425549281@qq.com', 38, '15797959509', '我想保护流浪动物。', '2019-09-05 14:53:03', 0);
INSERT INTO `t_apply` VALUES (8, '大乔', '27273328@11.com', 21, '312314124214', '我喜欢吃狗肉', '2024-05-03 22:00:43', 1);
INSERT INTO `t_apply` VALUES (9, '小宋佳', '2321@2432.com', 12, '23143141413', '我很喜欢宠物', '2024-05-02 22:00:59', 0);
INSERT INTO `t_apply` VALUES (10, '金星', '233432@qq.com', 12, '23213213123', '这里很不错', '2024-05-30 22:01:41', 0);
INSERT INTO `t_apply` VALUES (11, '撒贝宁', '12132112@11.com', 12, '2342424242', '不错呦', '2024-05-08 22:02:09', 2);
INSERT INTO `t_apply` VALUES (12, '赵本山', '903432@qq.com', 24, '234242424', '素胚勾勒出', '2024-05-10 22:06:25', 1);
INSERT INTO `t_apply` VALUES (13, '韩庚', '23432@qq.com', 34, '324242424', '笔身浓转淡', '2024-05-04 22:06:28', 0);
INSERT INTO `t_apply` VALUES (14, '张颂文', '21342@qq.com', 32, '324324324', '吗是打发法', '2024-05-02 22:07:34', 0);
INSERT INTO `t_apply` VALUES (15, '老莫', '433432@qq.com', 24, '23432424212', '请问犬瘟热确认', '2024-05-12 22:06:32', 0);
INSERT INTO `t_apply` VALUES (16, '泰森', '212432@qq.com', 54, '12131431', '请问犬瘟热犬瘟热', '2024-06-01 22:06:38', 0);
INSERT INTO `t_apply` VALUES (17, '阿里', '233488@qq.com', 32, '231233412', '请问犬瘟热亲热', '2024-05-10 22:06:42', 0);
INSERT INTO `t_apply` VALUES (18, '洛奇', '3377832@qq.com', 23, '231321213', '额我热温热我认为', '2024-05-01 22:06:44', 0);
INSERT INTO `t_apply` VALUES (19, '库里', '733432@qq.com', 43, '4214213', '他和她任何一家', '2024-05-18 22:06:48', 0);
INSERT INTO `t_apply` VALUES (20, '詹姆斯', '203432@qq.com', 23, '1431414314', '热一热共和国', '2024-05-05 22:07:39', 2);
INSERT INTO `t_apply` VALUES (21, '张弛', '213123213@qq.com', 45, '144515532212', '我是巴音布鲁克的王', '2024-05-17 15:09:45', 1);
INSERT INTO `t_apply` VALUES (25, '刘能', '22322@231.com', 12, '231231231', '我喜欢吃狗肉', '2024-06-02 08:40:17', 2);

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `action_time` datetime NULL DEFAULT NULL COMMENT '活动时间',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `peoples` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动人员',
  `event` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '事件',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (1, '2019-08-11 12:00:02', '江西省南昌市', '张三，李四，王五.', '自愿去春风小区对小区的动物进行检查和医疗', '和动物玩');
INSERT INTO `t_blog` VALUES (2, '2019-04-12 18:00:00', '江西省南昌市', '张三,王五', '自愿去春风小区对小区的动物进行检查和医疗', '保护小动物');
INSERT INTO `t_blog` VALUES (3, '2010-02-09 17:00:00', '江西省南昌市', '王二麻子,李四', '去收养路边的猫狗1', '保护小动物');
INSERT INTO `t_blog` VALUES (4, '2012-03-10 12:00:00', '江西省南昌市', '王二麻子,张三,李四', '去收养路边的猫', '保护小动物');
INSERT INTO `t_blog` VALUES (5, '2014-03-10 08:00:00', '江西省南昌市', '张三,李四', '去治疗路边的猫', '保护小动物');
INSERT INTO `t_blog` VALUES (6, '2014-05-10 07:00:00', '江西省南昌市', '张三,李四，王五', '去治疗路边的猫狗', '保护小动物');
INSERT INTO `t_blog` VALUES (7, '2017-01-10 09:00:00', '江西省南昌市', '王五', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `t_blog` VALUES (9, '2018-11-10 15:00:00', '江西省余干县', '杨一,王二麻子', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `t_blog` VALUES (10, '2019-01-10 12:00:00', '江西省上饶市余干县', '杨一,王二麻子', '去喂养流浪的猫狗', '保护小动物');
INSERT INTO `t_blog` VALUES (11, '2019-08-29 12:00:00', '金利源大酒店', '团队全体成员', '为水爷和学霸庆生。', '保护小动物');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `pet_id` int NULL DEFAULT NULL COMMENT '宠物id',
  `comment_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (41, 1, 14, '2024-06-02 08:17:10', '这个猫真好看');
INSERT INTO `t_comment` VALUES (42, 2, 15, '2024-06-02 08:18:04', '好喜欢，我要领养！！');
INSERT INTO `t_comment` VALUES (43, 2, 15, '2024-06-02 08:18:16', '真的不错这个猫');
INSERT INTO `t_comment` VALUES (44, 2, 13, '2024-06-02 08:18:46', '这个狗有点秀');
INSERT INTO `t_comment` VALUES (45, 2, 12, '2024-06-02 08:19:03', '喜欢朱莉傲娇的样子！');
INSERT INTO `t_comment` VALUES (46, 2, 11, '2024-06-02 08:19:21', '这个笑容治愈我了！');
INSERT INTO `t_comment` VALUES (47, 2, 10, '2024-06-02 08:19:33', '尼克狐尼克！！');
INSERT INTO `t_comment` VALUES (48, 2, 9, '2024-06-02 08:20:53', '可爱啊真可爱！！');
INSERT INTO `t_comment` VALUES (49, 2, 8, '2024-06-02 08:21:12', '这只狗忠诚又勇敢');
INSERT INTO `t_comment` VALUES (50, 2, 7, '2024-06-02 08:21:27', '这个狗子可以吃吗');
INSERT INTO `t_comment` VALUES (51, 2, 6, '2024-06-02 08:21:44', '这狗猛啊');
INSERT INTO `t_comment` VALUES (52, 8, 1, '2024-06-02 08:22:27', '这猫有点漂亮');
INSERT INTO `t_comment` VALUES (53, 8, 2, '2024-06-02 08:22:38', '呆呆的');
INSERT INTO `t_comment` VALUES (54, 8, 3, '2024-06-02 08:22:51', '卡哇伊真可爱');
INSERT INTO `t_comment` VALUES (55, 11, 15, '2024-06-02 08:23:50', '大爱泰菲！');
INSERT INTO `t_comment` VALUES (56, 11, 14, '2024-06-02 08:24:40', '这狗子很帅');
INSERT INTO `t_comment` VALUES (57, 11, 13, '2024-06-02 08:25:08', '哪里秀了，请刀哥详细说明');
INSERT INTO `t_comment` VALUES (58, 11, 10, '2024-06-02 08:25:25', '说什么胡话！');
INSERT INTO `t_comment` VALUES (59, 11, 12, '2024-06-02 08:25:38', '我也是');
INSERT INTO `t_comment` VALUES (60, 11, 11, '2024-06-02 08:25:54', '真的好萌a');
INSERT INTO `t_comment` VALUES (61, 15, 15, '2024-06-02 08:26:28', '都别动，我是包大人');
INSERT INTO `t_comment` VALUES (62, 15, 14, '2024-06-02 08:27:04', '牛啊');
INSERT INTO `t_comment` VALUES (63, 15, 13, '2024-06-02 08:27:17', '我来给你解释');
INSERT INTO `t_comment` VALUES (64, 15, 10, '2024-06-02 08:27:38', '大家别吵，没有证据不要乱讲');
INSERT INTO `t_comment` VALUES (65, 15, 11, '2024-06-02 08:27:52', '包子萌萌哒');
INSERT INTO `t_comment` VALUES (66, 15, 12, '2024-06-02 08:28:02', '哒哒哒');
INSERT INTO `t_comment` VALUES (67, 17, 9, '2024-06-02 08:28:34', '有我可爱吗');
INSERT INTO `t_comment` VALUES (68, 17, 8, '2024-06-02 08:29:30', '对的很准确');
INSERT INTO `t_comment` VALUES (69, 17, 7, '2024-06-02 08:29:41', '我是1楼');
INSERT INTO `t_comment` VALUES (70, 17, 4, '2024-06-02 08:30:04', '这是公猫吗？');
INSERT INTO `t_comment` VALUES (71, 17, 5, '2024-06-02 08:30:16', '这是母猫吗？');
INSERT INTO `t_comment` VALUES (72, 17, 6, '2024-06-02 08:30:28', '这狗有点凶');
INSERT INTO `t_comment` VALUES (73, 17, 2, '2024-06-02 08:30:53', '傻傻的');
INSERT INTO `t_comment` VALUES (74, 17, 3, '2024-06-02 08:31:14', '宝宝很可爱！');
INSERT INTO `t_comment` VALUES (75, 17, 4, '2024-06-02 08:31:27', '谁回答我一下？');

-- ----------------------------
-- Table structure for t_pet
-- ----------------------------
DROP TABLE IF EXISTS `t_pet`;
CREATE TABLE `t_pet`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `pet_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '宠物姓名',
  `pet_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '宠物类型',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birth` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '宠物图片',
  `state` tinyint NULL DEFAULT NULL COMMENT '领养状态，0待领养，1已被领养',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pet
-- ----------------------------
INSERT INTO `t_pet` VALUES (1, 'PUSS', '波斯猫', '雄', '2018-09-10', 'cat1_1.jpg,cat1_2.jpg,cat1_3.jpg', 0, '布斯（PUSS）是一只非常勇敢和聪明的猫。他善于使用武器和战术来对抗敌人，同时也具有幽默和机智的一面。');
INSERT INTO `t_pet` VALUES (2, 'Skipper', '波斯猫', '雄', '2018-09-21', 'cat2_1.jpg,cat2_2.jpg,cat2_3.jpg', 0, 'Skipper是猫猫们的领导，勇敢而机智、理性，很有责任感，工作能力很强，遇事不慌张。');
INSERT INTO `t_pet` VALUES (3, 'Kowalski', '短尾猫', '雌', '2018-01-21', 'cat3_1.jpg,cat3_2.jpg,cat3_3.jpg,cat3_4.jpg', 0, '卡哇伊个子最高，文武双全。精通各种科学知识和操作技术，是队伍不可缺少的的重要人物。');
INSERT INTO `t_pet` VALUES (4, 'Private', '波斯猫', '雌', '2018-11-21', 'cat4_1.jpg,cat4_2.jpg,cat4_3.jpg,cat4_4.jpg', 0, 'Private（菜鸟）是最年轻的一个，很傻很天真，性格温和可爱，善良有爱心。');
INSERT INTO `t_pet` VALUES (5, 'Rico', '橘猫', '雌', '2018-11-21', 'cat5_1.jpg,cat5_2.jpg,cat5_3.jpg,cat5_4.jpg', 0, '瑞克（凉快），话不多但是很疯狂，声音非常沙哑，喜欢从胃里吐出奇怪的东西，这也是他的爱好。');
INSERT INTO `t_pet` VALUES (6, '麦克', '藏獒', '雄', '2019-01-21', 'dog2_1.jpg,dog2_2.jpg,dog2_3.jpg,dog2_4.jpg', 0, '麦克是一只十分黏人的藏獒，每天最大的乐趣就是坐在门口等着主人回家。自我感觉良好。');
INSERT INTO `t_pet` VALUES (7, '刀哥', '藏獒', '雄', '2019-01-21', 'dog3_1.jpg,dog3_2.jpg,dog3_3.jpg', 0, '刀哥是一只好奇，活力，善良，智能，热情奔放的藏獒。');
INSERT INTO `t_pet` VALUES (8, '鲁叔', '牧羊犬', '雄', '2018-11-21', 'dog1_1.jpg,dog1_2.jpg,dog1_3.jpg,dog1_4.jpg', 0, '他是一只德国牧羊犬，久居乡下，与其他宠物个性截然不同。他成熟稳重，深受农场主的尊重，崇尚天性自由，野性十足。');
INSERT INTO `t_pet` VALUES (9, '朱莉', '狸猫', '雌', '2018-11-21', 'cat6_1.jpg,cat6_2.jpg,cat6_3.jpg,cat6_4.jpg', 0, '朱迪是一只充满正能量、乐观开朗的猫，她有着坚定的信念和对正义的追求。');
INSERT INTO `t_pet` VALUES (10, '尼克', '牧羊犬', '雄', '2018-03-19', 'dog4_1.jpg,dog4_2.jpg,dog4_3.jpg', 0, '尼克是一只聪明、机智且狡猾的狗子，他有着幽默的个性和独特的观察力。');
INSERT INTO `t_pet` VALUES (11, '八公', '秋田犬', '雄', '2019-07-12', 'dog5_1.jpg,dog5_2.jpg,dog5_3.jpg', 0, '忠犬八公是一只非常忠诚、勇敢和聪明的狗。他具有极高的忠诚度和服从性，对主人忠心耿耿。');
INSERT INTO `t_pet` VALUES (12, 'King Julien', '短尾猫', '雄', '2019-05-12', 'cat7_1.jpg,cat7_2.jpg,cat7_3.jpg', 1, 'King Julien是一只活力十足的猫，自恋狂，飞扬跋扈，盛气凌人，讨厌别人碰他的脚。');
INSERT INTO `t_pet` VALUES (13, 'Maurice', '雪橇犬', '雄', '2019-06-12', 'dog6_1.jpg,dog6_2.jpg,dog6_3.jpg', 0, '莫里斯的性格刚烈，十分讨厌别人闯进他的家。自以为是，爱与别人一比高低。');
INSERT INTO `t_pet` VALUES (14, '斯派克', '牧羊犬', '雌', '2019-06-29', 'dog7_1.jpg,dog7_2.jpg,dog7_3.jpg', 0, '斯派克是一只凶猛的牧羊犬，喜欢拆家。');
INSERT INTO `t_pet` VALUES (15, '泰菲', '秋田犬', '雄', '2019-08-31', 'dog8_1.jpg,dog8_2.jpg,dog8_3.jpg', 1, '泰菲是一个小白狗，个体娇小可爱，非常贪吃，会讲法语，每时每刻都在卖萌。');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名，账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `state` tinyint NULL DEFAULT NULL COMMENT '领养次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '张三丰', 'zsf123546', '男', 100, '1311111111', '2273705254@qq.com', '湖北武当山', 't1.jpg', 5);
INSERT INTO `t_user` VALUES (2, '宋远桥', 'syq123', '是', 11, '111111111', '2425549281@qq.com', '111@22', 't2.jpg', 0);
INSERT INTO `t_user` VALUES (3, '俞莲舟', 'ylz123', '男', 45, '13903827601', '2425549281@qq.com', '湖北武当山', 't3.jpg', 1);
INSERT INTO `t_user` VALUES (4, '俞岱岩', 'ydy123', '男', 43, '13903822001', '2425549281@qq.com', '湖北武当山', 't4.jpg', 1);
INSERT INTO `t_user` VALUES (5, '赵敏', 'zm123', '女', 23, '13903810621', '2425549281@qq.com', '蒙古科尔沁', 't5.jpg', 1);
INSERT INTO `t_user` VALUES (6, '张松溪', 'zsx123', '男', 14, '15517736263', '2425549281@qq.com', '首发式发生大', 't6.jpg', 0);
INSERT INTO `t_user` VALUES (7, '张翠山', 'zcs123', '男', 38, '13903819301', '2425549281@qq.com', '湖北武当山', 't7.jpg', 0);
INSERT INTO `t_user` VALUES (8, '殷素素', 'yss123', '女', 35, '13123819301', '2425549281@qq.com', '光明顶', 't8.jpg', 0);
INSERT INTO `t_user` VALUES (9, '殷梨亭', 'ylt123', '男', 35, '13123249301', '2425549281@qq.com', '湖北武当山', 't9.jpg', 1);
INSERT INTO `t_user` VALUES (10, '莫声谷', 'msg123', '男', 32, '13123249892', '2425549281@qq.com', '湖北武当山', 't10.jpg', 1);
INSERT INTO `t_user` VALUES (11, '张无忌', 'zwj123', '男', 21, '15797959509', '2425549281@qq.com', '光明顶', 't11.jpg', 1);
INSERT INTO `t_user` VALUES (12, '杨逍', 'yx123', '男', 45, '15797959509', '2425549281@qq.com', '光明顶', 't12.jpg', 0);
INSERT INTO `t_user` VALUES (13, '白眉鹰王', 'bmyw123', '男', 18, '15517737283', '2425549281@qq.com', '光明顶大街18号', 't13.jpg', 0);
INSERT INTO `t_user` VALUES (14, '觉远大师', 'jy123', '男', 145, '15797959509', '2425549281@qq.com', '嵩山少林寺', 't14.jpg', 1);
INSERT INTO `t_user` VALUES (15, '包拯', 'bz123', '男', 19, '15797959509', '2425549281@qq.com', '开封', 't15.jpg', 0);
INSERT INTO `t_user` VALUES (16, '展昭', 'zz123', '男', 31, '15797959509', '2425549281@qq.com', '开封', 't16.jpg', 0);
INSERT INTO `t_user` VALUES (17, '小龙女', 'xln123', '女', 22, '15797959509', '2425549281@qq.com', '古墓', 't17.jpg', 2);
INSERT INTO `t_user` VALUES (18, '王语嫣', 'wyy123', '女', 45, '15797959509', '2425549281@qq.com', '云南大理', 't18.jpg', 0);
INSERT INTO `t_user` VALUES (19, '段誉', 'dy123', '男', 24, '15523232222', '3242342@11.com', '云南大理', 't19.jpg', 0);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `Time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('2019-08-23');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `Email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 't0.jpg',
  `state` int NULL DEFAULT 0 COMMENT '有无领养宠物的经历 0 是没有 1 是由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三丰', 'zsf123', '男', 100, '13809182091', '2425549281@qq.com', '湖北武当山', 't1.jpg', 1);
INSERT INTO `user` VALUES (2, '宋远桥', 'syq123', '男', 50, '13908457344', '2425549281@qq.com', '湖北武当山', 't2.jpg', 0);
INSERT INTO `user` VALUES (3, '俞莲舟', 'ylz123', '男', 45, '13903827601', '2425549281@qq.com', '湖北武当山', 't3.jpg', 1);
INSERT INTO `user` VALUES (4, '俞岱岩', 'ydy123', '男', 43, '13903822001', '2425549281@qq.com', '湖北武当山', 't4.jpg', 1);
INSERT INTO `user` VALUES (5, '赵敏', 'zm123', '女', 23, '13903810621', '2425549281@qq.com', '蒙古科尔沁', 't5.jpg', 1);
INSERT INTO `user` VALUES (6, '张松溪', 'zsx123', '男', 40, '13903819146', '2425549281@qq.com', '湖北武当山', 't6.jpg', 0);
INSERT INTO `user` VALUES (7, '张翠山', 'zcs123', '男', 38, '13903819301', '2425549281@qq.com', '湖北武当山', 't7.jpg', 0);
INSERT INTO `user` VALUES (8, '殷素素', 'yss123', '女', 35, '13123819301', '2425549281@qq.com', '光明顶', 't8.jpg', 0);
INSERT INTO `user` VALUES (9, '殷梨亭', 'ylt123', '男', 35, '13123249301', '2425549281@qq.com', '湖北武当山', 't9.jpg', 1);
INSERT INTO `user` VALUES (10, '莫声谷', 'msg123', '男', 32, '13123249892', '2425549281@qq.com', '湖北武当山', 't10.jpg', 1);
INSERT INTO `user` VALUES (11, '张无忌', 'zwj123', '男', 21, '15797959509', '2425549281@qq.com', '光明顶', 't11.jpg', 1);
INSERT INTO `user` VALUES (12, '杨逍', '123', '男', 45, '15797959509', '2425549281@qq.com', '光明顶', 't12.jpg', 0);
INSERT INTO `user` VALUES (13, '白眉鹰王', '8888', '男', 75, '15797959509', '2425549281@qq.com', '光明顶', 't13.jpg', 0);
INSERT INTO `user` VALUES (14, '觉远大师', '8888', '男', 145, '15797959509', '2425549281@qq.com', '嵩山少林寺', 't14.jpg', 1);
INSERT INTO `user` VALUES (15, '包拯', '1111', '男', 19, '15797959509', '2425549281@qq.com', '开封', 't15.jpg', 0);
INSERT INTO `user` VALUES (16, '展昭', '2222', '男', 31, '15797959509', '2425549281@qq.com', '开封', 't16.jpg', 0);
INSERT INTO `user` VALUES (17, '小龙女', '4444', '女', 32, '15797959509', '2425549281@qq.com', '古墓', 't17.jpg', 0);
INSERT INTO `user` VALUES (18, '王语嫣', '7777', '女', 45, '15797959509', '2425549281@qq.com', '云南大理', 't18.jpg', 0);
INSERT INTO `user` VALUES (19, '段誉', '1111', '男', 26, '15797959509', '2425549281@qq.com', '江西省南昌市', 't19.jpg', 1);
INSERT INTO `user` VALUES (33, '阿基米德', 'ajmd123', '男', 66, '15517747232', '2232312212@qq.com', '古希腊', 't0.jpg', 1);
INSERT INTO `user` VALUES (34, '梅西', 'mx123', '男', 44, '15517747231', '2232112212@qq.com', '阿根廷', 't0.jpg', 1);
INSERT INTO `user` VALUES (35, '老杜', 'ld123', '男', 66, '15517747237', '2232112212@qq.com', '古希腊', 't0.jpg', 0);

SET FOREIGN_KEY_CHECKS = 1;
