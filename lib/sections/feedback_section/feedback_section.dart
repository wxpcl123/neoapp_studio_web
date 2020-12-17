import 'package:flutter/material.dart';

import '../../widgets/section_title.dart';
import '../../utils/size_config.dart';
import 'components/feedback_item_list.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
