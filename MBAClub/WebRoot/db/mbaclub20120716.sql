/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.19 : Database - mbaclub
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mbaclub` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mbaclub`;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `introduce` text,
  `url` varchar(128) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `order_value` int(11) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`id`,`name`,`introduce`,`url`,`category`,`order_value`,`logo`) values (1,'哈尔滨天马集团','哈尔滨天马集团的简介，实际上并不清楚是什么。',NULL,1,1,NULL),(2,'黑龙江绿地达拓展训练中心',NULL,NULL,1,0,NULL),(3,'哈尔滨市大明奇数码有限公司',NULL,NULL,2,1,NULL),(4,'黑龙江省银利影视人才基地',NULL,NULL,2,2,NULL),(5,'北京小马快跑精英励志活动策划',NULL,NULL,2,0,NULL),(8,'s','sss','s',1,3,'/MBAClub/company/20120715202049187.png'),(10,'aaaaaaaaaa','aaaaaaaaaaaaaa','aaaaaaaaa',1,4,NULL),(11,'啊啊啊啊啊啊啊啊','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','死死死死死死',1,2,'/MBAClub/company/20120715221352323.png'),(12,'腾讯科技','腾讯科技','http://www.qq.com',2,NULL,'/MBAClub/company/20120715221352323.png');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `motto` text,
  `url` varchar(128) DEFAULT NULL,
  `introduce` text,
  `image` varchar(128) DEFAULT NULL,
  `order_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`company`,`school`,`motto`,`url`,`introduce`,`image`,`order_value`) values (1,'蒙奇.D.路飞','草帽海贼团','哈尔滨工业大学','我是要成为海贼王的男人，海贼王我当定了！','http://www.qq.com','烟雨，飘落。流年，轻渡。蓦然回首，桃花依旧笑春风，那踏雪寻梅，寒松访竹的日子早已背上行囊悄然远走，让人无处可寻，无迹可觅。 \r\n\r\n季节更替，岁月枯荣，由不得你我作主，不管你怀着怎样的心情，都必须无奈接受。素来都爱陌上独行，在水色的时光里走走停停，在红尘乱世中寻寻觅觅。然杨柳落英，菡萏寒梅，都只是沿途的刹那风景，终归是敌不过时光的脚步，逃不过岁月的劫数。 \r\n\r\n花开又花落，日升又月落，每当你倚窗赏花，望月忆友时，时光便那样老去了，连叹息都显得多余。有人说，世间最唯美的清梦莫过于与烟雨相携共冬春夏秋之梦，同慕一剪寒梅韵骨， 共点一幅水墨丹青，齐沐十里菡萏风，皆温一壶桂花酒，才不负一世韶华。也有人说世间最寻常的幸福莫过于任沧海桑田，世态炎凉，时光仍忠贞于自己，如影随形，不离不弃。是呵，烟花易冷，人事易分，谁又给的起谁人的一份地久天长，海枯石烂。我想， 人生中最悲哀的事情莫过于整日游手好闲，无所事事，没有梦想，没有追求，将花样年华蹉跎。 \r\n\r\n','cc2.jpg',2),(2,'漩涡鸣人','火影忍者','木叶村','成为火影是我的忍道！','http://www.baidu.com','日本漫画家岸本齐史作品《火影忍者》中男主角。因为身上封印着邪恶的九尾妖狐，无父无母的他受尽了村人的冷眼与歧视，他下定决心要成为第六代火影，让所有人都认同他的存在，在旗木卡卡西老师的带领下，与佐助、小樱一起踏上了修行之路。 如今，他已经因为阻止佩恩袭击木叶而成为一名人人称道的英雄，并且在第四次忍界大战中发挥着举足轻重的作用。\r\n','cc3.jpg',0),(3,'旗木卡卡西','火影忍者','火之国木叶村','复制忍者卡卡西','http://www.qiushibaike.com','千种忍术复制忍者！木叶第一技师！',NULL,1),(4,'地方','123','111','111','1111','11111111111',NULL,NULL),(5,'搜索','百度','哈工大','规格严格','www.hit.edu.cn','哈尔滨工业大学','/MBAClub/company/20120716010933219.png',NULL);

/*Table structure for table `milestone` */

DROP TABLE IF EXISTS `milestone`;

CREATE TABLE `milestone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `event_date` date NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `more_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `milestone` */

insert  into `milestone`(`id`,`title`,`content`,`event_date`,`image`,`more_url`) values (1,'2006年11月26日','黑龙江省首届MBA案例大赛哈工大赛区初赛举行，6支队伍参加了比赛，最后两支队伍胜出代表工大参加最终的决赛。在案例大赛的组织过程中，三所学校的同学建立起了联系，开始筹建全省MBA联络平台。','2006-11-26',NULL,NULL),(2,'2006年12月10日','工大、工程、商大三所学校联谊会举行，70多名来自各个学校的同学济济一堂，借助案例大赛所建立起的联系第一次实现了三个学校之间自发组织的交流。','2006-12-10',NULL,NULL),(3,'2006年12月17日','工大、工程、商大三所学校的6支队伍参加了黑龙江省首届MBA案例大赛决赛，商大大庆班同学组成的亮剑队最后获得冠军。','2006-12-17',NULL,NULL),(4,'2008年','王胜坤同学组织的第一次商业模式交流活动取得成功','2008-01-01',NULL,NULL),(5,'2009年5月9日','MBA俱乐部组织下，黑龙江MBA第一届羽毛球比赛顺利举行，90多名来自各校的MBA同学同场竞技','2009-05-09',NULL,NULL),(6,'2009年10月7日','东财高俊杰同学组织横头山爬山游活动','2009-10-07',NULL,NULL),(7,'2009年11月','张弛、刘冰、刘大力、王胜坤、纪国锋、高俊杰、曲延明、张扬、刘京南筹备建立黑龙江MBA俱乐部（黑龙江MBA联合会）。','2009-01-01',NULL,NULL),(8,'2010年1月23日','商大、工大、工程、黑大、东财等学校同学以俱乐部名义共同组织的“同学共乐，同享共赢”全省MBA第一届新年联谊会在民防商务酒店举行。全省200多名来自各个学校各个年级的MBA相聚畅怀。','2010-01-23',NULL,NULL),(9,'2010年3月28日','张奇伟同学组织的室内拓展活动让同学们耳目一新。从这次活动开始，定期组织的MBA沙龙成为全省MBA同学相识、分享、共进的一个崭新平台。','2010-03-28',NULL,NULL),(10,'2010年5月9日','创业主题沙龙帮助想创业的同学搭建了一个专属MBA的平台','2010-05-09',NULL,NULL),(11,'2010年5月21日','理工音乐晚餐，通过生日会的形式为MBA同学凝聚起家的感觉','2010-05-21',NULL,NULL),(12,'2010年5月31日','房地产主题沙龙，实现大家针对当前社会热点，分享信息、交流心得的愿望','2010-05-31',NULL,NULL),(13,'2010年8月25日','天鹅保龄球活动加8月生日会','2010-08-25',NULL,NULL),(14,'2010年8月29日','金玉良言主题沙龙，让同学彼此分享人生经验','2010-08-29',NULL,NULL),(15,'2010年9月12日','保龄球活动及9月份生日会','2010-09-12',NULL,NULL),(16,'2010年10月4日','爬山郊游，放松心情','2010-10-04',NULL,NULL),(17,'2010年10月17日','羽毛球活动及10月生日会','2010-10-17',NULL,NULL),(18,'2010年11月21日','苗懿等同学组织的“寿星转起来互动大联欢”及11月生日会','2010-11-21',NULL,NULL),(19,'2010年11月27日','赵杨同学组织的“迎风傲雪，同学同心”滑雪活动','2010-11-27',NULL,NULL),(20,'2010年12月','组织羽毛球活动及12月份生日会','2010-12-01',NULL,NULL),(21,'2011年1月','黑龙江MBA第一本年刊发布，同时发布黑龙江MBA俱乐部（黑龙江MBA联合会）章程','2011-01-01',NULL,NULL),(22,'2011年1月16号','黑龙江MBA第二届新年联谊会活动在天龙酒店举行，工大、黑大、吉大MBA中心领导到场参加','2011-01-16',NULL,NULL),(23,'2011年3月6号','围绕“黑龙江MBA联合会”正式注册问题开展主题沙龙，并筛选出黑龙江MBA联合会理事','2011-03-06',NULL,NULL),(24,'2011年5月15日','张奇伟同学主持沙龙活动：如何成为高效人士','2011-05-15',NULL,NULL),(25,'2011年6月25日','李效松、张鹏越同学主持沙龙活动:艺术品的收藏鉴赏与投资 ','2011-06-25',NULL,NULL),(26,'2011年7月23日','赵杨、张杨同学主持沙龙：江畔自然游及MBA人脉扩展','2011-07-23',NULL,NULL),(27,'2011年8月14日','赵杨同学主持沙龙活动: 伏尔加庄园美景赏游及MBA同学资源共享','2011-08-14',NULL,NULL),(28,'2011年10月16日',' 黑龙江省MBA第二届羽毛球赛在道外南市小学举行，来自工大、吉大、商大、工程等多所学校的同学以球会友。','2011-10-16',NULL,NULL),(29,'2011年11月13日','高原同学组织保龄球活动','2011-11-13',NULL,NULL),(30,'2012年12月24日','全省MBA第三届年会在红马大酒店顺利举行，各校MBA中心主任到场或发贺信祝贺。','2011-12-24',NULL,NULL);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `ID` bigint(20) NOT NULL,
  `SUBTITLE` varchar(100) DEFAULT NULL,
  `LINK` varchar(100) DEFAULT NULL,
  `HIT` int(11) DEFAULT '0',
  `SUMMARY` varchar(255) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `CONTENT` text,
  `SOURCE` varchar(50) DEFAULT NULL,
  `IMAGE` varchar(50) DEFAULT NULL,
  `USERID` bigint(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `HTML` varchar(100) DEFAULT NULL,
  `PAGE_SIZE` int(11) DEFAULT NULL,
  `PAGE_TYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK744A3C118F5E23F7` (`CATEGORY_ID`),
  KEY `FK_a_news` (`USERID`),
  CONSTRAINT `FK744A3C118F5E23F7` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `news_category` (`ID`),
  CONSTRAINT `FK_a_news` FOREIGN KEY (`USERID`) REFERENCES `security_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`ID`,`SUBTITLE`,`LINK`,`HIT`,`SUMMARY`,`UPDATE_DATE`,`NAME`,`CONTENT`,`SOURCE`,`IMAGE`,`USERID`,`STATUS`,`CATEGORY_ID`,`HTML`,`PAGE_SIZE`,`PAGE_TYPE`) values (2,'est','/anews/html/2/2007/10/06/2.html',17,'登香山通知-MBA登山俱乐部活动1月29日','2007-10-06 00:00:00','登香山通知-MBA登山俱乐部活动1月29日','乱码','【本站原创】','',29,1,1,NULL,1,0),(3,'45','',15,'2012中国对外贸易面临的形式、问题','2007-10-07 00:00:00','2012中国对外贸易面临的形式、问题','<p>\r\n                                烟雨，飘落。流年，轻渡。蓦然回首，桃花依旧笑春风，那踏雪寻梅，寒松访竹的日子早已背上行囊悄然远走，让人无处可寻，无迹可觅。\r\n                            </p>\r\n                            <p>\r\n                                季节更替，岁月枯荣，由不得你我作主，不管你怀着怎样的心情，都必须无奈接受。素来都爱陌上独行，在水色的时光里走走停停，在红尘乱世中寻寻觅觅。然杨柳落英，菡萏寒梅，都只是沿途的刹那风景，终归是敌不过时光的脚步，逃不过岁月的劫数。\r\n                            </p>\r\n                            <p>\r\n                                花开又花落，日升又月落，每当你倚窗赏花，望月忆友时，时光便那样老去了，连叹息都显得多余。有人说，世间最唯美的清梦莫过于与烟雨相携共冬春夏秋之梦，同慕一剪寒梅韵骨，\r\n                                共点一幅水墨丹青，齐沐十里菡萏风，皆温一壶桂花酒，才不负一世韶华。也有人说世间最寻常的幸福莫过于任沧海桑田，世态炎凉，时光仍忠贞于自己，如影随形，不离不弃。是呵，烟花易冷，人事易分，谁又给的起谁人的一份地久天长，海枯石烂。我想，\r\n                                人生中最悲哀的事情莫过于整日游手好闲，无所事事，没有梦想，没有追求，将花样年华蹉跎。\r\n                            </p>','【本站原创】',NULL,29,1,1,NULL,1,0),(4,'1','',14,'2011级集中班英语名单及上课教室','2007-10-08 00:00:00','2011级集中班英语名单及上课教室','&nbsp;54','【本站原创】',NULL,29,1,1,NULL,1,0),(5,'54','',33,'同学研究生院网站选课结果确认通知','2007-10-09 00:00:00','同学研究生院网站选课结果确认通知','&nbsp;656','【本站原创】',NULL,29,1,1,NULL,1,0),(7,'tset','/anews/html/3/2007/10/12/7.html',2,'tset','2007-10-12 00:00:00','test','&nbsp;tse','【本站原创】',NULL,29,1,3,NULL,1,0),(9,NULL,NULL,8,NULL,'2012-07-14 13:31:00','关于软件工程硕士2012年7月份哈尔滨开题和中期检查结果的通知','学院于2012年7月份在哈尔滨对软件工程硕士进行学位论文的开题和中期检查，现公布检查结果。评审组已在检查过程中对同学们的报告给予了指导意见，请同学们把检查结果和建议汇报给自己的校内外导师，并在校内外导师指导下进行改进，以保证实习和论文工作的顺利进行。\r\n',NULL,NULL,29,1,2,NULL,NULL,NULL),(10,NULL,NULL,7,NULL,'2012-07-14 13:31:00','关于软件学院2012年实习动员及2011级脱产班硕士生报选校内导师的通知','学院定于2012年7月5日 18:00 在正心楼13教室进行2012年实习动员及2011级脱产班校内导师报选讲座，请2009级本科和2011级硕士（国际班除外）全体同学务必准时参加。\r\n    讲座内容安排如下：\r\n    1、2011-2012年度实习表彰\r\n    2、实习动员及离校前的相关安排\r\n    3、导师报选注意事项\r\n    4、论文撰写相关要求 \r\n',NULL,NULL,29,1,2,NULL,NULL,NULL),(11,NULL,NULL,7,NULL,'2012-07-14 13:33:00','关于2012年春季学期暑期实训带队老师见面会的通知','学院定于2012年7月4日 10：00 在正心楼13教室进行暑期实训带队老师见面会，请2010级本科同学准时参加。 ',NULL,NULL,29,1,5,NULL,NULL,NULL),(12,NULL,NULL,31,NULL,'2012-07-14 13:36:00','关于关于2012年春季学期暑期实训选择结果的公示','根据学院安排，本科生需在第四学期结束后暑假进行为期四周的实训，现将同学们自主选择实训基地的结果进行公示，请有疑问的同学于2012年6月27日之前联系工业实践秘书，电话：0451-86418711，邮箱：software@hit.edu.cn\r\n',NULL,NULL,29,1,5,NULL,NULL,NULL),(13,NULL,NULL,10,NULL,'2012-07-15 13:17:24','2012学年度在校本科生、研究生缴纳学杂费的通知 ','<div align=\"left\">各位同学：</div><div align=\"left\"> &nbsp; &nbsp;我校2012学年的学杂费收缴工作将于8月下旬开始，现将有关事项通知如下：</div><div align=\"left\"><strong> &nbsp; &nbsp;一、缴费方式</strong></div><div align=\"left\"> &nbsp; &nbsp;为减少同学们携带现金的风险、节省排队等候时间，提高工作效率，学校从2012年秋季学期开始统一采用银行托收的方式收取老生的学费、宿费，本科生请将学费和宿费存入您本人的工行卡中（<strong>入学时学校发放的工行卡</strong>），研究生请将学费和宿费存入您本人的中行助学金卡中，在银行划款日期前，将足额款项存入该卡中。学校将在指定日期委托银行统一进行划款扣缴学杂费。划款成功同学的收据由院系辅导员在开学后统一发放。</div><div align=\"left\"><strong> &nbsp; &nbsp;委托银行划款的日期：2012年8月20日。</strong></div><div align=\"left\"><strong> &nbsp; &nbsp;请必须于8月20日前将足额款项存入卡内，因特殊原因8月20日前未能存入的，请8月28日前务必存入，学校对老生不再提供现场缴费方式。</strong></div><div align=\"left\"><strong> &nbsp; &nbsp;二、其他事项</strong></div><div align=\"left\"> &nbsp; &nbsp;1、学生应该缴纳的年度学杂费金额为：<strong>学费（1年）+ 住宿费（1年）。</strong></div><div align=\"left\"> &nbsp; &nbsp;2、异地存款银行收手续费，需另行缴纳。</div><div align=\"left\"> &nbsp; &nbsp;3、委托银行缴费后请及时查询卡内余额，以确认缴费。</div><div align=\"left\"> &nbsp; &nbsp;4、学校财务处咨询电话：0451-86414371。</div><div align=\"left\"> &nbsp; &nbsp;5、办理生源地助学贷款的学生，需要采用银行汇款方式的，可以通过银行电汇或者网上银行汇款方式将款项汇至学校指定的账户。</div><div align=\"left\"> &nbsp; &nbsp;开户行：工商银行哈尔滨市大直支行</div><div align=\"left\"> &nbsp; &nbsp;户 &nbsp; 名：哈尔滨工业大学</div><div align=\"left\"> &nbsp; &nbsp;账 &nbsp; 号：3500040129005006936</div><div align=\"left\"> &nbsp; &nbsp;注意：</div><div align=\"left\"> &nbsp; &nbsp;a、汇款单严格按照以上提供的开户行等资料填写，不要做任何改动。 &nbsp; &nbsp;</div><div align=\"left\"> &nbsp; &nbsp;b、汇款单附注栏上要注明学生的姓名、学号等信息，以便于查询和认领。</div><div align=\"left\"><strong> &nbsp; &nbsp;c</strong><strong>、银行汇款方式仅限办理生源地助学贷款使用。</strong></div><p><br /></p>','学费',NULL,34,1,1,NULL,NULL,NULL),(15,NULL,NULL,3,NULL,'2012-07-15 15:30:10','afds','<p><span style=\"font-size:36px;\">//从数据库中取出文章内容打印到此处</span></p><p>adsfasdf</p>','asdfasdf',NULL,34,1,5,NULL,NULL,NULL),(16,NULL,NULL,1,NULL,'2012-07-15 15:33:55','测试标题','<p>//从数据库中取出文章内容打印到此处</p><p>测试内容</p>','测试标签1;测试标签2',NULL,34,1,5,NULL,NULL,NULL),(17,NULL,NULL,1,NULL,'2012-07-15 15:34:48','测试标题1','<p>//从使得房贷首付数据库中取出文章内容打印到此处</p>','标签',NULL,34,1,5,NULL,NULL,NULL),(18,NULL,NULL,1,NULL,'2012-07-15 15:35:29','测试标题1','<p>//从使得房贷首付数据库中取出文章内容打印到此处</p>','标签',NULL,34,1,5,NULL,NULL,NULL),(20,NULL,NULL,2,NULL,'2012-07-15 15:37:20','sdfasd','<p>//从数据库中取出文章内容打印到此处</p>','sdfsdf',NULL,34,1,3,NULL,NULL,NULL);

