# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20016
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 8.0.27)
# 数据库: datawhale
# 生成时间: 2021-12-12 09:18:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 activity
# ------------------------------------------------------------

CREATE TABLE `activity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '活动名称',
  `description` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '活动描述',
  `registration_link` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报名链接',
  `registration_end_time` timestamp NULL DEFAULT NULL COMMENT '报名截止时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动表';

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;

INSERT INTO `activity` (`id`, `name`, `description`, `registration_link`, `registration_end_time`, `create_time`, `modify_time`)
VALUES
	(1,'一起来啃南瓜书','快来参加吧','http://www.shadowingszy.top','2021-12-07 00:00:00','2021-12-05 00:00:00','2021-12-10 13:11:26'),
	(2,'校招面试常见问题盘点','快来参加吧','http://www.shadowingszy.top','2021-12-10 00:00:00','2021-12-05 01:00:00','2021-12-10 13:11:42'),
	(3,'深度学习入门','快来参加吧','http://www.shadowingszy.top','2021-12-13 00:00:00','2021-12-05 01:00:00','2021-12-10 13:11:49'),
	(4,'服务端开发组队学习','快来参加吧','http://www.shadowingszy.top','2021-11-10 00:00:00','2021-11-05 01:00:00','2021-12-10 13:11:59'),
	(5,'前端开发组队学习','快来参加吧','http://www.shadowingszy.top','2021-12-15 00:00:00','2021-11-05 01:00:00','2021-12-10 13:12:04');

/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 banner
# ------------------------------------------------------------

CREATE TABLE `banner` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `image_url` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '轮播图片链接',
  `description` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '轮播图描述',
  `status` int DEFAULT NULL COMMENT '轮播图状态，10可用，20不可用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轮播图内容表';

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

INSERT INTO `banner` (`id`, `image_url`, `description`, `status`, `create_time`, `modify_time`)
VALUES
	(1,'http://www.shadowingszy.top/homepage/assets/images/image1.jpg','测试banner1',10,'2021-12-05 00:00:00','2021-12-05 18:34:14'),
	(2,'http://www.shadowingszy.top/homepage/assets/images/image2.jpg','测试banner2',10,'2021-12-05 00:00:00','2021-12-05 18:34:19');

/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 knowledge
# ------------------------------------------------------------

CREATE TABLE `knowledge` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '知识体系id',
  `name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '知识体系名称',
  `content` text CHARACTER SET utf8mb4 COMMENT '知识体系内容，json格式',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='知识体系表';



# 转储表 learn
# ------------------------------------------------------------

CREATE TABLE `learn` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '学习id',
  `name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '学习名称',
  `description` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '学习描述',
  `image_url` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '学习封面图',
  `like` int DEFAULT NULL COMMENT '学习点赞数',
  `license` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '开源协议',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习表';

LOCK TABLES `learn` WRITE;
/*!40000 ALTER TABLE `learn` DISABLE KEYS */;

INSERT INTO `learn` (`id`, `name`, `description`, `image_url`, `like`, `license`, `create_time`, `modify_time`)
VALUES
	(1,'南瓜书','南瓜书(PumpkinBook)”，对《机器学习》(西瓜书)里比较难理解的公式加以解析，以及对部分公式补充具体的推导细节。','http://www.shadowingszy.top/homepage/assets/images/image1.jpg',50,'MIT','2021-12-05 00:00:00','2021-12-10 14:39:18'),
	(2,'机器学习','机器学习是一门多领域交叉学科，专门研究计算机怎样模拟或实现人类的学习行为，以获取新的知识或技能。','http://www.shadowingszy.top/homepage/assets/images/image2.jpg',20,'MIT','2021-12-05 00:00:00','2021-12-10 13:12:24'),
	(3,'校招面经','校园招聘面试经验，包含前端后端算法等多种热门岗位。','http://www.shadowingszy.top/homepage/assets/images/image3.jpg',10,'MIT','2021-12-05 00:00:00','2021-12-10 14:36:12');

/*!40000 ALTER TABLE `learn` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 learn_detail
# ------------------------------------------------------------

CREATE TABLE `learn_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '学习章节id',
  `learn_id` int DEFAULT NULL COMMENT '学习id',
  `title` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '章节标题',
  `content` text CHARACTER SET utf8mb4 COMMENT '章节内容，md5格式',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习章节内容表';

