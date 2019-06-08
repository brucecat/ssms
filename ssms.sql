/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.213.218
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 47.101.213.218:3306
 Source Schema         : ssms

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 08/06/2019 11:06:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gradeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid_clazz_FK`(`gradeid`) USING BTREE,
  CONSTRAINT `gradeid_clazz_FK` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES (5, '1班', 2);
INSERT INTO `clazz` VALUES (6, '2班', 2);
INSERT INTO `clazz` VALUES (7, '3班', 2);
INSERT INTO `clazz` VALUES (8, '4班', 2);
INSERT INTO `clazz` VALUES (9, '1班', 3);
INSERT INTO `clazz` VALUES (10, '2班', 3);
INSERT INTO `clazz` VALUES (11, '3班', 3);
INSERT INTO `clazz` VALUES (12, '4班', 3);
INSERT INTO `clazz` VALUES (13, '5班', 3);

-- ----------------------------
-- Table structure for clazz_course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `clazz_course_teacher`;
CREATE TABLE `clazz_course_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clazzid` int(11) NULL DEFAULT NULL,
  `gradeid` int(11) NULL DEFAULT NULL,
  `courseid` int(11) NULL DEFAULT NULL,
  `teacherid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `clazzid_cct_FK`(`clazzid`) USING BTREE,
  INDEX `tid_cct_FK`(`teacherid`) USING BTREE,
  INDEX `courseid_cct_FK`(`courseid`) USING BTREE,
  INDEX `gradeid_cct_FK`(`gradeid`) USING BTREE,
  CONSTRAINT `clazzid_cct_FK` FOREIGN KEY (`clazzid`) REFERENCES `clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacherid_cct_FK` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '语文');
INSERT INTO `course` VALUES (2, '数学');
INSERT INTO `course` VALUES (3, '英语');
INSERT INTO `course` VALUES (4, '物理');
INSERT INTO `course` VALUES (5, '化学');
INSERT INTO `course` VALUES (6, '生物');
INSERT INTO `course` VALUES (7, '历史');
INSERT INTO `course` VALUES (8, '政治');
INSERT INTO `course` VALUES (9, '计算机');
INSERT INTO `course` VALUES (10, '体育');

