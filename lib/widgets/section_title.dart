import 'package:flutter/material.dart';

import '../utils/size_config.dart';

///
class SectionTitle extends StatelessWidget {
  final String title, subTitle;
  final Color decoColor;

  const SectionTitle({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.decoColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = getSize(120);
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(vertical: getSize(20)),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: getSize(10),
                height: height / 4,
                decoration: BoxDecoration(color: decoColor),
              ),
              Expanded(
                child: Container(
                  width: getSize(10),
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(width: getSize(30)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: getSize(18),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: getSize(32),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