LOCK TABLES `learn_detail` WRITE;
/*!40000 ALTER TABLE `learn_detail` DISABLE KEYS */;

INSERT INTO `learn_detail` (`id`, `learn_id`, `title`, `content`, `create_time`, `modify_time`)
VALUES
	(1,1,'chapter1','## 1.1\n$$E_{o t e}\\left(\\mathfrak{L}_{a} | X, f\\right)=\\sum_{h} \\sum_{\\boldsymbol{x} \\in \\mathcal{X}-X} P(\\boldsymbol{x}) \\mathbb{I}(h(\\boldsymbol{x}) \\neq f(\\boldsymbol{x})) P\\left(h | X, \\mathfrak{L}_{a}\\right)$$\n[解析]：参见公式(1.2)\n\n## 1.2\n$$\\begin{aligned}\n\\sum_{f}E_{ote}(\\mathfrak{L}_a\\vert X,f) &= \\sum_f\\sum_h\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x})\\mathbb{I}(h(\\boldsymbol{x})\\neq f(\\boldsymbol{x}))P(h\\vert X,\\mathfrak{L}_a) \\\\\n&=\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x}) \\sum_hP(h\\vert X,\\mathfrak{L}_a)\\sum_f\\mathbb{I}(h(\\boldsymbol{x})\\neq f(\\boldsymbol{x})) \\\\\n&=\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x}) \\sum_hP(h\\vert X,\\mathfrak{L}_a)\\cfrac{1}{2}2^{\\vert \\mathcal{X} \\vert} \\\\\n&=\\cfrac{1}{2}2^{\\vert \\mathcal{X} \\vert}\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x}) \\sum_hP(h\\vert X,\\mathfrak{L}_a) \\\\\n&=2^{\\vert \\mathcal{X} \\vert-1}\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x}) \\cdot 1\\\\\n\\end{aligned}$$\n[解析]：第1步到第2步：\n$$\\begin{aligned}\n&\\sum_f\\sum_h\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x})\\mathbb{I}(h(\\boldsymbol{x})\\neq f(\\boldsymbol{x}))P(h\\vert X,\\mathfrak{L}_a) \\\\\n&=\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x})\\sum_f\\sum_h\\mathbb{I}(h(\\boldsymbol{x})\\neq f(\\boldsymbol{x}))P(h\\vert X,\\mathfrak{L}_a) \\\\\n&=\\sum_{\\boldsymbol{x}\\in\\mathcal{X}-X}P(\\boldsymbol{x}) \\sum_hP(h\\vert X,\\mathfrak{L}_a)\\sum_f\\mathbb{I}(h(\\boldsymbol{x})\\neq f(\\boldsymbol{x})) \\\\\n\\end{aligned}$$\n第2步到第3步：首先要知道此时我们对$f$的假设是任何能将样本映射到{0,1}的函数且服从均匀分布，也就是说不止一个$f$且每个$f$出现的概率相等，例如样本空间只有两个样本时：$ \\mathcal{X}=\\{\\boldsymbol{x}_1,\\boldsymbol{x}_2\\},\\vert \\mathcal{X} \\vert=2$，那么所有的真实目标函数$f$为：\n$$\\begin{aligned}\nf_1:f_1(\\boldsymbol{x}_1)=0,f_1(\\boldsymbol{x}_2)=0;\\\\\nf_2:f_2(\\boldsymbol{x}_1)=0,f_2(\\boldsymbol{x}_2)=1;\\\\\nf_3:f_3(\\boldsymbol{x}_1)=1,f_3(\\boldsymbol{x}_2)=0;\\\\\nf_4:f_4(\\boldsymbol{x}_1)=1,f_4(\\boldsymbol{x}_2)=1;\n\\end{aligned}$$\n一共$2^{\\vert \\mathcal{X} \\vert}=2^2=4$个真实目标函数。所以此时通过算法$\\mathfrak{L}_a$学习出来的模型$h(\\boldsymbol{x})$对每个样本无论预测值为0还是1必然有一半的$f$与之预测值相等，例如，现在学出来的模型$h(\\boldsymbol{x})$对$\\boldsymbol{x}_1$的预测值为1，也即$h(\\boldsymbol{x}_1)=1$，那么有且只有$f_3$和$f_4$与$h(\\boldsymbol{x})$的预测值相等，也就是有且只有一半的$f$与它预测值相等，所以$\\sum_f\\mathbb{I}(h(\\boldsymbol{x})\\neq f(\\boldsymbol{x})) = \\cfrac{1}{2}2^{\\vert \\mathcal{X} \\vert}$；第3步一直到最后显然成立。值得一提的是，在这里我们假设真实的目标函数$f$为“任何能将样本映射到{0,1}的函数且服从均匀分布”，但是实际情形并非如此，通常我们只认为能高度拟合已有样本数据的函数才是真实目标函数，例如，现在已有的样本数据为$\\{(\\boldsymbol{x}_1,0),(\\boldsymbol{x}_2,1)\\}$，那么此时$f_2$才是我们认为的真实目标函数，由于没有收集到或者压根不存在$\\{(\\boldsymbol{x}_1,0),(\\boldsymbol{x}_2,0)\\},\\{(\\boldsymbol{x}_1,1),(\\boldsymbol{x}_2,0)\\},\\{(\\boldsymbol{x}_1,1),(\\boldsymbol{x}_2,1)\\}$这类样本，所以$f_1,f_3,f_4$都不算是真实目标函数。这也就是西瓜书公式(1.3)下面的第3段话举的“骑自行车”的例子所想表达的内容。\n','2021-12-10 12:43:49','2021-12-12 16:57:39'),
	(2,1,'chapter2','## 2.20\n$$\\text{AUC}=\\frac{1}{2}\\sum_{i=1}^{m-1}(x_{i+1} - x_i)\\cdot(y_i + y_{i+1})$$\n[解析]：在解释$\\text{AUC}$公式之前，我们需要先弄清楚$\\text{ROC}$曲线的具体绘制过程，下面我们就举个例子，按照西瓜书图2.4下方给出的绘制方法来讲解一下$\\text{ROC}$曲线的具体绘制过程。假设我们已经训练得到一个学习器$f(s)$，现在用该学习器来对我们的8个测试样本（4个正例，4个反例，也即$m^+=m^-=4$）进行预测，假设预测结果为：\n$$(s_1,0.77,+),(s_2,0.62,-),(s_3,0.58,+),(s_4,0.47,+),(s_5,0.47,-),(s_6,0.33,-),(s_7,0.23,+),(s_8,0.15,-)$$\n其中，$+$和$-$分别表示为正例和为反例，里面的数字表示学习器$f(s)$预测该样本为正例的概率，例如对于反例$s_2$来说，当前学习器$f(s)$预测它是正例的概率为$0.62$。根据西瓜书上给出的绘制方法可知，首先需要对所有测试样本按照学习器给出的预测结果进行排序（上面给出的预测结果已经按照预测值从大到小排好），接着将分类阈值设为一个不可能取到的最大值，显然这时候所有样本预测为正例的概率都一定小于分类阈值，那么预测为正例的样本个数为0，相应的真正例率和假正例率也都为0，所以此时我们可以在坐标$(0,0)$处打一个点。接下来我们需要把分类阈值从大到小依次设为每个样本的预测值，也就是依次设为$0.77、0.62、0.58、0.47、0.33、0.23、0.15$，然后每次计算真正例率和假正例率，再在相应的坐标上打一个点，最后再将各个点用直线串连起来即可得到$\\text{ROC}$曲线。需要注意的是，在统计预测结果时，预测值等于分类阈值的样本也算作预测为正例。例如，当分类阈值为$0.77$时，测试样本$s_1$被预测为正例，由于它的真实标记也是正例，所以此时$s_1$是一个真正例。为了便于绘图，我们将$x$轴（假正例率轴）的“步长”定为$\\frac{1}{m^-}$，$y$轴（真正例率轴）的“步长”定为$\\frac{1}{m^+}$，这样的话，根据真正例率和假正例率的定义可知，每次变动分类阈值时，若新增$i$个假正例，那么相应的$x$轴坐标也就增加$\\frac{i}{m^-}$，同理，若新增$j$个真正例，那么相应的$y$轴坐标也就增加$\\frac{j}{m^+}$。\n\n在这里我们为了能在解析公式(2.21)时复用此图所以没有写上具体地数值，转而用其数学符号代替。其中绿色线段表示在分类阈值变动的过程中只新增了真正例，红色线段表示只新增了假正例，蓝色线段表示既新增了真正例也新增了假正例。根据$\\text{AUC}$值的定义可知，此时的$\\text{AUC}$值其实就是所有红色线段和蓝色线段与$x$轴围成的面积之和。观察上图可知，红色线段与$x$轴围成的图形恒为矩形，蓝色线段与$x$轴围成的图形恒为梯形，但是由于梯形面积公式既能算梯形面积，也能算矩形面积，所以无论是红色线段还是蓝色线段，其与$x$轴围成的面积都能用梯形公式来计算，也即\n$$\\frac{1}{2}\\cdot(x_{i+1} - x_i)\\cdot(y_i + y_{i+1})$$\n其中，$(x_{i+1} - x_i)$表示“高”，$y_i$表示“上底”，$y_{i+1}$表示“下底”。那么\n$$\\sum_{i=1}^{m-1}\\left[\\frac{1}{2}\\cdot(x_{i+1} - x_i)\\cdot(y_i + y_{i+1})\\right]$$\n表示的便是对所有红色线段和蓝色线段与$x$轴围成的面积进行求和，此即为$\\text{AUC}$\n\n## 2.21\n$$\\ell_{rank}=\\frac{1}{m^+m^-}\\sum_{\\boldsymbol{x}^+ \\in D^+}\\sum_{\\boldsymbol{x}^- \\in D^-}\\left(\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\frac{1}{2}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right)$$\n[解析]：按照我们上述对公式(2.20)的解析思路，$\\ell_{rank}$可以看作是所有绿色线段和蓝色线段与$y$轴围成的面积之和，但是公式(2.21)很难一眼看出其面积的具体计算方式，因此我们需要将公式(2.21)进行恒等变形\n$$\\begin{aligned}\n\\ell_{rank}&=\\frac{1}{m^+m^-}\\sum_{\\boldsymbol{x}^+ \\in D^+}\\sum_{\\boldsymbol{x}^- \\in D^-}\\left(\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\frac{1}{2}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right) \\\\\n&=\\frac{1}{m^+m^-}\\sum_{\\boldsymbol{x}^+ \\in D^+}\\left[\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\frac{1}{2}\\cdot\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right] \\\\\n&=\\sum_{\\boldsymbol{x}^+ \\in D^+}\\left[\\frac{1}{m^+}\\cdot\\frac{1}{m^-}\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\frac{1}{2}\\cdot\\frac{1}{m^+}\\cdot\\frac{1}{m^-}\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right] \\\\\n&=\\sum_{\\boldsymbol{x}^+ \\in D^+}\\frac{1}{2}\\cdot\\frac{1}{m^+}\\cdot\\left[\\frac{2}{m^-}\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\frac{1}{m^-}\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right] \\\\\n\\end{aligned}$$\n根据公式(2.20)中给出的$\\text{ROC}$曲线图可知，在变动分类阈值的过程当中，如果有新增真正例，那么相应地就会增加一条绿色线段或蓝色线段，所以上式中的$\\sum\\limits_{\\boldsymbol{x}^+ \\in D^+}$可以看作是在遍历所有绿色和蓝色线段，那么相应地$\\sum\\limits_{\\boldsymbol{x}^+ \\in D^+}$后面的那一项便是在求绿色线段或者蓝色线段与$y$轴围成的面积，也即\n$$\\frac{1}{2}\\cdot\\frac{1}{m^+}\\cdot\\left[\\frac{2}{m^-}\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\frac{1}{m^-}\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right]$$\n同公式(2.20)中的求解思路一样，不论是绿色线段还是蓝色线段，其与$y$轴围成的图形面积都可以用梯形公式来进行计算，所以上式表示的依旧是一个梯形的面积求解公式。其中$\\frac{1}{m^+}$即为梯形的“高”，中括号中的那一项便是“上底+下底”，下面我们来分别推导一下“上底”（较短的那个底）和“下底”。由于在绘制$\\text{ROC}$曲线的过程中，每新增一个假正例时$x$坐标也就新增一个单位，所以对于“上底”，也就是绿色或者蓝色线段的下端点到$y$轴的距离，它就等于$\\frac{1}{m^-}$乘以预测值比$\\boldsymbol{x^+}$大的假正例的个数，也即\n$$\\frac{1}{m^-}\\sum\\limits_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)$$\n而对于“下底”，它就等于$\\frac{1}{m^-}$乘以预测值大于等于$\\boldsymbol{x^+}$的假正例的个数，也即\n$$\\frac{1}{m^-}\\left(\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)<f(\\boldsymbol{x}^-)\\right)+\\sum_{\\boldsymbol{x}^- \\in D^-}\\mathbb{I}\\left(f(\\boldsymbol{x}^+)=f(\\boldsymbol{x}^-)\\right)\\right)$$\n\n## 2.27\n\n$$\\overline{\\epsilon}=\\max \\epsilon\\quad \\text { s.t. } \\sum_{i= \\epsilon_{0} \\times m+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) \\epsilon^{i}(1-\\epsilon)^{m-i}<\\alpha$$\n\n[推导]：截至2018年12月，第一版第30次印刷，公式（2.27）应当勘误修正为\n$$\\overline{\\epsilon}=\\min \\epsilon\\quad\\text { s.t. } \\sum_{i=\\epsilon\\times m+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) \\epsilon_0^{i}(1-\\epsilon_0)^{m-i}<\\alpha$$\n具体推导过程如下：由西瓜书中的上下文可知，对$\\epsilon\\leq\\epsilon_0$进行假设检验，等价于附录①中所述的对$p\\leq p_0$进行假设检验，所以在西瓜书中求解最大错误率$\\overline{\\epsilon}$等价于在附录①中求解事件最大发生频率$\\frac{\\overline{C}}{m}$。由附录①可知\n$$\\overline{C}=\\min C\\quad\\text { s.t. } \\sum_{i=C+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p_0^{i}(1-p_0)^{m-i}<\\alpha$$\n所以\n$$\\frac{\\overline{C}}{m}=\\min \\frac{C}{m}\\quad\\text { s.t. } \\sum_{i=C+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p_0^{i}(1-p_0)^{m-i}<\\alpha$$\n将上式中的$\\frac{\\overline{C}}{m},\\frac{C}{m},p_0$等价替换为$\\overline{\\epsilon},\\epsilon,\\epsilon_0$可得\n$$\\overline{\\epsilon}=\\min \\epsilon\\quad\\text { s.t. } \\sum_{i=\\epsilon\\times m+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) \\epsilon_0^{i}(1-\\epsilon_0)^{m-i}<\\alpha$$\n\n## 2.41\n\n$$\\begin{aligned} \nE(f ; D)=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-y_{D}\\right)^{2}\\right] \\\\\n=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})+\\bar{f}(\\boldsymbol{x})-y_{D}\\right)^{2}\\right] \\\\\n=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}\\right]+\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)^{2}\\right] \\\\ &+\\mathbb{E}_{D}\\left[+2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)\\right] \\\\\n=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}\\right]+\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)^{2}\\right] \\\\\n=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}\\right]+\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y+y-y_{D}\\right)^{2}\\right] \\\\\n=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}\\right]+\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y\\right)^{2}\\right]+\\mathbb{E}_{D}\\left[\\left(y-y_{D}\\right)^{2}\\right]\\\\ &+2 \\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y\\right)\\left(y-y_{D}\\right)\\right]\\\\\n=& \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}\\right]+\\left(\\bar{f}(\\boldsymbol{x})-y\\right)^{2}+\\mathbb{E}_{D}\\left[\\left(y_{D}-y\\right)^{2}\\right] \\end{aligned}$$\n\n[解析]：\n- 第1-2步：减一个$\\bar{f}(\\boldsymbol{x})$再加一个$\\bar{f}(\\boldsymbol{x})$，属于简单的恒等变形；\n- 第2-3步：首先将中括号里面的式子展开\n$$\\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}+\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)^{2}+2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)\\right]$$\n然后根据期望的运算性质：$\\mathbb{E}[X+Y]=\\mathbb{E}[X]+\\mathbb{E}[Y]$可将上式化为\n$$ \\mathbb{E}_{D}\\left[\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)^{2}\\right]+\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)^{2}\\right] +\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)\\right]$$\n- 第3-4步：再次利用期望的运算性质将第3步得到的式子的最后一项展开\n$$\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)\\right] = \\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot\\bar{f}(\\boldsymbol{x})\\right] - \\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot y_{D}\\right]$$\n	- 首先计算展开后得到的第一项\n$$\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot\\bar{f}(\\boldsymbol{x})\\right] = \\mathbb{E}_{D}\\left[2f(\\boldsymbol{x} ; D)\\cdot\\bar{f}(\\boldsymbol{x})-2\\bar{f}(\\boldsymbol{x})\\cdot\\bar{f}(\\boldsymbol{x})\\right]$$\n由于$\\bar{f}(\\boldsymbol{x})$是常量，所以由期望的运算性质：$\\mathbb{E}[AX+B]=A\\mathbb{E}[X]+B$（其中$A,B$均为常量）可得\n$$\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot\\bar{f}(\\boldsymbol{x})\\right] = 2\\bar{f}(\\boldsymbol{x})\\cdot\\mathbb{E}_{D}\\left[f(\\boldsymbol{x} ; D)\\right]-2\\bar{f}(\\boldsymbol{x})\\cdot\\bar{f}(\\boldsymbol{x})$$\n由公式（2.37）可知：$\\mathbb{E}_{D}\\left[f(\\boldsymbol{x} ; D)\\right]=\\bar{f}(\\boldsymbol{x})$，所以\n$$\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot\\bar{f}(\\boldsymbol{x})\\right] = 2\\bar{f}(\\boldsymbol{x})\\cdot\\bar{f}(\\boldsymbol{x})-2\\bar{f}(\\boldsymbol{x})\\cdot\\bar{f}(\\boldsymbol{x})=0$$\n	- 接着计算展开后得到的第二项\n$$\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot y_{D}\\right]=2\\mathbb{E}_{D}\\left[f(\\boldsymbol{x} ; D)\\cdot y_{D}\\right]-2\\bar{f}(\\boldsymbol{x})\\cdot \\mathbb{E}_{D}\\left[y_{D}\\right]$$\n由于噪声和$f$无关，所以$f(\\boldsymbol{x} ; D)$和$y_D$是两个相互独立的随机变量，所以根据期望的运算性质：$\\mathbb{E}[XY]=\\mathbb{E}[X]\\mathbb{E}[Y]$（其中$X$和$Y$为相互独立的随机变量）可得\n$$\\begin{aligned} \n\\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot y_{D}\\right]&=2\\mathbb{E}_{D}\\left[f(\\boldsymbol{x} ; D)\\cdot y_{D}\\right]-2\\bar{f}(\\boldsymbol{x})\\cdot \\mathbb{E}_{D}\\left[y_{D}\\right] \\\\\n&=2\\mathbb{E}_{D}\\left[f(\\boldsymbol{x} ; D)\\right]\\cdot \\mathbb{E}_{D}\\left[y_{D}\\right]-2\\bar{f}(\\boldsymbol{x})\\cdot \\mathbb{E}_{D}\\left[y_{D}\\right] \\\\\n&=2\\bar{f}(\\boldsymbol{x})\\cdot \\mathbb{E}_{D}\\left[y_{D}\\right]-2\\bar{f}(\\boldsymbol{x})\\cdot \\mathbb{E}_{D}\\left[y_{D}\\right] \\\\\n&= 0\n\\end{aligned}$$\n所以\n$$\\begin{aligned} \\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\left(\\bar{f}(\\boldsymbol{x})-y_{D}\\right)\\right] &= \\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot\\bar{f}(\\boldsymbol{x})\\right] - \\mathbb{E}_{D}\\left[2\\left(f(\\boldsymbol{x} ; D)-\\bar{f}(\\boldsymbol{x})\\right)\\cdot y_{D}\\right] \\\\\n&= 0+0 \\\\\n&=0\n\\end{aligned}$$\n- 第4-5步：同第1-2步一样，减一个$y$再加一个$y$，属于简单的恒等变形；\n- 第5-6步：同第2-3步一样，将最后一项利用期望的运算性质进行展开；\n- 第6-7步：因为$\\bar{f}(\\boldsymbol{x})$和$y$均为常量，所以根据期望的运算性质可知，第6步中的第2项可化为\n$$\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y\\right)^{2}\\right]=\\left(\\bar{f}(\\boldsymbol{x})-y\\right)^{2}$$\n同理，第6步中的最后一项可化为\n$$2\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y\\right)\\left(y-y_{D}\\right)\\right]=2\\left(\\bar{f}(\\boldsymbol{x})-y\\right)\\mathbb{E}_{D}\\left[\\left(y-y_{D}\\right)\\right]$$\n由于此时假设噪声的期望为零，也即$\\mathbb{E}_{D}\\left[\\left(y-y_{D}\\right)\\right]=0$，所以\n$$2\\mathbb{E}_{D}\\left[\\left(\\bar{f}(\\boldsymbol{x})-y\\right)\\left(y-y_{D}\\right)\\right]=2\\left(\\bar{f}(\\boldsymbol{x})-y\\right)\\cdot 0=0$$\n\n## 附录\n### ①二项分布参数$p$的检验<sup>[1]</sup>\n设某事件发生的概率为$p$，$p$未知，作$m$次独立试验，每次观察该事件是否发生，以$X$记该事件发生的次数，则$X$服从二项分布$B(m,p)$，现根据$X$检验如下假设：\n$$\\begin{aligned}\nH_0:p\\leq p_0\\\\\nH_1:p > p_0\n\\end{aligned}$$\n由二项分布本身的特性可知：$p$越小，$X$取到较小值的概率越大。因此，对于上述假设，一个直观上合理的检验为\n$$\\varphi:\\text{当}X\\leq C\\text{时接受}H_0,\\text{否则就拒绝}H_0$$\n其中，$C\\in N$表示事件最大发生次数。此检验对应的功效函数为\n$$\\begin{aligned}\n\\beta_{\\varphi}(p)&=P(X>C)\\\\\n&=1-P(X\\leq C) \\\\\n&=1-\\sum_{i=0}^{C}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p^{i} (1-p)^{m-i} \\\\\n&=\\sum_{i=C+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p^{i} (1-p)^{m-i} \\\\\n\\end{aligned}$$\n由于“$p$越小，$X$取到较小值的概率越大”可以等价表示为：$P(X\\leq C)$是关于$p$的减函数（更为严格的数学证明参见参考文献[1]中第二章习题7），所以$\\beta_{\\varphi}(p)=P(X>C)=1-P(X\\leq C)$是关于$p$的增函数，那么当$p\\leq p_0$时，$\\beta_{\\varphi}(p_0)$即为$\\beta_{\\varphi}(p)$的上确界。又因为，根据参考文献[1]中5.1.3的定义1.2可知，检验水平$\\alpha$默认取最小可能的水平，所以在给定检验水平$\\alpha$时，可以通过如下方程解得满足检验水平$\\alpha$的整数$C$：\n$$\\alpha =\\sup \\left\\{\\beta_{\\varphi}(p)\\right\\}$$\n显然，当$p\\leq p_0$时：\n$$\\begin{aligned}\n\\alpha &=\\sup \\left\\{\\beta_{\\varphi}(p)\\right\\} \\\\\n&=\\beta_{\\varphi}(p_0) \\\\\n&=\\sum_{i=C+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p_0^{i} (1-p_0)^{m-i}\n\\end{aligned}$$\n对于此方程，通常不一定正好解得一个整数$C$使得方程成立，较常见的情况是存在这样一个$\\overline{C}$使得\n$$\\begin{aligned}\n\\sum_{i=\\overline{C}+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p_0^{i} (1-p_0)^{m-i}<\\alpha \\\\\n\\sum_{i=\\overline{C}}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p_0^{i} (1-p_0)^{m-i}>\\alpha\n\\end{aligned}$$\n此时，$C$只能取$\\overline{C}$或者$\\overline{C}+1$，若$C$取$\\overline{C}$，则相当于升高了检验水平$\\alpha$，若$C$取$\\overline{C}+1$则相当于降低了检验水平$\\alpha$，具体如何取舍需要结合实际情况，但是通常为了减小犯第一类错误的概率，会倾向于令$C$取$\\overline{C}+1$。下面考虑如何求解$\\overline{C}$：易证$\\beta_{\\varphi}(p_0)$是关于$C$的减函数，所以再结合上述关于$\\overline{C}$的两个不等式易推得\n$$\\overline{C}=\\min C\\quad\\text { s.t. } \\sum_{i=C+1}^{m}\\left(\\begin{array}{c}{m} \\\\ {i}\\end{array}\\right) p_0^{i}(1-p_0)^{m-i}<\\alpha$$\n\n## 参考文献\n[1]陈希孺编著.概率论与数理统计[M].中国科学技术大学出版社,2009.','2021-12-10 12:43:49','2021-12-10 12:48:26'),
	(3,2,'简介','## 什么是机器学习呢\n机器学习就是机器学习！','2021-12-10 12:43:49','2021-12-10 12:51:00'),
	(4,3,'校园招聘简介','## 什么是校园招聘呢\n校园招聘就是校园招聘！\n```javascript\nconsole.log(\'hello world!\')\n```','2021-12-10 12:43:49','2021-12-12 17:15:03');