/*Table structure for table `news_category` */

DROP TABLE IF EXISTS `news_category`;

CREATE TABLE `news_category` (
  `ID` bigint(20) NOT NULL,
  `THE_SORT` int(11) DEFAULT NULL,
  `BIT_CODE` bigint(20) DEFAULT NULL,
  `CHAR_CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK6567A56CAF1C28CB` (`PARENT_ID`),
  CONSTRAINT `FK6567A56CAF1C28CB` FOREIGN KEY (`PARENT_ID`) REFERENCES `news_category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news_category` */

insert  into `news_category`(`ID`,`THE_SORT`,`BIT_CODE`,`CHAR_CODE`,`NAME`,`STATUS`,`PARENT_ID`) values (1,0,72057594037927936,NULL,'活动发布',NULL,NULL),(2,1,72339069014638592,NULL,'活动回顾',NULL,NULL),(3,2,72340168526266368,NULL,'信息交流',NULL,NULL),(4,3,NULL,NULL,'校园在线',NULL,NULL),(5,4,NULL,NULL,'活动回顾',NULL,NULL);

/*Table structure for table `news_comment` */

DROP TABLE IF EXISTS `news_comment`;

CREATE TABLE `news_comment` (
  `ID` bigint(20) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `CONTENT` text,
  `STATUS` int(11) DEFAULT NULL,
  `NEWS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK5CDABC117E0115E4` (`NEWS_ID`),
  CONSTRAINT `FK5CDABC117E0115E4` FOREIGN KEY (`NEWS_ID`) REFERENCES `news` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news_comment` */

/*Table structure for table `news_config` */

DROP TABLE IF EXISTS `news_config`;

CREATE TABLE `news_config` (
  `ID` bigint(20) NOT NULL,
  `NEWS_NEED_AUDIT` int(11) DEFAULT NULL,
  `COMMENT_NEED_AUDIT` int(11) DEFAULT NULL,
  `COULD_COMMENT` int(11) DEFAULT NULL,
  `CATEGORY_STRATEGY` int(11) DEFAULT NULL,
  `TEMPLATE_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news_config` */

insert  into `news_config`(`ID`,`NEWS_NEED_AUDIT`,`COMMENT_NEED_AUDIT`,`COULD_COMMENT`,`CATEGORY_STRATEGY`,`TEMPLATE_NAME`) values (1,1,0,0,0,'default');

/*Table structure for table `news_newstag` */

DROP TABLE IF EXISTS `news_newstag`;

CREATE TABLE `news_newstag` (
  `NEWSTAG_ID` bigint(20) NOT NULL,
  `NEWS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`NEWS_ID`,`NEWSTAG_ID`),
  KEY `FK923EAD997E0115E4` (`NEWS_ID`),
  KEY `FK923EAD9963BB8EF0` (`NEWSTAG_ID`),
  CONSTRAINT `FK923EAD9963BB8EF0` FOREIGN KEY (`NEWSTAG_ID`) REFERENCES `news_tag` (`ID`),
  CONSTRAINT `FK923EAD997E0115E4` FOREIGN KEY (`NEWS_ID`) REFERENCES `news` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news_newstag` */

insert  into `news_newstag`(`NEWSTAG_ID`,`NEWS_ID`) values (2,2),(3,2),(4,2),(5,7);

/*Table structure for table `news_tag` */

DROP TABLE IF EXISTS `news_tag`;

CREATE TABLE `news_tag` (
  `ID` bigint(20) NOT NULL,
  `THE_SORT` int(11) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news_tag` */

insert  into `news_tag`(`ID`,`THE_SORT`,`NAME`) values (2,NULL,'222'),(3,NULL,'2'),(4,NULL,'444'),(5,NULL,'test');

/*Table structure for table `school_image` */

DROP TABLE IF EXISTS `school_image`;

CREATE TABLE `school_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(256) NOT NULL,
  `create_time` datetime NOT NULL,
  `introduce` text,
  `describe` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `school_image` */

insert  into `school_image`(`id`,`image_path`,`create_time`,`introduce`,`describe`) values (1,'cc1.jpg','2012-07-12 16:46:00',NULL,NULL),(2,'cc2.jpg','2012-07-12 16:46:12',NULL,NULL),(3,'cc3.jpg','2012-07-12 16:46:15',NULL,NULL),(4,'cc4.jpg','2012-07-12 16:46:16',NULL,NULL);

/*Table structure for table `security_dept` */

DROP TABLE IF EXISTS `security_dept`;

CREATE TABLE `security_dept` (
  `ID` bigint(20) NOT NULL,
  `THE_SORT` int(11) DEFAULT NULL,
  `DESCN` varchar(200) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK33849C668034938C` (`PARENT_ID`),
  CONSTRAINT `FK33849C668034938C` FOREIGN KEY (`PARENT_ID`) REFERENCES `security_dept` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_dept` */

insert  into `security_dept`(`ID`,`THE_SORT`,`DESCN`,`NAME`,`PARENT_ID`) values (1,0,'','技术部',NULL),(2,4,'市场','市场部',NULL),(3,5,'销售的部门，卖不出去可不行啊','销售部',NULL),(4,2,NULL,'研发部',1),(5,1,'','产品部',1);

/*Table structure for table `security_menu` */

DROP TABLE IF EXISTS `security_menu`;

CREATE TABLE `security_menu` (
  `ID` bigint(20) NOT NULL,
  `URL` varchar(50) DEFAULT NULL,
  `THE_SORT` int(11) DEFAULT NULL,
  `QTIP` varchar(50) DEFAULT NULL,
  `DESCN` varchar(200) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `IMAGE` varchar(50) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK3388B3808038AAA6` (`PARENT_ID`),
  CONSTRAINT `FK3388B3808038AAA6` FOREIGN KEY (`PARENT_ID`) REFERENCES `security_menu` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_menu` */

insert  into `security_menu`(`ID`,`URL`,`THE_SORT`,`QTIP`,`DESCN`,`NAME`,`IMAGE`,`PARENT_ID`) values (44,'./',13,'1','11','sandbox','set.gif',NULL),(45,'../newstag2/dialogManage.htm',24,'','','体验dialog','user.gif',44),(46,'../newstag2/inlineManage.htm',23,'','','体验editor','user.gif',44),(47,'./',0,'','','新闻发布','set.gif',NULL),(48,'../newscategory/index.htm',2,'','','新闻分类管理','user.gif',47),(50,'../news/index.htm',3,'管理新闻','管理新闻','管理新闻','user.gif',47),(52,'../newstag/index.htm',4,'','','管理关键字','user.gif',47),(53,'../newsconfig/index.htm',5,'新闻属性设置','新闻属性设置','新闻属性设置','user.gif',47),(54,'../template/dd.htm',22,'','','设置模板','user.gif',44),(56,'./',6,'','','权限设置','set.gif',NULL),(57,'../user/index.htm',12,'','','管理用户','user.gif',56),(58,'../resource/index.htm',11,'','','管理资源','user.gif',56),(59,'../role/index.htm',10,'','','管理角色','user.gif',56),(60,'../menu/index.htm',7,'','','管理菜单','user.gif',56),(61,'../sandbox/datagrid.htm',21,'','','DataGrid','user.gif',44),(62,'../dept/index.htm',8,'部门','部门','管理部门','user.gif',56),(63,'../widgets/lingo/jsontree/Ext.lingo.JsonTree.html',19,'','','Ext.lingo.JsonTree','user.gif',44),(64,'../widgets/lingo/jsongrid/Ext.lingo.JsonGrid.html',18,'','','Ext.lingo.JsonGrid','user.gif',44),(65,'../widgets/lingo/checkboxtree/checkboxtree.html',20,'带选择框的树','带选择框的树','CheckBoxTree','user.gif',44),(66,'../widgets/lingo/form/ddgrid.html',17,'两个表格间拖动','两个表格间拖动','grid拖拽','user.gif',44),(67,'../widgets/lingo/form/switchField.html',16,'切换输入框','切换输入框','切换输入框','user.gif',44),(68,'../widgets/lingo/form/ddtree2.html',26,'tree与grid拖拽','tree与grid拖拽','tree与grid拖拽','user.gif',44),(69,'../widgets/lingo/form/ddtree.html',25,'tree与grid拖拽，不知道为啥失败','tree与grid拖拽，不知道为啥失败','tree与grid拖拽，不知道为啥失败','user.gif',44),(70,'../dept/orgmap.htm',9,'组织结构图','组织结构图','组织结构图','user.gif',56),(71,'../widgets/lingo/form/treeField.html',15,'树形下拉框','树形下拉框','树形下拉框','user.gif',44),(72,'../widgets/lingo/form/room.html',14,'级联combobox','级联combobox','级联combobox','user.gif',44),(73,'../news/manage.htm',1,'审核新闻','审核新闻','审核新闻','user.gif',47),(74,NULL,NULL,NULL,NULL,'发布新闻',NULL,47);

/*Table structure for table `security_menu_role` */

DROP TABLE IF EXISTS `security_menu_role`;

CREATE TABLE `security_menu_role` (
  `MENU_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`MENU_ID`),
  KEY `FK14BCADD556E5FA71` (`ROLE_ID`),
  KEY `FK14BCADD53D7765D1` (`MENU_ID`),
  CONSTRAINT `FK14BCADD53D7765D1` FOREIGN KEY (`MENU_ID`) REFERENCES `security_menu` (`ID`),
  CONSTRAINT `FK14BCADD556E5FA71` FOREIGN KEY (`ROLE_ID`) REFERENCES `security_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_menu_role` */

