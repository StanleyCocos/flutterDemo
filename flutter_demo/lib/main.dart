import 'package:flutter/material.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/page/text_height.dart';

import 'custom_paint_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Listener(
      onPointerCancel: (e) {
        print("onPointerCancel");
      },
      onPointerDown: (e) {
        print(e.position);
        print("onPointerDown");
      },
      onPointerHover: (e) {
        print("onPointerHover");
      },
      onPointerMove: (e) {
        print("onPointerMove");
      },
      onPointerSignal: (e) {
        print("onPointerSignal");
      },
      onPointerUp: (e) {
        print("onPointerUp");
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
