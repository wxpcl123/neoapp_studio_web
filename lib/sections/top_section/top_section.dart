import 'dart:ui';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'components/top_section_content.dart';
import 'components/top_section_vivid_pic.dart';

/// Top Section
class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange.withOpacity(0.6),
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
