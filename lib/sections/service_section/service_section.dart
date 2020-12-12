import 'package:flutter/material.dart';

import '../../widgets/section_title.dart';
import '../../utils/size_config.dart';
import 'component/service_item_card_list.dart';

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
