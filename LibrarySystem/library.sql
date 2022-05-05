/*
 Navicat Premium Data Transfer

 Source Server         : Library
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : 172.22.76.51:5432
 Source Catalog        : Library
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 05/05/2022 17:20:24
*/


-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS "public"."administrator";
CREATE TABLE "public"."administrator" (
  "adminid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "adminname" varchar(100) COLLATE "pg_catalog"."default",
  "adminage" int4,
  "adminphonenumber" varchar(100) COLLATE "pg_catalog"."default",
  "admintype" varchar(100) COLLATE "pg_catalog"."default",
  "adminpassword" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."administrator"."adminid" IS '管理员id';
COMMENT ON COLUMN "public"."administrator"."adminname" IS '管理员姓名';
COMMENT ON COLUMN "public"."administrator"."adminage" IS '年龄';
COMMENT ON COLUMN "public"."administrator"."adminphonenumber" IS '电话号码';
COMMENT ON COLUMN "public"."administrator"."admintype" IS '管理类别';
COMMENT ON COLUMN "public"."administrator"."adminpassword" IS '密码';

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO "public"."administrator" VALUES ('000', 'cjcjcjc', 20, '123456', 'AB', 'cjccjc');
INSERT INTO "public"."administrator" VALUES ('369001', 'CaiXinchi', 21, '13900000001', '文学', '3690001cxc');
INSERT INTO "public"."administrator" VALUES ('123003', 'LiuCheng', 21, '18700000003', '心理', '123003lc');
INSERT INTO "public"."administrator" VALUES ('392002', 'ChenJingchun', 20, '18600000002', '哲学', '3920002cjc');
INSERT INTO "public"."administrator" VALUES ('006', 'lc', 20, '22', 'A', '123456789');
INSERT INTO "public"."administrator" VALUES ('347005', 'XiongZijian', 20, '17300000004', '语言', '347005xzj');
INSERT INTO "public"."administrator" VALUES ('594006', 'ZhangRuiWen', 21, '17600000005', '天文', '594006zrw');
INSERT INTO "public"."administrator" VALUES ('123004', 'LinSiyv', 21, '15500000006', '艺术', '123004lsy');
INSERT INTO "public"."administrator" VALUES ('001', 'lc', 21, '23456', 'ABC', 'lclc12');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS "public"."book";
CREATE TABLE "public"."book" (
  "bookid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "bookname" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "bookpublisher" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "bookauthorname" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "price" float4 NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "num" int4
)
;
COMMENT ON COLUMN "public"."book"."bookid" IS '书号';
COMMENT ON COLUMN "public"."book"."bookname" IS '书名';
COMMENT ON COLUMN "public"."book"."bookpublisher" IS '出版商';
COMMENT ON COLUMN "public"."book"."bookauthorname" IS '作者';
COMMENT ON COLUMN "public"."book"."price" IS '价格';
COMMENT ON COLUMN "public"."book"."type" IS '类别';
COMMENT ON COLUMN "public"."book"."num" IS '库存';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO "public"."book" VALUES ('D01003', '三国演义', '人民文学出版社', 'CaiXinchi', 24.5, '文学', 46);
INSERT INTO "public"."book" VALUES ('D05002', '艺境', '商务印书馆', 'CaiXinchi', 17.4, '艺术', 20);
INSERT INTO "public"."book" VALUES ('D01002', '西游记', '中国人民出版社', 'ChenjingChun', 32.6, '文学', 38);
INSERT INTO "public"."book" VALUES ('D05001', '中国美学史大纲', '上海人民出版社', 'ChenJingchun', 50.4, '艺术', 14);
INSERT INTO "public"."book" VALUES ('D02002', '理想国', '商务印书馆', 'XiongziJian', 34, '哲学', 17);
INSERT INTO "public"."book" VALUES ('D01004', '水浒传', '人民文学出版社', 'LiuCheng', 31.4, '文学', 98);
INSERT INTO "public"."book" VALUES ('D01005', '基督山伯爵', '中国文联出版社', 'Caixinchi', 84, '文学', 13);
INSERT INTO "public"."book" VALUES ('D02003', '形而上学', '商务印书馆', 'ZhangRuiwen', 39, '哲学', 17);
INSERT INTO "public"."book" VALUES ('D02001', '西方哲学史', '中国人民大学出版社', 'LinSiyu', 49.8, '哲学', 8);
INSERT INTO "public"."book" VALUES ('D02006', '庄子', '中华书局', 'LiuCheng', 33.8, '哲学', 32);
INSERT INTO "public"."book" VALUES ('D02005', '老子', '中华书局', 'ChenJingchun', 13.8, '哲学', 37);
INSERT INTO "public"."book" VALUES ('D02004', '中国哲学史', '北京大学出版社', 'CaiXinchi', 56, '哲学', 28);
INSERT INTO "public"."book" VALUES ('D03001', '怪诞心理学', '中国华侨出版社', 'ZhangRuiwen', 19.8, '心理', 18);
INSERT INTO "public"."book" VALUES ('D03002', '乌合之众', '中国友谊出版公司', 'XiongZijian', 23.4, '心理', 13);
INSERT INTO "public"."book" VALUES ('D01001', '红楼梦', '中国人民出版社', 'ChenjingChun', 37.1, '文学', 17);
INSERT INTO "public"."book" VALUES ('D03003', '亲密关系', '中国工信出版集团', 'ChenJingchun', 98.1, '心理', 18);
INSERT INTO "public"."book" VALUES ('D03004', '梦的解析', '广东人民出版社', 'CaiXinchi', 49.8, '心理', 23);
INSERT INTO "public"."book" VALUES ('D04001', '语言小书', '广西示范大学出版社', 'LiuCheng', 40, '语言', 16);
INSERT INTO "public"."book" VALUES ('D04002', '语言论', '中国社会科学出版社', 'LinSiyu', 168, '语言', 26);
INSERT INTO "public"."book" VALUES ('D04003', '思想本质', '浙江人民出版社', 'XiongZijian', 129, '语言', 7);
INSERT INTO "public"."book" VALUES ('D04004', '食物语言学', '上海文艺出版社', 'ZhangRuiwen', 38.2, '语言', 16);
INSERT INTO "public"."book" VALUES ('D05003', '西方现代艺术史', '中国建筑工业出版社', 'LiuCheng', 87.4, '艺术', 16);
INSERT INTO "public"."book" VALUES ('D05004', '西方美学史', '人民文学出版社', 'LinSiyu', 28, '艺术', 25);
INSERT INTO "public"."book" VALUES ('S01001', '诺顿星图手册', '湖南科学技术出版社', 'XiongZijian', 45.8, '天文', 13);
INSERT INTO "public"."book" VALUES ('S02002', '天体运行论', '北京大学出版社', 'CaiXinchi', 50.3, '天文', 18);
INSERT INTO "public"."book" VALUES ('S02003', '宇宙的裂缝', '电子工业出版社', 'ZhangRuiwen', 245.8, '天文', 5);
INSERT INTO "public"."book" VALUES ('000', '1345', '1234', 'cjc', 11, '哲学', 21);

-- ----------------------------
-- Table structure for bookborrowing
-- ----------------------------
DROP TABLE IF EXISTS "public"."bookborrowing";
CREATE TABLE "public"."bookborrowing" (
  "bookid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "cusid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "adminid" varchar(100) COLLATE "pg_catalog"."default",
  "borrowdate" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "returndate" varchar(100) COLLATE "pg_catalog"."default",
  "state" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."bookborrowing"."bookid" IS '书号';
COMMENT ON COLUMN "public"."bookborrowing"."cusid" IS '读者号';
COMMENT ON COLUMN "public"."bookborrowing"."adminid" IS '管理员号';
COMMENT ON COLUMN "public"."bookborrowing"."borrowdate" IS '出借日期';
COMMENT ON COLUMN "public"."bookborrowing"."returndate" IS '归还日期';
COMMENT ON COLUMN "public"."bookborrowing"."state" IS '出借状态：0为借出，1为已归还';

-- ----------------------------
-- Records of bookborrowing
-- ----------------------------
INSERT INTO "public"."bookborrowing" VALUES ('D02001', '002', '000', '4', '5', 0);
INSERT INTO "public"."bookborrowing" VALUES ('D01001', '002', '000', '5', '00', 0);
INSERT INTO "public"."bookborrowing" VALUES ('D01001', '002', '000', '13', '20', 1);
INSERT INTO "public"."bookborrowing" VALUES ('D01001', '002', '000', '10', '23', 1);
INSERT INTO "public"."bookborrowing" VALUES ('D01001', '1a1', '000', '12', '', 0);
INSERT INTO "public"."bookborrowing" VALUES ('D05001', '1a1', NULL, '1651667218852', NULL, 0);
INSERT INTO "public"."bookborrowing" VALUES ('D02002', '1a1', NULL, '1651669716884', NULL, 0);
INSERT INTO "public"."bookborrowing" VALUES ('D02003', '1a1', NULL, '1651670115674', NULL, 0);
INSERT INTO "public"."bookborrowing" VALUES ('D02005', '1a1', NULL, '1651672819691', '1651673635172', 1);
INSERT INTO "public"."bookborrowing" VALUES ('D01001', '1a1', NULL, '1651733700369', '1651733729643', 1);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "cusid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "cusname" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "cusage" int4,
  "cussex" varchar(100) COLLATE "pg_catalog"."default",
  "cusphonenumber" varchar(100) COLLATE "pg_catalog"."default",
  "cuspassword" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."customer"."cusid" IS '读者号';
COMMENT ON COLUMN "public"."customer"."cusname" IS '读者姓名';
COMMENT ON COLUMN "public"."customer"."cusage" IS '年龄';
COMMENT ON COLUMN "public"."customer"."cussex" IS '性别';
COMMENT ON COLUMN "public"."customer"."cusphonenumber" IS '电话号码';
COMMENT ON COLUMN "public"."customer"."cuspassword" IS '密码';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "public"."customer" VALUES ('002', 'cjcjcjc', 21, 'M', '18640459826', '20010711');
INSERT INTO "public"."customer" VALUES ('2019001', 'WangMing', 20, '男', '13688293012', 'as203123');
INSERT INTO "public"."customer" VALUES ('2018001', 'LiHua', 21, '女', '19328374832', 'sd12312we');
INSERT INTO "public"."customer" VALUES ('2020001', 'WangFang', 19, '女', '17483829912', 'ftg234g786');
INSERT INTO "public"."customer" VALUES ('2020002', 'Wangpeng', 20, '男', '13209483812', 'dwo01234s');
INSERT INTO "public"."customer" VALUES ('2021001', 'Liyuanyuan', 18, '女', '15203218432', 'fire002401ad');
INSERT INTO "public"."customer" VALUES ('2022001', 'LinZhen', 19, '男', '17493940302', 'fjis203010da');
INSERT INTO "public"."customer" VALUES ('2022002', 'LiuShuai', 37, '男', '19302043942', 'koew23010s');
INSERT INTO "public"."customer" VALUES ('2022003', 'LiZe', 47, '男', '18403309392', 'poirod3204');
INSERT INTO "public"."customer" VALUES ('2022004', 'LiRen', 52, '女', '16473820493', 'swqosao123');
INSERT INTO "public"."customer" VALUES ('2022005', 'HuLong', 37, '男', '13294939293', 'haoeod34234');
INSERT INTO "public"."customer" VALUES ('123', '123123', NULL, NULL, NULL, '123qwe');
INSERT INTO "public"."customer" VALUES ('1a1', 'aaaaaa', NULL, NULL, NULL, 'aa1aa1');
INSERT INTO "public"."customer" VALUES ('111', '111', NULL, NULL, NULL, 'qwe111');

-- ----------------------------
-- Primary Key structure for table administrator
-- ----------------------------
ALTER TABLE "public"."administrator" ADD CONSTRAINT "administrator_pkey" PRIMARY KEY ("adminid");

-- ----------------------------
-- Primary Key structure for table book
-- ----------------------------
ALTER TABLE "public"."book" ADD CONSTRAINT "book_pkey" PRIMARY KEY ("bookid");

-- ----------------------------
-- Primary Key structure for table bookborrowing
-- ----------------------------
ALTER TABLE "public"."bookborrowing" ADD CONSTRAINT "bookborrowing_pkey" PRIMARY KEY ("bookid", "borrowdate");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("cusid");

-- ----------------------------
-- Foreign Keys structure for table bookborrowing
-- ----------------------------
ALTER TABLE "public"."bookborrowing" ADD CONSTRAINT "bookborrowing_administratorid_fkey" FOREIGN KEY ("adminid") REFERENCES "public"."administrator" ("adminid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bookborrowing" ADD CONSTRAINT "bookborrowing_bookid_fkey" FOREIGN KEY ("bookid") REFERENCES "public"."book" ("bookid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bookborrowing" ADD CONSTRAINT "bookborrowing_customerid_fkey" FOREIGN KEY ("cusid") REFERENCES "public"."customer" ("cusid") ON DELETE NO ACTION ON UPDATE NO ACTION;
