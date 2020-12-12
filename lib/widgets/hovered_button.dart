import 'package:flutter/material.dart';

import '../utils/size_config.dart';

///
class HoveredButton extends StatefulWidget {
  final double borderRadius;
  final Function() onTap;
  final Widget child;
  HoveredButton({Key key, this.borderRadius, this.onTap, this.child})
      : assert(child != null),
        super(key: key);
  @override
  _HoveredButtonState createState() => _HoveredButtonState();
}

class _HoveredButtonState extends State<HoveredButton>
    with SingleTickerProviderStateMixin {
  bool _onHover = false;
  Duration duration = Duration(milliseconds: 100);
  AnimationController animationController;
  Animation<double> scale;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: duration, vsync: this);
    scale = Tween<double>(begin: 1.0, end: 1.1).animate(animationController);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _onHover = true;
          animationController.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _onHover = false;
          animationController.reverse();
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: scale,
          child: AnimatedContainer(
            duration: duration,
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: _onHover ? Offset(0, getSize(5)) : Offset.zero,
                  blurRadius: _onHover ? getSize(10) : 0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getSize(30),
              vertical: getSize(10),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
