import 'package:flutter/material.dart';

import '../../../models/service_model.dart';
import '../../../utils/size_config.dart';

class ServiceItemCard extends StatefulWidget {
  const ServiceItemCard({Key key, this.serviceModel}) : super(key: key);
  final ServiceModel serviceModel;

  @override
  _ServiceItemCardState createState() => _ServiceItemCardState();
}

class _ServiceItemCardState extends State<ServiceItemCard> {
  Duration duration = Duration(milliseconds: 200);
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (isHover) {
        setState(() {
          _isHover = isHover;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        width: getSize(240),
        height: getSize(280),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: getSize(25)),
        decoration: BoxDecoration(
          color: widget.serviceModel.color,
          borderRadius: BorderRadius.circular(getSize(20)),
          boxShadow: [
            if (_isHover)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, getSize(20)),
                blurRadius: getSize(40),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              width: getSize(180),
              height: getSize(180),
              padding: EdgeInsets.all(getSize(28)),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!_isHover)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, getSize(20)),
                      blurRadius: getSize(30),
                    ),
                ],
              ),
              child: Image.network(
                widget.serviceModel.serviceIcon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getSize(20)),
            Text(
              widget.serviceModel.serviceName,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: getSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