-- ----------------------------
-- Table structure for escore
-- ----------------------------
DROP TABLE IF EXISTS `escore`;
CREATE TABLE `escore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examid` int(11) NULL DEFAULT NULL,
  `clazzid` int(11) NULL DEFAULT NULL,
  `studentid` int(11) NULL DEFAULT NULL,
  `gradeid` int(11) NULL DEFAULT NULL,
  `courseid` int(11) NULL DEFAULT NULL,
  `score` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eid_escore_FK`(`examid`) USING BTREE,
  INDEX `sid_escore_FK`(`studentid`) USING BTREE,
  INDEX `clazzid_escore_FK`(`clazzid`) USING BTREE,
  INDEX `courseid_escore_FK`(`courseid`) USING BTREE,
  INDEX `gradeid_escore_FK`(`gradeid`) USING BTREE,
  CONSTRAINT `clazzid_escore_FK` FOREIGN KEY (`clazzid`) REFERENCES `clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courseid_escore_FK` FOREIGN KEY (`courseid`) REFERENCES `grade_course` (`courseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `examid_escore_FK` FOREIGN KEY (`examid`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gradeid_escore_FK` FOREIGN KEY (`gradeid`) REFERENCES `grade_course` (`gradeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `studentid_escore_FK` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `type` tinyint(2) NULL DEFAULT 1,
  `gradeid` int(11) NULL DEFAULT NULL,
  `clazzid` int(11) NULL DEFAULT NULL,
  `courseid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid_exam_FK`(`gradeid`) USING BTREE,
  INDEX `clazzid_exam_FK`(`clazzid`) USING BTREE,
  CONSTRAINT `gradeid_exam_FK` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (3, '期末考试', '2019-05-29', '', 1, 4, 0, 0);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (2, '2019级');
INSERT INTO `grade` VALUES (3, '2015级');
INSERT INTO `grade` VALUES (4, '2018级');
INSERT INTO `grade` VALUES (6, '2016级');

-- ----------------------------
-- Table structure for grade_course
-- ----------------------------
DROP TABLE IF EXISTS `grade_course`;
CREATE TABLE `grade_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradeid` int(11) NULL DEFAULT NULL,
  `courseid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid_gc_FK`(`gradeid`) USING BTREE,
  INDEX `cid_gc_FK`(`courseid`) USING BTREE,
  CONSTRAINT `courseid_gc_FK` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gradeid_gc_FK` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade_course
-- ----------------------------
INSERT INTO `grade_course` VALUES (6, 2, 10);
INSERT INTO `grade_course` VALUES (7, 2, 9);
INSERT INTO `grade_course` VALUES (8, 2, 8);
INSERT INTO `grade_course` VALUES (9, 2, 1);
INSERT INTO `grade_course` VALUES (10, 3, 2);
INSERT INTO `grade_course` VALUES (11, 3, 5);
INSERT INTO `grade_course` VALUES (12, 3, 7);
INSERT INTO `grade_course` VALUES (13, 3, 8);
INSERT INTO `grade_course` VALUES (14, 4, 1);
INSERT INTO `grade_course` VALUES (15, 4, 3);
INSERT INTO `grade_course` VALUES (16, 4, 2);
INSERT INTO `grade_course` VALUES (17, 4, 9);
INSERT INTO `grade_course` VALUES (18, 4, 6);
INSERT INTO `grade_course` VALUES (19, 4, 5);
INSERT INTO `grade_course` VALUES (29, 6, 2);
INSERT INTO `grade_course` VALUES (30, 6, 3);
INSERT INTO `grade_course` VALUES (31, 6, 4);
INSERT INTO `grade_course` VALUES (32, 6, 5);
INSERT INTO `grade_course` VALUES (33, 6, 6);
INSERT INTO `grade_course` VALUES (34, 6, 7);
INSERT INTO `grade_course` VALUES (35, 6, 8);
INSERT INTO `grade_course` VALUES (36, 6, 9);
INSERT INTO `grade_course` VALUES (37, 6, 10);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `photo` mediumblob NULL,
  `clazzid` int(11) NULL DEFAULT NULL,
  `gradeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number_student_FK`(`number`) USING BTREE,
  INDEX `cid_stu_FK`(`clazzid`) USING BTREE,
  INDEX `grade_student_FK`(`gradeid`) USING BTREE,
  CONSTRAINT `clazzid_student_FK` FOREIGN KEY (`clazzid`) REFERENCES `clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `grade_student_FK` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (43, '201901001', '日向雏田', '女', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (44, '201901002', '李洛克', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (45, '201901003', '日向花火', '女', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (46, '201901004', '奈良鹿丸', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (47, '201901005', '日向宁次', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (48, '201901006', '佐井', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (49, '201901007', '山中井野', '女', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (50, '201901008', '秋道丁次', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (51, '201901009', '犬冢牙', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (52, '201901010', '野原琳', '女', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (53, '201901011', '天天', '女', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (54, '201901012', '木叶丸', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (55, '201901013', '赤丸', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (56, '201901014', '漩涡鸣人', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (57, '201901015', '佐助', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (58, '201901016', '春野樱', '女', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (59, '201901017', '油女志乃', '男', NULL, NULL, NULL, 5, 2);
INSERT INTO `student` VALUES (60, '201902001', '宇智波带土', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (61, '201902002', '长门', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (62, '201902003', '绝', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (63, '201902004', '角都', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (64, '201902005', '迪达拉', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (65, '201902006', '小南', '女', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (66, '201902007', '大蛇丸', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (67, '201902008', '飞段', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (68, '201902009', '蝎', '男', '', '', NULL, 6, 2);
INSERT INTO `student` VALUES (69, '201902010', '弥彦', '男', NULL, NULL, NULL, 6, 2);
INSERT INTO `student` VALUES (70, '201902011', '千柿鬼鲛', '男', NULL, NULL, NULL, 6, 2);

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system`  (
  `id` int(11) NOT NULL,
  `schoolName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `forbidTeacher` tinyint(2) NULL DEFAULT NULL,
  `forbidStudent` tinyint(2) NULL DEFAULT NULL,
  `noticeTeacher` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `noticeStudent` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES (1, 'School', 0, 0, '教师通知', '学生通知');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `photo` mediumblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number_teacher_FK`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '2001', '卡卡西', '男', '12345678910', '12345610', NULL);
INSERT INTO `teacher` VALUES (2, '2002', '卡普', '男', '12345678911', '12345611', NULL);
INSERT INTO `teacher` VALUES (3, '2003', '战国', '男', '12345678912', '12345612', NULL);
INSERT INTO `teacher` VALUES (4, '2004', '青雉', '男', '12345678913', '12345613', NULL);
INSERT INTO `teacher` VALUES (5, '2005', '爱德华纽盖特', '男', '12345678914', '12345614', NULL);
INSERT INTO `teacher` VALUES (6, '2006', '香克斯', '男', '12345678915', '12345615', NULL);
INSERT INTO `teacher` VALUES (7, '2007', '波风水门', '男', '12345678916', '12345616', NULL);
INSERT INTO `teacher` VALUES (8, '2008', '纲手', '女', '12345678917', '12345617', NULL);
INSERT INTO `teacher` VALUES (9, '2009', '大筒木辉夜', '女', '12345678918', '12345618', NULL);
INSERT INTO `teacher` VALUES (10, '2010', '漩涡玖辛奈', '女', '12345678919', '12345619', NULL);
INSERT INTO `teacher` VALUES (14, '2011', '夕日红', '女', '12345678920', '12345620', NULL);
INSERT INTO `teacher` VALUES (15, '2012', '鹰眼米霍克', '男', '12345678921', '12345621', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '111111',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_user_FK`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '111111', '管理员', 1);
INSERT INTO `user` VALUES (2, '2001', '111111', '卡卡西', 3);
INSERT INTO `user` VALUES (3, '2002', '111111', '卡普', 3);
INSERT INTO `user` VALUES (4, '2003', '111111', '战国', 3);
INSERT INTO `user` VALUES (5, '2004', '111111', '青雉', 3);
INSERT INTO `user` VALUES (6, '2005', '111111', '爱德华纽盖特', 3);
INSERT INTO `user` VALUES (7, '2006', '111111', '香克斯', 3);
INSERT INTO `user` VALUES (8, '2007', '111111', '波风水门', 3);
INSERT INTO `user` VALUES (9, '2008', '111111', '纲手', 3);
INSERT INTO `user` VALUES (10, '2009', '111111', '大筒木辉夜', 3);
INSERT INTO `user` VALUES (11, '2010', '111111', '漩涡玖辛奈', 3);
INSERT INTO `user` VALUES (15, '2011', '111111', '夕日红', 3);
INSERT INTO `user` VALUES (16, '2012', '111111', '鹰眼米霍克', 3);
INSERT INTO `user` VALUES (59, '201901001', '111111', '日向雏田', 2);
INSERT INTO `user` VALUES (60, '201901002', '111111', '李洛克', 2);
INSERT INTO `user` VALUES (61, '201901003', '111111', '日向花火', 2);
INSERT INTO `user` VALUES (62, '201901004', '111111', '奈良鹿丸', 2);
INSERT INTO `user` VALUES (63, '201901005', '111111', '日向宁次', 2);
INSERT INTO `user` VALUES (64, '201901006', '111111', '佐井', 2);
INSERT INTO `user` VALUES (65, '201901007', '111111', '山中井野', 2);
INSERT INTO `user` VALUES (66, '201901008', '111111', '秋道丁次', 2);
INSERT INTO `user` VALUES (67, '201901009', '111111', '犬冢牙', 2);
INSERT INTO `user` VALUES (68, '201901010', '111111', '野原琳', 2);
INSERT INTO `user` VALUES (69, '201901011', '111111', '天天', 2);
INSERT INTO `user` VALUES (70, '201901012', '111111', '木叶丸', 2);
INSERT INTO `user` VALUES (71, '201901013', '111111', '赤丸', 2);
INSERT INTO `user` VALUES (72, '201901014', '111111', '漩涡鸣人', 2);
INSERT INTO `user` VALUES (73, '201901015', '111111', '佐助', 2);
INSERT INTO `user` VALUES (74, '201901016', '111111', '春野樱', 2);
INSERT INTO `user` VALUES (75, '201901017', '111111', '油女志乃', 2);
INSERT INTO `user` VALUES (76, '201902001', '111111', '宇智波带土', 2);
INSERT INTO `user` VALUES (77, '201902002', '111111', '长门', 2);
INSERT INTO `user` VALUES (78, '201902003', '111111', '绝', 2);
INSERT INTO `user` VALUES (79, '201902004', '111111', '角都', 2);
INSERT INTO `user` VALUES (80, '201902005', '111111', '迪达拉', 2);
INSERT INTO `user` VALUES (81, '201902006', '111111', '小南', 2);
INSERT INTO `user` VALUES (82, '201902007', '111111', '大蛇丸', 2);
INSERT INTO `user` VALUES (83, '201902008', '111111', '飞段', 2);
INSERT INTO `user` VALUES (84, '201902009', '111111', '蝎', 2);
INSERT INTO `user` VALUES (85, '201902010', '111111', '弥彦', 2);
INSERT INTO `user` VALUES (86, '201902011', '111111', '千柿鬼鲛', 2);

SET FOREIGN_KEY_CHECKS = 1;
