import 'package:flutter/material.dart';

import '../widgets/hovered_button.dart';
import '../widgets/wechat_card.dart';
import '../utils/size_config.dart';

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
                    builder: (context) => WeChatCard(),
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
