import 'package:flutter/material.dart';

import '../../../models/works_model.dart';
import '../../../utils/size_config.dart';

class WorksCard extends StatefulWidget {
  const WorksCard({Key key, this.works}) : super(key: key);

  final WorksModel works;

  @override
  _WorksCardState createState() => _WorksCardState();
}

class _WorksCardState extends State<WorksCard> {
  Duration duration = Duration(milliseconds: 200);
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      onHover: (onHover) {
        setState(() {
          _onHover = onHover;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        width: getSize(500),
        height: getSize(280),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getSize(20)),
          boxShadow: [
            if (_onHover)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, getSize(20)),
                blurRadius: getSize(40),
              ),
          ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: duration,
              width: getSize(248),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.works.img),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(getSize(20)),
                  boxShadow: [
                    if (!_onHover)
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(getSize(10), 0),
                        blurRadius: getSize(20),
                      ),
                  ]),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(getSize(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.works.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getSize(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getSize(20)),
                    Text(
                      widget.works.simpDesc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getSize(18),
                        letterSpacing: 1.5,
                        height: 2,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('详细信息',
                          style: TextStyle(
                            fontSize: getSize(14),
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
