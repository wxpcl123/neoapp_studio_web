import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double devicePixelRatio;
  static double screenWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    screenWidth = _mediaQueryData.size.width;
  }
}

double getSize(double size) {
  return size / SizeConfig.devicePixelRatio;
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NeoApp设计工作室',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            ServiceSection(),
            StartANewProject(),
            RecentWorksSection(),
            FeedBackSection(),
            AboutSection(),
            SizedBox(height: 1000),
          ],
        ),
      ),
    );
  }
}

///
class FeedBackSection extends StatelessWidget {
  const FeedBackSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth > getSize(1080)
          ? getSize(1080)
          : getSize(1024),
      margin: EdgeInsets.only(top: getSize(50), bottom: getSize(50)),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SectionTitle(
            title: '收到的好评',
            subTitle: '您的十分满意, 我的百分努力!',
            decoColor: Colors.pink,
          ),
          FeedBackItemList(),
        ],
      ),
    );
  }
}

class FeedBackItemList extends StatelessWidget {
  final List<FeedBack> feedbacks = [
    FeedBack(
      name: 'Jodge Doge',
      color: Colors.amber[50],
      description:
      '    Neo先生有十多年的结构设计经验, 有丰富的产品设计思想, 为我们公司的产品提供了非常优秀的技术支撑, 完美实现了近10个产品的上市推广, 取得了长足的效益. 期待继续与Neo先生合作, 再续辉煌.',
      headImg:
      'https://neoapp.oss-cn-shanghai.aliyuncs.com/air_balloon_PNG19408.png',
    ),
    FeedBack(
      name: 'Cindy Zhao',
      color: Colors.lightBlue[50],
      description:
      '    Neo先生真是一个爱学习的人, 结构设计是他的专业, 软件编程是他的爱好, 这个爱好也在慢慢变成了他的专长. 用Flutter做的App可以完美运行于Android, IOS和Web端, 据说也快要能同时运行于MacOS和Windows端了, 真厉害.',
      headImg:
      'https://neoapp.oss-cn-shanghai.aliyuncs.com/supergirl_PNG30.png',
    ),
    FeedBack(
      name: 'Doctor Zhu',
      color: Colors.lime[100],
      description:
      '    我和Neo先生结识了3年, 当时我的公司刚起步, 找了Neo先生做顾问, 有了他的帮助, 迅速帮我搭建了结构团队, 并帮助建立了工作框架,  目前人员已经非常齐备了, 但我还是愿意继续找他协商一些较为麻烦的项目, 他经验真的很丰富.',
      headImg: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/ice_age_PNG10.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width =
    SizeConfig.screenWidth > getSize(1080) ? getSize(1080) : getSize(1024);
    double spacing = (width - getSize(330) * 3) / 2;
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(),
      ),
      child: Wrap(
        spacing: spacing,
        runSpacing: getSize(20),
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(
          feedbacks.length,
              (index) => FeedBackItem(
            feedBack: feedbacks[index],
          ),
        ),
      ),
    );
  }
}

class FeedBackItem extends StatefulWidget {
  FeedBackItem({Key key, this.feedBack}) : super(key: key);
  final FeedBack feedBack;

  @override
  _FeedBackItemState createState() => _FeedBackItemState();
}

