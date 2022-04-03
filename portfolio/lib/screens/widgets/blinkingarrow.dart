import 'package:flutter/material.dart';

class BlinkingArrow extends StatefulWidget {
  @override
  _BlinkingArrowState createState() => _BlinkingArrowState();
}

class _BlinkingArrowState extends State<BlinkingArrow>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController!,
      child: Image.asset('assets/double-arrow-top.png'),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
