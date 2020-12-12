import 'package:flutter/material.dart';

import '../utils/size_config.dart';

///
class WeChatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('微信扫描下面的二维码:'),
      contentPadding: EdgeInsets.all(getSize(50)),
      content: Container(
        width: getSize(500),
        height: getSize(500),
        alignment: Alignment.center,
        child: Image.network(
          'https://neoapp.oss-cn-shanghai.aliyuncs.com/mywechat.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
