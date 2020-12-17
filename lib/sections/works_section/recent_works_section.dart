import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/section_title.dart';
import 'components/works_card_list.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
