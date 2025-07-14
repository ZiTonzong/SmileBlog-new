/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : blog_cdk

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-05 08:49:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access_blog
-- ----------------------------
DROP TABLE IF EXISTS `access_blog`;
CREATE TABLE `access_blog` (
  `access_blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '用户访问的ip地址',
  `user_id` int(11) DEFAULT NULL COMMENT '访问博客的用户id（主键）',
  `access_time` datetime DEFAULT NULL COMMENT '用户访问博客的开始时间',
  PRIMARY KEY (`access_blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=976 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of access_blog
-- ----------------------------
INSERT INTO `access_blog` VALUES ('969', '11', '0:0:0:0:0:0:0:1', '0', '2018-09-03 00:00:00');
INSERT INTO `access_blog` VALUES ('970', '11', '0:0:0:0:0:0:0:1', '29', '2018-09-03 00:00:00');
INSERT INTO `access_blog` VALUES ('971', '11', '0:0:0:0:0:0:0:1', '29', '2018-09-03 00:00:00');
INSERT INTO `access_blog` VALUES ('972', '11', '0:0:0:0:0:0:0:1', '29', '2018-09-03 00:00:00');
INSERT INTO `access_blog` VALUES ('973', '11', '0:0:0:0:0:0:0:1', '29', '2018-09-03 00:00:00');
INSERT INTO `access_blog` VALUES ('974', '11', '0:0:0:0:0:0:0:1', '29', '2018-09-03 00:00:00');
INSERT INTO `access_blog` VALUES ('975', '11', '0:0:0:0:0:0:0:1', '29', '2018-09-03 00:00:00');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blog_id` int(20) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(50) DEFAULT NULL,
  `blog_desc` varchar(255) DEFAULT '' COMMENT '博客描述，用于首页显示',
  `article` varchar(20000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `from_user_id` int(11) NOT NULL DEFAULT '29' COMMENT '博客作者id',
  `category_id` int(1) NOT NULL DEFAULT '0' COMMENT '博客所属类别',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '博客的阅读次数',
  `cover_image` varchar(255) NOT NULL COMMENT '封面图片',
  `recommend` int(1) NOT NULL DEFAULT '0' COMMENT '作为推荐文章展示，默认为0-不推荐  1-推荐',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('11', 'Hello World!', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>带上耳机..</p>\r\n\r\n<p>迎着这有点干燥的秋风...</p>\r\n\r\n<p>渐渐地喜欢独自一人带着这疲惫的身躯...</p>\r\n\r\n<p>逛着只剩2个月的校园...</p>\r\n\r\n<p>感叹着时间的匆匆...</p>\r\n\r\n<p>回忆着过去的往事...</p>\r\n\r\n<p>而我的身影也会越来越消极?</p>\r\n\r\n<hr />\r\n<p>人生应该就像一段编程...</p>\r\n\r\n<p>因为不同的人生经历...</p>\r\n\r\n<p>程序也会存在各种的bug...</p>\r\n\r\n<p>需要我们不断优化自身算法、除去身边的bug、不断添加函数的过程...</p>\r\n\r\n<p>我们刚出生那一刻，上天只给了我们一个程序的入口----主函数(人生的类)</p>\r\n\r\n<p>同时为我们定义了两个自带的方法一个是哭()，以及一个是活着()</p>\r\n\r\n<p>而有的人却因为缺少程序入口而夭折...</p>\r\n\r\n<p>小时候我们不断的使用哭这一方法，返回值却是js的var型或是php的$</p>\r\n\r\n<p>因为我们的哭，会给我们带来各种各样的结果，每个结果，都会对我们产生不同的影响。</p>\r\n\r\n<p>每个人都有自己的生活轨迹，每个人，也都有自己独特的方。</p>\r\n\r\n<p>有时候，我们会去ctrl+c别人的生活方式，再 ctrl+v 到自己的主体中来，却发现，在别人那运行好好的代码，来到自己身上却存在n个bug...</p>\r\n\r\n<p>也难怪，对象都不同，变量又怎么能通用呢</p>\r\n\r\n<p>我们不断往自己的主体中添加各种各样的方法，却从不管自身的稳定性。</p>\r\n\r\n<p>有时候，并不是知道越多越好</p>\r\n\r\n<p>相反，拥有得越少，人生运行得反而更快</p>\r\n\r\n<p>因为程序存在这很多种分支，正如人生有很多十字路口...</p>\r\n\r\n<p>小学时 if（you are clever）{获得老师赞赏，同学亲近}else{缺少朋友}</p>\r\n\r\n<p>高考时刻 &nbsp;if（得到好的成绩）{上大学} else{去打工}</p>\r\n\r\n<p>当然了，并不是说就一定去打工，只不过这里讨论的是大多数而已</p>\r\n\r\n<p>时间一年一年流逝，程序一行一行执行，期间必然会遇到各种各样的问题...</p>\r\n\r\n<p>有的人，走偏了，还能回来，而有的人，却进入了个无限递归的死循环</p>\r\n\r\n<p>最终以爆栈结束了整个程序，也结束了整个人生。</p>\r\n\r\n<p>每个人都有自己的计划，人们用广搜决定了自己的人生，再用深搜去过着每一天</p>\r\n\r\n<p>但并不是每个人都是算法高手，有的人深搜能回来，有的人却没能定义好自己的回溯条件。</p>\r\n\r\n<p>生活就像boolean，并每道题都能一个true/false的结果，如果返回了false对你的人生也并不是一件坏事。</p>\r\n\r\n<p>面对考试，我们为自己定义了一系列封装好的类，里面有考试作弊技巧，或者是自己的所有复习知识点等等，遇到考试时，便直接调用</p>\r\n\r\n<p>遇到面试，我们已将面试官要问的各种问题都AI式的准备好了关键词自动回答</p>\r\n\r\n<p>我们生活的每一天，仿佛都是在for循环过一天()这样的方法而已，日服一日，年复一年，永远不知道循环什么时候结束，也永远不知道程序什么时候崩溃。</p>\r\n\r\n<p>大部分人都认为程序员很难找到对象，却不知道我们每天都得花十几个小时在某个对象身上，毕竟自己new出来的对象，跪着也要把bug找出来</p>\r\n\r\n<p>我们就这样一直生活着，直到某一天我们遇到了另一段程序，彼此间互相调用其内部的方法，不分彼此。</p>\r\n\r\n<p>为对方提供着自己的interface，但并不是每个interface都是稳定的，或许她会看上别的object，最终离你而去。</p>\r\n\r\n<p>并不是每个函数都会抛出exception，也并不是你的每一个决定都会有人提示你是好是坏</p>\r\n\r\n<p>最终的结果，也只有你最后执行junit中的@Test方法，实行了单元测试后你才会知道结果是否报错</p>\r\n\r\n<p>我们人生不断的运行着，好似每天的任务都规定死了...</p>\r\n\r\n<p>学生就是:吃饭，睡觉，学习...</p>\r\n\r\n<p>工作者就是:吃饭,睡觉，工作...</p>\r\n\r\n<p>吃饭和睡觉这两大方法，我们从我们祖先那继承得倒是挺不错的</p>\r\n\r\n<p>不仅仅继承了，还扩展了各式各样的吃法，以及各式各样的睡法。</p>\r\n\r\n<p>有少部分人想要强行hack别人的主体，于是乎，便衍生了犯罪</p>\r\n\r\n<p>人人都想自己的程序稳定运行，因为这个程序，只有你自己才能好好调试，别人的代码，永远只是适合来参考</p>\r\n\r\n<p>我们的吃喝拉撒都是循环着进行的</p>\r\n\r\n<p>若某天的突发状况，不正是中断处理程序吗?</p>\r\n\r\n<p>有时候，同一时间段，你会进行着各式各样的工作，多个线程的运行，会让你不堪重负，你想删掉其中某个</p>\r\n\r\n<p>却发现它们之间有着千丝万缕的关系</p>\r\n\r\n<p>但你却不知道，有时候放弃，也是一直用收获。</p>\r\n\r\n<p>自己的程序是由自己一步一歩调试运维而来的</p>\r\n\r\n<p>自己设计的算法，需要自己的不断剪枝与修改来完善的</p>\r\n\r\n<p>适当的回溯，才不会让你陷入死循环，重新回到自己的主体，做回自己。</p>\r\n\r\n<p>随着时间的推移，我们越来越少的调用哭泣这一方法</p>\r\n\r\n<p>更多的，我们擅长于伪装，谎言，以及猜测</p>\r\n\r\n<p>这也许也是人生多姿多彩的地方吧</p>\r\n\r\n<p>若人生只是一段程序，我们应该写出自己的curd</p>\r\n\r\n<p>若人生只是一段程序，我们更应该自己完善好自己</p>\r\n\r\n<p>若人生只是一段程序，我们则要时时警醒自己，防止病毒的入侵，以及深搜的无止境...</p>\r\n\r\n<p><a href=\"http://qn.199604.com/wp-content/uploads/2017/10/you3-277x300.jpg\" target=\"_blank\"><img alt=\"\" src=\"http://qn.199604.com/wp-content/uploads/2017/10/you3-277x300.jpg\" style=\"height:300px; width:277px\" /></a></p>\r\n', '2017-11-12', '29', '0', '39', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('12', 'xxx', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'xxxx', '2017-11-05', '29', '0', '12', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('13', 'test13-update', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>test13-updatetime</p>\r\n', '	2017-11-15', '29', '0', '8', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('14', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '测试推荐科技博客1', '2017-11-05', '29', '0', '7', 'default0.jpg', '1');
INSERT INTO `blog` VALUES ('15', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '测试推荐科技博客2', '2017-11-05', '29', '0', '13', 'default0.jpg', '1');
INSERT INTO `blog` VALUES ('16', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '测试推荐科技博客3', '2017-11-05', '29', '0', '13', 'default0.jpg', '1');
INSERT INTO `blog` VALUES ('17', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'test', '2017-11-05', '29', '0', '5', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('18', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'test', '2017-11-05', '29', '0', '11', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('19', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'test', '2017-11-05', '29', '0', '2', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('20', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'test', '2017-11-05', '29', '0', '10', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('21', 'test', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'test', '2017-11-05', '29', '0', '1', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('25', 'Hello World!-update', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>Hello World!-update</p>\r\n', '2017-11-15', '29', '0', '4', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('34', 'ss', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>ss</p>\r\n', '2017-11-15', '29', '0', '5', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('35', '代码', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'kkkkkkkkkkk', '2017-11-27', '29', '0', '4', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('37', '2317', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>Hello World!</p>上看看看看看西南222水水水水水水水水水水水水水水水水水水水2222', '2017-12-05', '29', '0', '5', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('38', '2121', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>Hello World!</p>\r\n', '2017-12-05', '29', '0', '1', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('40', 'ojbk', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>Hello World!</p>\r\n222222222222222222222111133333大尺度的水水水水水水水水水水水水水水水水水水水', '2017-12-12', '29', '0', '5', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('41', '汉成帝', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '<p>随着年龄增长，刘骜开始终日沉湎于玩乐，生母王皇后也不得元帝宠幸。&nbsp;[3]<a name=\"ref_[3]_90727\">&nbsp;</a></p>\r\n\r\n<p>建昭四年（前35年），<a href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%B1%B1%E5%93%80%E7%8E%8B\" target=\"_blank\">中山哀王</a>刘竟去世，太子刘骜前往吊丧。<a href=\"https://baike.baidu.com/item/%E5%88%98%E7%AB%9F/1354796\" target=\"_blank\">刘竟</a>是汉元帝的幼弟，和刘骜游学一块长大。汉元帝望见刘骜，感动怀念刘竟，悲伤不能自止，但刘骜到了跟前却没有哀伤的表情，汉元帝很恼火地说：&ldquo;哪里会有一个人不慈和仁爱却可以奉祀宗庙，作百姓父母的呢！&nbsp;[4]<a name=\"ref_[4]_90727\">&nbsp;</a>&nbsp;&rdquo;意思就是说刘骜不配人主。汉元帝把这番话告诉了自己的宠臣，曾被他诏令护佑太子的史丹[5]<a name=\"ref_[5]_90727\">&nbsp;</a>&nbsp;，史丹脱下帽子向汉元帝谢罪说：&ldquo;臣的确见陛下哀痛中山王，到了因为感伤而伤身的情况。早上太子准备进见，臣私自嘱咐不要哭泣，以免陛下感伤。罪在臣下，当死。&rdquo;汉元帝听后，责怪的意思才慢慢消解。&nbsp;[6]<a name=\"ref_[6]_90727\">&nbsp;</a></p>\r\n\r\n<p>元帝曾想改立宠妃<a href=\"https://baike.baidu.com/item/%E5%82%85%E6%98%AD%E4%BB%AA\" target=\"_blank\">傅昭仪</a>之子，&ldquo;多才艺&rdquo;的山阳王<a href=\"https://baike.baidu.com/item/%E5%88%98%E5%BA%B7\" target=\"_blank\">刘康</a>（汉元帝第二子，哀帝<a href=\"https://baike.baidu.com/item/%E5%88%98%E6%AC%A3\" target=\"_blank\">刘欣</a>之父）为太子&nbsp;[7]<a name=\"ref_[7]_90727\">&nbsp;</a>&nbsp;，因为刘骜是宣帝爱孙以及史丹力保刘骜太子之位的缘故，元帝没有付诸实施。</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/item/%E7%AB%9F%E5%AE%81\" target=\"_blank\">竟宁</a>元年（前33年），汉元帝病卧后宫，傅昭仪及其儿子定陶王刘康，常在榻前侍奉，而皇后<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E6%94%BF%E5%90%9B\" target=\"_blank\">王政君</a>和太子刘骜却难得见上皇帝一面。王政君和刘骜忧心忡忡，一筹莫展。就在这关键时刻，史丹借着贴身宠臣的身份可以直入寝殿探病，趁寝殿中只有元帝一人时，独自闯入室内，伏在元帝床前声泪俱下地为太子求情。元帝心肠软，&ldquo;优游不断&rdquo;，见史丹泣不成声，竟大为感动，长长叹了一口气，表示不会废黜太子。史丹听后心里有底，连连叩头请罪。汉元帝接着说：&ldquo;我的病恐怕不会有好转的可能，希望你好好辅佐皇太子，不要辜负我的重托！&rdquo;刘骜皇太子的地位这才稳定下来。&nbsp;[8]<a name=\"ref_[8]_90727\">&nbsp;</a></p>\r\n\r\n<p><a name=\"1_3\"></a><a name=\"sub90727_1_3\"></a><a name=\"继承帝位\"></a><a name=\"1-3\"></a></p>\r\n\r\n<h3>继承帝位</h3>\r\n\r\n<p>竟宁元年（前33年）五月，汉元帝<a href=\"https://baike.baidu.com/item/%E5%88%98%E5%A5%AD\" target=\"_blank\">刘奭</a>崩。六月，皇太子刘骜继承皇位，是为汉成帝。刘骜的母亲王政君被尊为皇太后，从此外戚王氏家族登上了西汉的政治舞台，也为后来的<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E8%8E%BD/399974\" target=\"_blank\">王莽</a>乱国埋下了伏笔。&nbsp;[9-10]<a name=\"ref_[9-10]_90727\">&nbsp;</a></p>\r\n\r\n<p><a name=\"1_4\"></a><a name=\"sub90727_1_4\"></a><a name=\"外戚擅权\"></a><a name=\"1-4\"></a></p>\r\n\r\n<h3>外戚擅权</h3>\r\n\r\n<p>外戚王氏擅权之所以得以实现，与汉成帝关系非常密切，当时外戚和宦官势力不断坐大，汉成帝便采取了一系列制衡政策。</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/pic/%E5%88%98%E9%AA%9C/1637782/0/00e93901213fb80e5c8e05af30d12f2eb938946e?fr=lemma&amp;ct=single\" target=\"_blank\"><img alt=\"王莽\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=3d2e0047dff9d72a1364171fe42b282a/00e93901213fb80e5c8e05af30d12f2eb938946e.jpg\" style=\"height:287px; margin:0px auto; width:197px\" /></a>王莽</p>\r\n\r\n<p>首先，汉成帝利用外戚打击宦官势力。汉成帝用明升暗降的办法任命权臣<a href=\"https://baike.baidu.com/item/%E7%9F%B3%E6%98%BE/5503\" target=\"_blank\">石显</a>为长信中太仆，使其离开权力中心丧失实权，然后丞相<a href=\"https://baike.baidu.com/item/%E5%8C%A1%E8%A1%A1\" target=\"_blank\">匡衡</a>和御史大夫张谭等人联名上疏揭露石显及其党羽过去的罪恶。石显被免官逐回家乡，死于中途，其走卒也纷纷被免官。</p>\r\n\r\n<p>其次，汉成帝利用外戚和朝臣抑制另一派外戚。成帝继位，<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E5%87%A4/5504\" target=\"_blank\">王凤</a>首先排挤了能力强、名声大的冯昭仪的弟弟<a href=\"https://baike.baidu.com/item/%E5%86%AF%E9%87%8E%E7%8E%8B\" target=\"_blank\">冯野王</a>，又迫使许皇后之父<a href=\"https://baike.baidu.com/item/%E8%AE%B8%E5%98%89\" target=\"_blank\">许嘉</a>引退。</p>\r\n\r\n<p>再次，王凤排挤丞相<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E5%95%86/5507\" target=\"_blank\">王商</a>。王商的父亲王武是汉宣帝的舅舅，堂兄<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E6%8E%A5\" target=\"_blank\">王接</a>曾任大司马车骑将军。这也是一支活跃于元、成政坛上的外戚家族。当时惟一能与王凤相抗衡的，就是王商。王商在政坛上稳步高升，不但有外戚家族的背景，而且政治识见和能力，都不在王凤之下。两人在许多问题上议论不同，关系渐渐紧张。王凤与外戚史丹合谋，派人秘密调查王商的隐私，又教唆频阳（今陕西富平）人耿定上疏诬陷王商。汉成帝觉得难以查证，可是王凤坚持要查办，成帝无奈，只得免去王商的丞相职务。王商被免相仅三日，就大口吐血，悲愤而死。其子弟亲戚有在宫中任职的，一律被赶出<a href=\"https://baike.baidu.com/item/%E9%95%BF%E5%AE%89%E5%9F%8E/10262101\" target=\"_blank\">长安城</a>。至此，王凤专制朝政，已没有了强大的反对派。&nbsp;[10]<a name=\"ref_[10]_90727\">&nbsp;</a></p>\r\n\r\n<p>汉成帝的制衡政策运用的并不成功，太后王氏一族势力不断壮大，成为最后的胜利者。太后<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E6%94%BF%E5%90%9B\" target=\"_blank\">王政君</a>的七个兄弟都被封侯，老大<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E5%87%A4/5504\" target=\"_blank\">王凤</a>官位高至大司马大将军领尚书事，王政君的侄子<a href=\"https://baike.baidu.com/item/%E7%8E%8B%E8%8E%BD/399974\" target=\"_blank\">王莽</a>也开始崭露头角，王商死后，朝中再无可以节制王氏一族的力量，这一切都为王莽篡汉创造了条件。&nbsp;[2]<a name=\"ref_[2]_90727\">&nbsp;</a><a name=\"ref_2\"></a></p>\r\n\r\n<p><a name=\"1_5\"></a><a name=\"sub90727_1_5\"></a><a name=\"荒淫无道\"></a><a name=\"1-5\"></a></p>\r\n\r\n<h3>荒淫无道</h3>\r\n\r\n<p>在还未继承帝位的时候，汉成帝就已经沉湎于酒色，登基之后更肆无忌惮。汉成帝有一个男宠<a href=\"https://baike.baidu.com/item/%E5%BC%A0%E6%94%BE/3996417\" target=\"_blank\">张放</a>，史书上记载他&ldquo;少年殊丽，性开敏&rdquo;&nbsp;[10]<a name=\"ref_[10]_90727\">&nbsp;</a>&nbsp;。汉成帝对他十分宠爱，平日里&ldquo;与上卧起，宠爱殊绝&rdquo;，还将张放提拔成中郎将，两人经常一起微服私访，汉成帝在外出游玩时假称是张放的家人，由此可见张放当时受宠的程度。&nbsp;[11]<a name=\"ref_[11]_90727\">&nbsp;</a></p>\r\n\r\n<p>此事引起了朝臣的不满，各种言论传到了太后王政君的耳中，再加上几个国舅的煽风点火，太后就将张放以莫须有的罪名流放。汉成帝不堪思念之苦，多次召张放回京团聚，之后又迫于压力把张放放逐，据史书记载，&ldquo;故常涕泣而遣之&rdquo;&nbsp;[12]<a name=\"ref_[12]_90727\">&nbsp;</a>&nbsp;，如此反反复复，除此之外成帝还&ldquo;玺书劳问不绝&rdquo;，千里传递书信；之后则顾忌宠妃赵氏姐妹不再进行；而张放则&ldquo;思慕哭泣而死&rdquo;。&nbsp;[12]<a name=\"ref_[12]_90727\">&nbsp;</a></p>\r\n\r\n<p>汉成帝即位起，就花了大量金钱，建造霄游宫、飞行殿和云雷宫供自己淫乐。他最初专宠少年结发妻子<a href=\"https://baike.baidu.com/item/%E8%AE%B8%E7%9A%87%E5%90%8E/6316804\" target=\"_blank\">许皇后</a>，前后20年，生了一儿一女，皆夭折，这引起了王氏集团的担心无嗣，让汉成帝恩宠六宫，后来许皇后色衰，成帝便也移情别恋，开始宠爱<a href=\"https://baike.baidu.com/item/%E7%8F%AD%E5%A9%95%E5%A6%A4/69953\" target=\"_blank\">班婕妤</a>。班婕妤生了一个男孩，数月即夭折。班婕妤美而不艳，丽而不俗，又博通文史，知书达礼，她没有一般女子&ldquo;好妒&rdquo;的毛病，把侍女<a href=\"https://baike.baidu.com/item/%E6%9D%8E%E5%B9%B3/4595\" target=\"_blank\">李平</a>进献给汉成帝，李平又得宠幸，也被封为婕妤。汉成帝说：&ldquo;当初孝武帝的<a href=\"https://baike.baidu.com/item/%E5%8D%AB%E7%9A%87%E5%90%8E/1220258\" target=\"_blank\">卫皇后</a>也从微贱而起。&rdquo;因此赐李平姓&ldquo;卫&rdquo;，她就成了<a href=\"https://baike.baidu.com/item/%E5%8D%AB%E5%A9%95%E5%A6%A4/14676157\" target=\"_blank\">卫婕妤</a>。&nbsp;[10]<a name=\"ref_[10]_90727\">&nbsp;</a></p>\r\n\r\n<p><a name=\"1_6\"></a><a name=\"sub90727_1_6\"></a><a name=\"飞燕争宠\"></a><a name=\"1-6\"></a></p>\r\n\r\n<h3>飞燕争宠</h3>\r\n\r\n<p>汉成帝时曾经有数次灾异现世，<a href=\"https://baike.baidu.com/item/%E5%88%98%E5%90%91/197150\" target=\"_blank\">刘向</a>、<a href=\"https://baike.baidu.com/item/%E8%B0%B7%E6%B0%B8\" target=\"_blank\">谷永</a>等大臣皆归咎于许皇后，说是由于她&ldquo;专宠&rdquo;造成的。于是，许皇后的&ldquo;椒房掖廷用度&rdquo;被减省，甚至最后连皇帝的面也见不上了。许皇后一肚子怨气无从发泄，她的姐姐、平安侯夫人许谒背地里巫蛊恶毒诅咒后宫有身孕的妃子。此事被成帝的另一宠妃<a href=\"https://baike.baidu.com/item/%E8%B5%B5%E9%A3%9E%E7%87%95/40226\" target=\"_blank\">赵飞燕</a>揭发，许谒等人巫蛊被处死，许皇后连坐被废黜，后来被赐死。&nbsp;[13]<a name=\"ref_[13]_90727\">&nbsp;</a></p>\r\n\r\n<p>皇后的位置空缺两年，成帝有册立赵飞燕为后的想法，太后王政君以其身世低微、非侯门女为由阻拦。后由<a href=\"https://baike.baidu.com/item/%E6%B7%B3%E4%BA%8E%E9%95%BF\" target=\"_blank\">淳于长</a>从中斡旋，汉成帝封赵飞燕的父亲为成阳侯，赵飞燕成了侯门之女，才登上了皇后的宝座。</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/item/%E6%B0%B8%E5%A7%8B/8660\" target=\"_blank\">永始</a>元年（前16年），汉成帝立赵飞燕为皇后，同时晋赵合德为昭仪，又把昭阳殿赐给赵合德一人居住。为了感谢淳于长斡旋之功，成帝赐淳于长<a href=\"https://baike.baidu.com/item/%E5%85%B3%E5%86%85%E4%BE%AF\" target=\"_blank\">关内侯</a>，不久又封为定陵侯。</p>\r\n\r\n<p><a name=\"1_7\"></a><a name=\"sub90727_1_7\"></a><a name=\"燕啄皇孙\"></a><a name=\"1-7\"></a></p>\r\n', '2018-08-13', '29', '0', '16', 'default0.jpg', '0');
INSERT INTO `blog` VALUES ('42', '美女33', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf', '2018-08-17', '29', '1', '0', 'default1.jpg', '1');
INSERT INTO `blog` VALUES ('43', '11旅行11', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf2', '2018-08-17', '29', '1', '0', 'default1.jpg', '1');
INSERT INTO `blog` VALUES ('44', 'test3', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf23美女2', '2018-08-17', '29', '1', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('45', 'test4', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf234', '2018-08-17', '29', '1', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('46', 'test5', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf2345', '2018-08-17', '29', '1', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('47', 'test6', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf23456', '2018-08-17', '29', '1', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('48', 'test7', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', '11111ddf23457', '2018-08-17', '29', '1', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('49', 'smile1', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle233', '2018-08-17', '29', '2', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('50', 'smile2', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2334', '2018-08-17', '29', '2', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('51', 'smile3', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2335', '2018-08-17', '29', '2', '6', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('52', 'smile4', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2336', '2018-08-17', '29', '2', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('53', 'smile5', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-17', '29', '2', '9', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('54', 'smile7', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-17', '29', '2', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('55', 'smile8', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-17', '29', '2', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('56', 'smile6', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-17', '29', '2', '0', 'default.jpg', '0');
INSERT INTO `blog` VALUES ('57', '叫醒耳朵', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-20', '29', '3', '3', 'default2.png', '0');
INSERT INTO `blog` VALUES ('58', '叫醒耳朵2', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-20', '29', '3', '0', 'default2.png', '0');
INSERT INTO `blog` VALUES ('59', '叫醒耳朵3', 'smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述smile博客描述描述', 'simle2337', '2018-08-19', '29', '3', '8', 'default2.png', '0');
INSERT INTO `blog` VALUES ('60', '33333333', 'smile博客描述描述smile博客描述描述smile博客描述描述smil..', '<p>记录下自己的点点滴滴....44444</p>\r\n', '2018-08-28 22:49:23', '29', '2', '2', 'EA564353401F4C6BBA116D3AE71D67A3.jpeg', '0');
INSERT INTO `blog` VALUES ('61', '哇哇哇哇', 'smile博客描述描述smile博客描述描述smile博客描述描述smil..', '<p>char去掉字符串末尾的空格示例：</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/pic/varchar/2848323/0/86d6277f9e2f07083fcbe1b5ea24b899a801f2bd?fr=lemma&amp;ct=single\" target=\"_blank\"><img alt=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D250/sign=1840f1a141a7d933bba8e3769d4ad194/86d6277f9e2f07083fcbe1b5ea24b899a801f2bd.jpg\" style=\"height:120px; margin:0px auto; width:250px\" /></a></p>\r\n\r\n<p>varchar不会去掉<a href=\"https://baike.baidu.com/item/%E5%AD%97%E7%AC%A6%E4%B8%B2\" target=\"_blank\">字符串</a>末尾的空格示例：</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/pic/varchar/2848323/0/4d086e061d950a7b4868ada90bd162d9f2d3c97a?fr=lemma&amp;ct=single\" target=\"_blank\"><img alt=\"\" src=\"https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=c8628cf2a50f4bfb88d09956334e788f/4d086e061d950a7b4868ada90bd162d9f2d3c97a.jpg\" style=\"height:118px; margin:0px auto; width:220px\" /></a></p>\r\n', '2018-08-28 22:59:56', '29', '0', '2', '41DAAE89EA9C48D3A8E0D016F0C3187D.jpeg', '0');
INSERT INTO `blog` VALUES ('62', 'ssssssssssaaaaaaa', 'smile博客描述描述smile博客描述描述smile博客描述描述smil..', '<p>sccc</p>\r\n\r\n<p><strong>bgggooooo</strong></p>\r\n\r\n<p>cd</p>\r\n\r\n<p>cdddccc</p>\r\n', '2018-08-29 17:47:57', '20', '0', '2', 'BF94F64F40754D01B4E916F37E9CA43C.jpeg', '0');

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `diary_id` int(20) NOT NULL AUTO_INCREMENT,
  `diary` varchar(10000) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `from_user_id` int(11) NOT NULL DEFAULT '29' COMMENT '日志作者id',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '日志阅读次数',
  PRIMARY KEY (`diary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES ('1', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2017-11-05', '29', '0');
INSERT INTO `diary` VALUES ('2', '心情1', '2017-11-05', '29', '0');
INSERT INTO `diary` VALUES ('3', '心情1', '2017-11-05', '29', '0');
INSERT INTO `diary` VALUES ('4', '心情1', '2017-11-05', '29', '0');
INSERT INTO `diary` VALUES ('5', '心情1', '2017-11-05', '29', '0');
INSERT INTO `diary` VALUES ('6', '\r\n心情1', '2017-11-05', '29', '0');
INSERT INTO `diary` VALUES ('14', 'Hello World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('15', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('16', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('17', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('18', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('19', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('20', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('21', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('22', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('23', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('24', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('35', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('36', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('37', 'World!', '2017-11-12', '29', '0');
INSERT INTO `diary` VALUES ('49', '我爱炸鸡', '2017-12-05', '29', '0');
INSERT INTO `diary` VALUES ('50', '有新功能啦', '2017-12-05', '29', '0');
INSERT INTO `diary` VALUES ('51', 'Hello World!111', '2017-12-06', '29', '0');
INSERT INTO `diary` VALUES ('52', '记录一下，今天更新了link的功能', '2017-12-12', '29', '0');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('12', '更新后', 'http://baidu.com');
INSERT INTO `link` VALUES ('10', '记忆角落', 'http://199604.com');
INSERT INTO `link` VALUES ('13', '测试', 'http://199604.com');
INSERT INTO `link` VALUES ('14', '记忆角落', 'http://199604.com');
INSERT INTO `link` VALUES ('15', 'demo', 'http://199604.com');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `permission_roleId` (`role_id`),
  CONSTRAINT `permission_roleId` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'admin:*', '1');
INSERT INTO `permission` VALUES ('2', 'user:*', '2');

-- ----------------------------
-- Table structure for remark
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark` (
  `remark_id` int(20) NOT NULL AUTO_INCREMENT,
  `blog_id` int(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `from_user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`remark_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `remark_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remark
-- ----------------------------
INSERT INTO `remark` VALUES ('1', '11', 'nice是', '2018-07-14 15:30:00', '29');
INSERT INTO `remark` VALUES ('2', '11', 'aaa', '2018-07-17 15:30:00', '30');
INSERT INTO `remark` VALUES ('3', '11', 'qvb', '2018-08-17 15:30:00', '31');
INSERT INTO `remark` VALUES ('4', '11', 'uioo', '2018-08-17 15:30:00', '29');
INSERT INTO `remark` VALUES ('5', '11', 'aaaaaaaaac长长的安事是', '2018-09-17 15:30:00', '31');
INSERT INTO `remark` VALUES ('6', '11', '阿三v的', '2018-09-19 18:30:00', '29');
INSERT INTO `remark` VALUES ('7', '11', '三十四', '2018-09-19 19:30:00', '29');
INSERT INTO `remark` VALUES ('8', '11', '2223', '2018-08-25 17:36:08', '29');
INSERT INTO `remark` VALUES ('9', '11', '245d', '2018-08-25 17:36:28', '29');
INSERT INTO `remark` VALUES ('10', '11', '水水水水', '2018-08-25 17:36:42', '29');
INSERT INTO `remark` VALUES ('11', '11', '搜索', '2018-08-25 17:37:02', '29');
INSERT INTO `remark` VALUES ('12', '11', '啊啊', '2018-08-25 17:37:13', '29');
INSERT INTO `remark` VALUES ('13', '11', '杀杀杀啊1s', '2018-08-25 17:37:40', '29');
INSERT INTO `remark` VALUES ('14', '11', '12', '2018-08-25 17:37:48', '29');
INSERT INTO `remark` VALUES ('15', '11', '122', '2018-08-25 17:37:59', '29');
INSERT INTO `remark` VALUES ('16', '11', '2', '2018-08-25 17:38:51', '29');
INSERT INTO `remark` VALUES ('17', '11', '345', '2018-08-25 17:40:58', '29');
INSERT INTO `remark` VALUES ('18', '11', 'df', '2018-08-25 17:41:18', '29');
INSERT INTO `remark` VALUES ('19', '12', '33', '2018-08-25 17:46:05', '29');
INSERT INTO `remark` VALUES ('20', '11', '的', '2018-08-26 18:56:16', '17');
INSERT INTO `remark` VALUES ('21', '13', '托特纳', '2018-08-27 17:51:34', '20');
INSERT INTO `remark` VALUES ('22', '15', 'yy', '2018-08-27 19:55:44', '29');
INSERT INTO `remark` VALUES ('23', '17', 'jj', '2018-08-27 19:56:45', '29');
INSERT INTO `remark` VALUES ('24', '15', 'xb水水水水', '2018-08-28 09:05:13', '29');
INSERT INTO `remark` VALUES ('25', '60', '45', '2018-08-28 22:50:26', '29');
INSERT INTO `remark` VALUES ('26', '62', 'ggg\noooo\n', '2018-08-29 17:49:26', '20');
INSERT INTO `remark` VALUES ('27', '41', 'hhh在这种', '2018-08-29 18:55:51', '20');
INSERT INTO `remark` VALUES ('28', '57', 'wwq', '2018-08-30 08:48:43', '17');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(20) NOT NULL AUTO_INCREMENT,
  `blog_id` int(20) DEFAULT NULL,
  `remark_id` int(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `from_user_id` int(20) DEFAULT NULL,
  `to_user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `remark_id` (`remark_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`remark_id`) REFERENCES `remark` (`remark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '11', '1', 'nice1', '2018-07-14 15:35:03', '31', '29');
INSERT INTO `reply` VALUES ('2', '11', '1', 'qww', '2018-07-14 17:35:03', '17', '31');
INSERT INTO `reply` VALUES ('3', '11', '2', 'qqqr', '2018-07-20 17:35:03', '31', '30');
INSERT INTO `reply` VALUES ('4', '11', '1', '回复4', '2018-07-21 17:35:03', '31', '17');
INSERT INTO `reply` VALUES ('5', '11', '3', '回复5', '2018-07-21 17:37:03', '29', '31');
INSERT INTO `reply` VALUES ('6', '11', '3', '回复6', '2018-07-21 17:38:03', '31', '29');
INSERT INTO `reply` VALUES ('7', '11', '1', '回复7', '2018-07-21 17:39:03', '29', '31');
INSERT INTO `reply` VALUES ('8', '11', '2', '大的啊啊啊啊啊啊00002', '2018-08-26 16:38:33', '29', '30');
INSERT INTO `reply` VALUES ('9', '11', '3', '玩玩玩玩玩玩啊', '2018-08-26 16:38:58', '29', '31');
INSERT INTO `reply` VALUES ('10', '11', '10', '玩玩是2222aaaaaa', '2018-08-26 16:39:28', '29', '29');
INSERT INTO `reply` VALUES ('11', '11', '2', 'eeeeeww', '2018-08-26 17:50:58', '17', '30');
INSERT INTO `reply` VALUES ('12', '11', '3', 'sssss2dddddd顶顶顶顶顶', '2018-08-26 17:51:11', '17', '31');
INSERT INTO `reply` VALUES ('13', '11', '8', 'sssss2dddddd顶顶顶顶顶444', '2018-08-26 18:52:39', '17', '29');
INSERT INTO `reply` VALUES ('14', '11', '3', 'sssss2dddddd顶顶顶顶顶4444442', '2018-08-26 18:53:25', '17', '29');
INSERT INTO `reply` VALUES ('15', '11', '3', '是', '2018-08-26 18:53:54', '17', '29');
INSERT INTO `reply` VALUES ('16', '11', '3', '是5', '2018-08-26 18:54:50', '17', '29');
INSERT INTO `reply` VALUES ('17', '11', '3', '是5', '2018-08-26 18:54:50', '17', '31');
INSERT INTO `reply` VALUES ('18', '11', '3', '是5', '2018-08-26 18:54:50', '17', '31');
INSERT INTO `reply` VALUES ('19', '11', '3', '是5', '2018-08-26 18:54:50', '17', '29');
INSERT INTO `reply` VALUES ('20', '11', '5', '是5', '2018-08-26 18:54:50', '17', '31');
INSERT INTO `reply` VALUES ('21', '11', '3', '是5', '2018-08-26 18:54:50', '17', '31');
INSERT INTO `reply` VALUES ('22', '11', '20', '是5从', '2018-08-26 18:56:29', '17', '17');
INSERT INTO `reply` VALUES ('23', '13', '21', 'dea\n       ', '2018-08-27 19:53:57', '29', '20');
INSERT INTO `reply` VALUES ('24', '15', '22', 'fffb', '2018-08-27 19:55:54', '29', '29');
INSERT INTO `reply` VALUES ('25', '15', '22', 'fffbff5', '2018-08-27 19:56:08', '29', '29');
INSERT INTO `reply` VALUES ('26', '15', '22', 'fffbff5', '2018-08-27 19:56:08', '29', '29');
INSERT INTO `reply` VALUES ('27', '15', '22', 'fffbff5', '2018-08-27 19:56:08', '29', '29');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `role` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gravatar_img` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `code` varchar(64) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`user_id`),
  KEY `roleId` (`role_id`),
  CONSTRAINT `roleId` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin@199604.com', 'https://s.gravatar.com/avatar/162d8d081d380691c5279df2bbef4152?s=32', '1', null, '1');
INSERT INTO `user` VALUES ('17', 'user', 'user', 'admin@199604.com', 'https://s.gravatar.com/avatar/162d8d081d380691c5279df2bbef4152?s=32', '1', null, '2');
INSERT INTO `user` VALUES ('20', 'test', 'test', 'post@199604.com', 'https://s.gravatar.com/avatar/b1242a3996a2638ec152ccf31556934b?s=32', '1', null, '2');
INSERT INTO `user` VALUES ('29', '111', '123456', '715167986@qq.com', 'https://s.gravatar.com/avatar/5d8cd72abfcc907b49b70de6a504f881', '1', 'A56AE06AEDF44C1C892571BA4733CA53D505026D673C4C21ACAC52B22AE8A20A', '2');
INSERT INTO `user` VALUES ('30', '111248', '123456', 'cdkandztz@foxmail.com', 'https://s.gravatar.com/avatar/d3d83f4ffc938717f1bd93c94373195a', '0', '9548171452F740A186C355638271899A4560EA947F9F43FA8CB31F67C67B53B9', '2');
INSERT INTO `user` VALUES ('31', '1113', '123456', '715167986@qq.com', 'https://s.gravatar.com/avatar/5d8cd72abfcc907b49b70de6a504f881', '0', 'DAE2E664432D46D08A0A7921CC3C31599B89661B74A44717B42A7743A5264BB8', '2');
INSERT INTO `user` VALUES ('32', '11132', '123456', '715167986@qq.com', 'https://s.gravatar.com/avatar/5d8cd72abfcc907b49b70de6a504f881', '1', null, '2');
INSERT INTO `user` VALUES ('33', '11134', '123456', '715167986@qq.com', 'https://s.gravatar.com/avatar/5d8cd72abfcc907b49b70de6a504f881', '1', null, '2');
INSERT INTO `user` VALUES ('34', '123456', '123456', '715167986@qq.com', 'https://s.gravatar.com/avatar/5d8cd72abfcc907b49b70de6a504f881', '1', null, '2');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` int(11) NOT NULL,
  `user_nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `user_age` int(2) NOT NULL DEFAULT '0',
  `user_email` varchar(255) DEFAULT NULL,
  `user_url` varchar(255) DEFAULT NULL,
  `user_about` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  `user_head_img` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `user_points` int(5) NOT NULL DEFAULT '0' COMMENT '用户积分，发表一篇博客—+5分',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'xx', '21', 'admin@199604.com', 'http://199604.com', 'xx', 'defaulthead.jpg', '0');
INSERT INTO `userinfo` VALUES ('17', '西安', '16', '23455@qq.com', 'http://cdk1997.top', 'aaaascccd', 'default.jpg', '0');
INSERT INTO `userinfo` VALUES ('20', 'testnick', '34', '3344@fe.com', 'www.smileblog.com', '我走的很慢，但我从不后退', '5C783D2311E441ABA549C6DBAB2434BC.jpeg', '7');
INSERT INTO `userinfo` VALUES ('29', 'cdk1', '21', '715167986@qq.com', 'http://199604.com', '我从不后退', '9483E3F6B1204BB5A467FCEE748B0F9A.jpeg', '275');
INSERT INTO `userinfo` VALUES ('30', '西安30', '16', '23455@qq.com', 'http://cdk1997.top', 'aaaascccd2', 'default.jpg', '0');
INSERT INTO `userinfo` VALUES ('31', '西安31', '17', '23455@qq.com', 'http://cdk1997.top', 'aaaascccdss', 'default.jpg', '0');
INSERT INTO `userinfo` VALUES ('33', '11134', '0', '715167986@qq.com', 'www.smileblog.com', '<font style=\'color:gray;\'>（默认签名）</font>欢迎来到smile博客！smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，给一些热爱写作的网友提供了一个很好的平台。', 'defaulthead.jpg', '0');
