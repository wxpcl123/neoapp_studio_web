import 'package:flutter/material.dart';

import '../../../models/feedback_model.dart';
import '../../../utils/size_config.dart';

class FeedBackItem extends StatefulWidget {
  FeedBackItem({Key key, this.feedBack}) : super(key: key);
  final FeedBackModel feedBack;

  @override
  _FeedBackItemState createState() => _FeedBackItemState();
}

class _FeedBackItemState extends State<FeedBackItem> {
  Duration duration = Duration(milliseconds: 200);
  bool _onHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: widget.feedBack.color,
      highlightColor: widget.feedBack.color,
      onHover: (onHover) {
        setState(() {
          _onHover = onHover;
        });
      },
      onTap: () {},
      child: Container(
        width: getSize(330),
        height: getSize(480),
        decoration: BoxDecoration(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedContainer(
              duration: duration,
              margin: EdgeInsets.only(top: getSize(60)),
              padding: EdgeInsets.all(getSize(30)),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: widget.feedBack.color,
                borderRadius: BorderRadius.circular(getSize(20)),
                boxShadow: [
                  if (_onHover)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, getSize(20)),
                      blurRadius: getSize(30),
                    ),
                ],
              ),
              child: Text(
                widget.feedBack.description,
                style: TextStyle(
                  fontSize: getSize(18),
                  letterSpacing: 1.5,
                  height: 1.5,
                ),
              ),
            ),
            Positioned(
              left: getSize(100),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: duration,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getSize(10)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (!_onHover)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, getSize(15)),
                            blurRadius: getSize(20),
                          ),
                      ],
                    ),
                    child: Image.network(
                      widget.feedBack.headImg,
                      fit: BoxFit.cover,
                      width: getSize(100),
                      height: getSize(100),
                    ),
                  ),
                  SizedBox(height: getSize(20)),
                  Text(
                    widget.feedBack.name,
                    style: TextStyle(
                      fontSize: getSize(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