class _FeedBackItemState extends State<FeedBackItem> {
  Duration duration = Duration(milliseconds: 200);
  bool _onHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: widget.feedBack.color,
      highlightColor: widget.feedBack.color,
      onHover: (onHover) {
        setState(() {
          _onHover = onHover;
        });
      },
      onTap: () {},
      child: Container(
        width: getSize(330),
        height: getSize(480),
        decoration: BoxDecoration(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedContainer(
              duration: duration,
              margin: EdgeInsets.only(top: getSize(60)),
              padding: EdgeInsets.all(getSize(30)),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: widget.feedBack.color,
                borderRadius: BorderRadius.circular(getSize(20)),
                boxShadow: [
                  if (_onHover)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, getSize(20)),
                      blurRadius: getSize(30),
                    ),
                ],
              ),
              child: Text(
                widget.feedBack.description,
                style: TextStyle(
                  fontSize: getSize(18),
                  letterSpacing: 1.5,
                  height: 1.5,
                ),
              ),
            ),
            Positioned(
              left: getSize(100),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: duration,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getSize(10)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (!_onHover)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, getSize(15)),
                            blurRadius: getSize(20),
                          ),
                      ],
                    ),
                    child: Image.network(
                      widget.feedBack.headImg,
                      fit: BoxFit.cover,
                      width: getSize(100),
                      height: getSize(100),
                    ),
                  ),
                  SizedBox(height: getSize(20)),
                  Text(
                    widget.feedBack.name,
                    style: TextStyle(
                      fontSize: getSize(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedBack {
  FeedBack({this.name, this.headImg, this.description, this.color});
  final String name;
  final String headImg;
  final String description;
  final Color color;
}

/// Recent Works Section
class RecentWorksSection extends StatelessWidget {
  const RecentWorksSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.2),
      ),
      child: Container(
        width: SizeConfig.screenWidth > getSize(1080)
            ? getSize(1080)
            : getSize(1024),
        padding: EdgeInsets.only(top: getSize(30), bottom: getSize(100)),
        child: Column(
          children: [
            SectionTitle(
              title: '可以看看最近的作品',
              subTitle: '案例展示',
              decoColor: Colors.green,
            ),
            SizedBox(height: getSize(50)),
            WorksCardList(),
          ],
        ),
      ),
    );
  }
}