insert  into `security_menu_role`(`MENU_ID`,`ROLE_ID`) values (47,2),(48,2),(50,2),(56,2),(57,2),(58,2),(47,3),(48,3),(50,3),(52,3),(53,3),(56,3),(57,3),(58,3),(59,3),(60,3),(62,3),(44,4),(45,4),(46,4),(47,4),(48,4),(50,4),(52,4),(53,4),(54,4),(56,4),(57,4),(58,4),(59,4),(60,4),(61,4),(62,4),(63,4),(64,4),(65,4),(66,4),(67,4),(68,4),(69,4),(70,4),(71,4),(72,4),(73,4);

/*Table structure for table `security_resource` */

DROP TABLE IF EXISTS `security_resource`;

CREATE TABLE `security_resource` (
  `ID` bigint(20) NOT NULL,
  `DESCN` varchar(200) DEFAULT NULL,
  `RES_TYPE` varchar(50) DEFAULT NULL,
  `RES_STRING` varchar(200) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_resource` */

insert  into `security_resource`(`ID`,`DESCN`,`RES_TYPE`,`RES_STRING`,`NAME`) values (2,'后台管理','URL','/admin/**','admin'),(3,'资源管理','URL','/resource/**','resource'),(4,'用户管理','URL','/user/**','user'),(5,'角色管理','URL','/role/**','role'),(6,'菜单管理','URL','/menu/**','menu'),(7,'部门管理','URL','/dept/**','dept');

/*Table structure for table `security_resource_role` */

DROP TABLE IF EXISTS `security_resource_role`;

CREATE TABLE `security_resource_role` (
  `RESOURCE_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`RESOURCE_ID`),
  KEY `FK6FD1850656E5FA71` (`ROLE_ID`),
  KEY `FK6FD185064E5B1FF1` (`RESOURCE_ID`),
  CONSTRAINT `FK6FD185064E5B1FF1` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `security_resource` (`ID`),
  CONSTRAINT `FK6FD1850656E5FA71` FOREIGN KEY (`ROLE_ID`) REFERENCES `security_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_resource_role` */

