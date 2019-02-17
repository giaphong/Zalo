import 'package:flutter/material.dart';

class ColorLoader2 extends StatefulWidget {
  @override
  _ColorLoader2State createState() => _ColorLoader2State();
}

class _ColorLoader2State extends State<ColorLoader2> with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
            0.0, 1.0, curve: Curves.linear
        )
    ));
    controller.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          new RotationTransition(
            turns: animation,
            child: Icon(Icons.offline_bolt, color: Colors.blue,)
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
