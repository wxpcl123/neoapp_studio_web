import 'package:flutter/material.dart';

import '../../widgets/section_title.dart';
import '../../utils/size_config.dart';
import 'components/about_content.dart';

///
class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white70,
            Colors.orange[400],
          ],
        ),
      ),
      child: Container(
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
            AboutContent(),
          ],
        ),
      ),
    );
  }
}