class WorksCardList extends StatelessWidget {
  final List<Works> worksList = [
    Works(
        name: '高端彩超',
        simpDesc: '这是一台高端推车式彩超, 外形美观, 功能齐全, 备受好评.',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/xbit90_02.jpg'),
    Works(
        name: '中端彩超',
        simpDesc: '中端彩超, 苗条机身上, 完美整合了大屏+触屏+悬浮升降等功能',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/cbit9_01.jpg'),
    Works(
        name: '无人机套装',
        simpDesc: '酷帅外形, 4K 1600W像素, 智能返航, GPS定位的专业高清无人机',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/drone_360qx.png'),
    Works(
        name: '便携设备',
        simpDesc: '经典之作, 在关键的时期出现的关键之作, 托起公司发展的基石.',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/q9_01.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print('width = $width');
    return Container(
      width: getSize(1024),
      child: Wrap(
        spacing: getSize(10),
        alignment: WrapAlignment.spaceBetween,
        runSpacing: getSize(30),
        children: List.generate(
          worksList.length,
              (index) => WorksCard(
            works: worksList[index],
          ),
        ),
      ),
    );
  }
}

class WorksCard extends StatefulWidget {
  const WorksCard({Key key, this.works}) : super(key: key);

  final Works works;

  @override
  _WorksCardState createState() => _WorksCardState();
}

class _WorksCardState extends State<WorksCard> {
  Duration duration = Duration(milliseconds: 200);
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      onHover: (onHover) {
        setState(() {
          _onHover = onHover;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        width: getSize(500),
        height: getSize(280),
        //constraints: BoxConstraints(maxHeight: 280),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getSize(20)),
          boxShadow: [
            if (_onHover)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, getSize(20)),
                blurRadius: getSize(40),
              ),
          ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: duration,
              width: getSize(248),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.works.img),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(getSize(20)),
                  boxShadow: [
                    if (!_onHover)
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(getSize(10), 0),
                        blurRadius: getSize(20),
                      ),
                  ]),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(getSize(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.works.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getSize(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getSize(20)),
                    Text(
                      widget.works.simpDesc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getSize(18),
                        letterSpacing: 1.5,
                        height: 2,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('详细信息',
                          style: TextStyle(
                            fontSize: getSize(14),
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Works {
  final String name;
  final String simpDesc;
  final String img;

  Works({this.name, this.simpDesc, this.img});
}

///
class StartANewProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: width < getSize(1024)
          ? SingleChildScrollView(
          scrollDirection: Axis.horizontal, child: content(context))
          : content(context),
    );
  }

  Widget content(context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(height: getSize(150), color: Colors.white),
            Container(height: getSize(150), color: Colors.red.withOpacity(0.2)),
          ],
        ),
        Container(
          width: SizeConfig.screenWidth > getSize(1080)
              ? getSize(1080)
              : getSize(1024),
          padding: EdgeInsets.symmetric(
              horizontal: getSize(50), vertical: getSize(30)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getSize(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, getSize(30)),
                blurRadius: getSize(50),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                      'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_Opened_re_i38e.png',
                      width: getSize(128),
                      height: getSize(128),
                      fit: BoxFit.cover),
                  SizedBox(width: getSize(50)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '您有什么好想法吗?',
                        style: TextStyle(
                            fontSize: getSize(32),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                      SizedBox(height: getSize(20)),
                      Text(
                        '让我帮你实现吧',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getSize(18),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ],
              ),
              HoveredButton(
                borderRadius: getSize(32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Contact Me',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getSize(24),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: getSize(18)),
                    Icon(Icons.qr_code, size: getSize(48), color: Colors.white),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('微信扫描下面的二维码:'),
                      contentPadding: EdgeInsets.all(getSize(50)),
                      content: Container(
                        width: getSize(500),
                        height: getSize(500),
                        alignment: Alignment.center,
                        child: Image.network(
                          'https://neoapp.oss-cn-shanghai.aliyuncs.com/mywechat.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

///
class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth > getSize(1080)
          ? getSize(1080)
          : getSize(1024),
      padding: EdgeInsets.only(top: getSize(80), bottom: getSize(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: '我们能帮到您',
            subTitle: '专业, 全面, 从创意, 到落地',
            decoColor: Colors.red,
          ),
          ServiceItemCardList(),
        ],
      ),
    );
  }
}

class ServiceItemCardList extends StatelessWidget {
  final List<ServiceModel> serviceModels = [
    ServiceModel(
        serviceName: '软件开发',
        color: Colors.amber[200],
        serviceIcon:
        'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_file_sync_ot38.png'),
    ServiceModel(
        serviceName: '工业设计',
        color: Colors.lightGreen[200],
        serviceIcon:
        'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_lightbulb_moment_evxr.png'),
    ServiceModel(
        serviceName: '结构设计',
        color: Colors.orange[200],
        serviceIcon:
        'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_drone_surveillance_kjjg.png'),
    ServiceModel(
        serviceName: '产业链服务',
        color: Colors.cyan[200],
        serviceIcon:
        'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_factory_dy0a.png'),
  ];
  @override
  Widget build(BuildContext context) {
    double width =
    SizeConfig.screenWidth > getSize(1080) ? getSize(1080) : getSize(1024);
    double spacing = (width - getSize(240) * 4) / 3;
    return Wrap(
      spacing: spacing, //getSize(10),
      runSpacing: getSize(10),
      alignment: WrapAlignment.start,
      children: List.generate(serviceModels.length,
              (index) => ServiceItemCard(serviceModel: serviceModels[index])),
    );
  }
}

class ServiceItemCard extends StatefulWidget {
  const ServiceItemCard({Key key, this.serviceModel}) : super(key: key);
  final ServiceModel serviceModel;

  @override
  _ServiceItemCardState createState() => _ServiceItemCardState();
}

class _ServiceItemCardState extends State<ServiceItemCard> {
  Duration duration = Duration(milliseconds: 200);
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (isHover) {
        setState(() {
          _isHover = isHover;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        width: getSize(240),
        height: getSize(280),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: getSize(25)),
        decoration: BoxDecoration(
          color: widget.serviceModel.color,
          borderRadius: BorderRadius.circular(getSize(20)),
          boxShadow: [
            if (_isHover)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, getSize(20)),
                blurRadius: getSize(40),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              width: getSize(180),
              height: getSize(180),
              padding: EdgeInsets.all(getSize(28)),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!_isHover)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, getSize(20)),
                      blurRadius: getSize(30),
                    ),
                ],
              ),
              child: Image.network(
                widget.serviceModel.serviceIcon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getSize(20)),
            Text(
              widget.serviceModel.serviceName,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: getSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ServiceModel {
  ServiceModel({this.serviceName, this.color, this.serviceIcon});

  final String serviceName;
  final Color color;
  final String serviceIcon;
}

///
class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth > getSize(1080)
          ? getSize(1080)
          : getSize(1024),
      child: Column(
        children: [
          SectionTitle(
            title: '关于NeoApp',
            subTitle: '永不懈怠, 一路向前',
            decoColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

/// Top Section
class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('screen width= ${SizeConfig.screenWidth}');
    print('1024 = ${getSize(1024)}');
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.orange,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange.withOpacity(0.6),
              //Colors.orange.withOpacity(0.3),
              Colors.orange.withOpacity(1.0),
            ]),
      ),
      child: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth > getSize(1080)
              ? getSize(1080)
              : getSize(1024),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              TopSectionContent(),
              Positioned(
                right: 0,
                bottom: -getSize(140),
                child: TopSectionVividPic(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopSectionVividPic extends StatefulWidget {
  @override
  _TopSectionVividPicState createState() => _TopSectionVividPicState();
}

class _TopSectionVividPicState extends State<TopSectionVividPic>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> scale;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    scale = Tween<double>(begin: 1.0, end: 1.2).animate(animationController);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(300),
      padding: EdgeInsets.only(right: getSize(20)),
      child: MouseRegion(
        onEnter: (_) {
          animationController.forward();
        },
        onExit: (_) {
          animationController.reverse();
        },
        child: ScaleTransition(
          scale: scale,
          child: Image.network(
            'https://neoapp.oss-cn-shanghai.aliyuncs.com/drone_PNG204.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class TopSectionContent extends StatelessWidget {
  const TopSectionContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getSize(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello there',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getSize(32),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.qr_code, color: Colors.white),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('微信扫描下面的二维码:'),
                            contentPadding: EdgeInsets.all(getSize(50)),
                            content: Container(
                              width: getSize(500),
                              height: getSize(500),
                              alignment: Alignment.center,
                              child: Image.network(
                                'https://neoapp.oss-cn-shanghai.aliyuncs.com/mywechat.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
          SizedBox(height: getSize(50)),
          Text(
            'NeoApp\n设计工作室',
            style: TextStyle(
              fontSize: getSize(64),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getSize(50)),
          Text(
            '创新 创造 创客',
            style: TextStyle(
              color: Colors.white,
              fontSize: getSize(32),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getSize(35)),
        ],
      ),
    );
  }
}

///
class SectionTitle extends StatelessWidget {
  final String title, subTitle;
  final Color decoColor;

  const SectionTitle({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.decoColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = getSize(120);
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(vertical: getSize(20)),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: getSize(10),
                height: height / 4,
                decoration: BoxDecoration(color: decoColor),
              ),
              Expanded(
                child: Container(
                  width: getSize(10),
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(width: getSize(30)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: getSize(18),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: getSize(32),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///
class HoveredButton extends StatefulWidget {
  final double borderRadius;
  final Function() onTap;
  final Widget child;
  HoveredButton({Key key, this.borderRadius, this.onTap, this.child})
      : assert(child != null),
        super(key: key);
  @override
  _HoveredButtonState createState() => _HoveredButtonState();
}

class _HoveredButtonState extends State<HoveredButton>
    with SingleTickerProviderStateMixin {
  bool _onHover = false;
  Duration duration = Duration(milliseconds: 100);
  AnimationController animationController;
  Animation<double> scale;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: duration, vsync: this);
    scale = Tween<double>(begin: 1.0, end: 1.1).animate(animationController);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _onHover = true;
          animationController.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _onHover = false;
          animationController.reverse();
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: scale,
          child: AnimatedContainer(
            duration: duration,
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: _onHover ? Offset(0, getSize(5)) : Offset.zero,
                  blurRadius: _onHover ? getSize(10) : 0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getSize(30),
              vertical: getSize(10),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

///
class ContactMeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
