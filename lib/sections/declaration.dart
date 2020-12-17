import 'package:flutter/material.dart';
import 'package:neoapp_studio_web/utils/size_config.dart';

class Declaration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Colors.white54,
      fontSize: getSize(12),
      fontWeight: FontWeight.w300,
      letterSpacing: 1.3,
    );
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Container(
        width: SizeConfig.screenWidth > getSize(1080)
            ? getSize(1080)
            : getSize(1024),
        padding: EdgeInsets.symmetric(vertical: getSize(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Created by Neo Peng', style: textStyle),
            Text('Powered by Flutter', style: textStyle),
          ],
        ),
      ),
    );
  }
}
