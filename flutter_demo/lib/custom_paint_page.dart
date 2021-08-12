

import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPaintPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("绘制"),),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            color: Colors.white,
          ),

          Container(
            width: double.infinity,
            height: 500,
            // color: Colors.white,
            child: CustomPaint(
              painter: MyPainter(44),
              size: Size(
                double.infinity,
                500,
              ),
              // child: Container(
              //   width: double.infinity,
              //   height: 200,
              //
              // ),
            ),
          ),
        ],
      ),
    );
  }
}


class MyPainter extends CustomPainter {

  final double radius;
  MyPainter(this.radius);

  double get diameter => radius * 2;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth=5.0
      ..style = PaintingStyle.fill
      ..color=Colors.green
      ..invertColors=false;

    // Rect rect=Rect.fromCircle(center: Offset(size.width - 250, size.height - 250), radius: 200.0);
    // canvas.drawArc(rect, 0.0, 2 * pi /4, false, paint);
    //canvas.drawLine(Offset(0, 20), Offset(100, 100), paint);
    // canvas.drawPoints(PointMode.polygon,[
    //   Offset(20.0, 130.0),
    // Offset(100.0, 210.0),
    // Offset(100.0, 310.0),
    // Offset(200.0, 310.0),
    // Offset(200.0, 210.0),
    // Offset(280.0, 130.0),
    // Offset(20.0, 130.0)], paint);

    // canvas.drawCircle(
    //     Offset(100.0, 350.0),
    //     30.0,
    //     paint
    //       ..color = Colors.red
    //       ..style = PaintingStyle.fill //绘画风格改为stroke
    // );

    // Rect rect1 = Rect.fromPoints(Offset(150.0, 200.0), Offset(300.0, 250.0));
    // canvas.drawOval(rect1, paint);
    Path path = Path()..moveTo(0.0, 0.0);
    path.lineTo(0, size.height - diameter);
    Rect rect = Rect.fromCircle(center: Offset(radius, size.height- diameter), radius: radius);
    path.arcTo(rect,  -pi, - (pi / 2), false);
    path.lineTo(radius, size.height - radius);
    path.lineTo(size.width - radius, size.height - radius);
    Rect rect1 = Rect.fromCircle(center: Offset(size.width - radius, size.height), radius: radius);
    path.arcTo(rect1, -(pi / 2),  pi / 2, false);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}