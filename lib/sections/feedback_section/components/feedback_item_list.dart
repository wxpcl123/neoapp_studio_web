import 'package:flutter/material.dart';

import '../../../models/feedback_model.dart';
import '../../../utils/size_config.dart';

import 'feedback_item.dart';

class FeedBackItemList extends StatelessWidget {
  final List<FeedBackModel> feedbacks = [
    FeedBackModel(
      name: 'Jodge Doge',
      color: Colors.amber[50],
      description:
          '    Neo先生有十多年的结构设计经验, 有丰富的产品设计思想, 为我们公司的产品提供了非常优秀的技术支撑, 完美实现了近10个产品的上市推广, 取得了长足的效益. 期待继续与Neo先生合作, 再续辉煌.',
      headImg:
          'https://neoapp.oss-cn-shanghai.aliyuncs.com/air_balloon_PNG19408.png',
    ),
    FeedBackModel(
      name: 'Cindy Zhao',
      color: Colors.lightBlue[50],
      description:
          '    Neo先生真是一个爱学习的人, 结构设计是他的专业, 软件编程是他的爱好, 这个爱好也在慢慢变成了他的专长. 用Flutter做的App可以完美运行于Android, IOS和Web端, 据说也快要能同时运行于MacOS和Windows端了, 真厉害.',
      headImg:
          'https://neoapp.oss-cn-shanghai.aliyuncs.com/supergirl_PNG30.png',
    ),
    FeedBackModel(
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
