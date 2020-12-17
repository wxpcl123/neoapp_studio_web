import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../../../widgets/wechat_card.dart';

class TopSectionContent extends StatelessWidget {
  const TopSectionContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
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
                          builder: (context) => WeChatCard(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: getSize(50)),
            Text(
              'Neo Peng',
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
      ),
    );
  }
}
