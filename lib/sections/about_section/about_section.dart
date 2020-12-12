import 'package:flutter/material.dart';

import '../../widgets/section_title.dart';
import '../../utils/size_config.dart';

///
class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth > getSize(1080)
          ? getSize(1080)
          : getSize(1024),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: '关于NeoApp',
            subTitle: '永不懈怠, 一路向前',
            decoColor: Colors.blue,
          ),
          Text('迄今已取得几十项专利'),
          Text('发明专利授权:\t3项'),
          Text('实用新型授权:\t9项'),
          Text('申请中:\t若干'),
          Text('CMEF展会银奖'),
          Text('2017年度无锡市科学技术进步奖'),
        ],
      ),
    );
  }
}
