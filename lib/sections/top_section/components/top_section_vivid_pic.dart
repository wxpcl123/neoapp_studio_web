import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

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