insert  into `security_resource_role`(`RESOURCE_ID`,`ROLE_ID`) values (2,2),(3,2),(4,2),(5,2),(7,2),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4);

/*Table structure for table `security_role` */

DROP TABLE IF EXISTS `security_role`;

CREATE TABLE `security_role` (
  `ID` bigint(20) NOT NULL,
  `DESCN` varchar(200) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_role` */

insert  into `security_role`(`ID`,`DESCN`,`NAME`) values (2,'管理员','ROLE_ADMIN'),(3,'用户','ROLE_USER'),(4,'测试用户','ROLE_TEST');

/*Table structure for table `security_role_user` */

DROP TABLE IF EXISTS `security_role_user`;

CREATE TABLE `security_role_user` (
  `ROLE_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`),
  KEY `FK83C60473FC10BE51` (`USER_ID`),
  KEY `FK83C6047356E5FA71` (`ROLE_ID`),
  CONSTRAINT `FK83C6047356E5FA71` FOREIGN KEY (`ROLE_ID`) REFERENCES `security_role` (`ID`),
  CONSTRAINT `FK83C60473FC10BE51` FOREIGN KEY (`USER_ID`) REFERENCES `security_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_role_user` */

insert  into `security_role_user`(`ROLE_ID`,`USER_ID`) values (3,22),(4,22),(3,27),(2,29),(3,29),(4,29),(3,30),(2,34),(3,35);

/*Table structure for table `security_user` */

DROP TABLE IF EXISTS `security_user`;

CREATE TABLE `security_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `DESCN` varchar(200) DEFAULT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `TRUENAME` varchar(50) DEFAULT NULL,
  `SEX` tinyint(4) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `TEL` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `DUTY` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT '0',
  `DEPT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK338C89EC6176F411` (`DEPT_ID`),
  CONSTRAINT `FK338C89EC6176F411` FOREIGN KEY (`DEPT_ID`) REFERENCES `security_dept` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `security_user` */

insert  into `security_user`(`ID`,`USERNAME`,`EMAIL`,`DESCN`,`CODE`,`TRUENAME`,`SEX`,`BIRTHDAY`,`TEL`,`MOBILE`,`DUTY`,`PASSWORD`,`STATUS`,`DEPT_ID`) values (22,'test2','echo_o@163.com','test',NULL,'test',0,'2007-09-23 00:00:00','111111','11111111111','无','098f6bcd4621d373cade4e832627b4f6',0,1),(23,'test1','test','test',NULL,'afdasdf',0,'2007-09-27 00:00:00','asdfasdf','sdfasdf','sdf','098f6bcd4621d373cade4e832627b4f6',0,3),(27,'aaa','aa','销售部的aaa',NULL,'aaa',0,'2007-09-27 00:00:00','d','aaa','aa','aa',0,3),(28,'122222','222','',NULL,'22222',1,'2007-09-27 00:00:00','222','22','222','2222222',0,5),(29,'admin','admin@mba.com','管理员',NULL,'万里鹏',0,'2007-09-27 00:00:00','test','test','tset','098f6bcd4621d373cade4e832627b4f6',1,1),(30,'user','echo_o@163.com','小兵',NULL,'user',NULL,'2007-09-28 00:00:00','11111111','11111111111','小兵','ee11cbb19052e40b07aac0ca060c23ee',1,2),(34,'wanlipeng','wanlipegn@qq.com','还是乱码吗',NULL,'万里鹏',NULL,NULL,NULL,NULL,'哈尔滨工业大学','wanlipeng',1,NULL),(35,'huzhichao','huzhichao@qq.com','不乱码',NULL,'胡志超',NULL,NULL,NULL,NULL,'123','huzhichao',1,NULL),(36,'wanlipeng1','wanlipeng@foxmail.com','SOS',NULL,NULL,NULL,NULL,NULL,NULL,'SOS','wanlipeng',0,NULL),(37,'yangshaoning','yangshaoning@126.com','我是二爷',NULL,NULL,NULL,'2012-07-14 21:41:08',NULL,NULL,'百度科技有限公司','yangshaoning',1,NULL),(38,'liyongjin','liyongjin@qq.com','我是金爷',NULL,'李永金',NULL,'2012-07-15 13:26:28',NULL,NULL,'哈工大软件','liyongjin',1,NULL),(39,'Helloworld','hit.huzhichao@gmail.com','无',NULL,'胡智超',NULL,'2012-07-15 17:00:09',NULL,NULL,'hit','huzhichao',2,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