/*!40000 ALTER TABLE `learn_detail` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 learn_tag
# ------------------------------------------------------------

CREATE TABLE `learn_tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `learn_id` int DEFAULT NULL COMMENT '学习id',
  `name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '标签名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习标签表';

LOCK TABLES `learn_tag` WRITE;
/*!40000 ALTER TABLE `learn_tag` DISABLE KEYS */;

INSERT INTO `learn_tag` (`id`, `learn_id`, `name`, `create_time`, `modify_time`)
VALUES
	(1,1,'python','2021-12-05 00:00:00','2021-12-05 19:11:05'),
	(2,1,'机器学习','2021-12-05 00:00:00','2021-12-05 19:11:09'),
	(3,2,'人工智能','2021-12-05 00:00:00','2021-12-05 19:11:12'),
	(4,3,'校园招聘','2021-12-05 00:00:00','2021-12-05 19:11:16'),
	(5,3,'面试','2021-12-05 00:00:00','2021-12-05 19:10:57');

/*!40000 ALTER TABLE `learn_tag` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 learn_video
# ------------------------------------------------------------

CREATE TABLE `learn_video` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '学习视频id',
  `learn_id` int DEFAULT NULL COMMENT '学习id',
  `title` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(512) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '视频url',
  `image_url` varchar(512) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '视频封面url',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习视频表';

LOCK TABLES `learn_video` WRITE;
/*!40000 ALTER TABLE `learn_video` DISABLE KEYS */;

INSERT INTO `learn_video` (`id`, `learn_id`, `title`, `video_url`, `image_url`, `create_time`, `modify_time`)
VALUES
	(1,1,'南瓜书入门','http://www.shadowingszy.top','http://www.shadowingszy.top/homepage/assets/images/image1.jpg','2021-12-10 12:43:49','2021-12-10 12:44:06'),
	(2,1,'南瓜书精讲','http://www.shadowingszy.top','http://www.shadowingszy.top/homepage/assets/images/image2.jpg','2021-12-10 12:43:49','2021-12-10 12:44:06');

/*!40000 ALTER TABLE `learn_video` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
