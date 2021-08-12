import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_hero/hero_list.dart';

GlobalKey _globalKey = GlobalKey();

class TextHeight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextHeightState();
}

class _TextHeightState extends State<TextHeight> with WidgetsBindingObserver {



  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("didChangeAppLifecycleState");
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    var text = "dafadsfadsfadsfadsfasdfasdfasdfadsfdgsdfz,,,fdga11e234%afdsfadsfda发送到发斯蒂芬的发大水发的说法发大水发斯蒂芬 adsfadsfadsfadsfasdfasdfasdfadsfdafadsfadsfadsfadsfasdfasdfasdfadsfdafadsfadsfadsfadsfasdfasdfasdfadsfddd";


    return Scaffold(
      appBar: AppBar(title: Text("111"),),
      body:  GestureDetector(
        onTap: (){
          var a = calculateTextHeight(text, TextStyle(fontSize: 20), 300, 100, context);
          var size = _globalKey.currentContext?.findRenderObject()?.paintBounds?.size;
          Navigator.push(context, MaterialPageRoute(builder: (context) => HeroListPage()));
          print("计算: ${a} --- 渲染: ${size?.height}");

        },
        child: Container(
          width: 300,
          color: Colors.red,
          child: Text(
            text,
            key: _globalKey,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

double calculateTextHeight(
  String value,
  TextStyle style,
  double maxWidth,
  int maxLines,
  BuildContext context,
) {
  TextPainter painter = TextPainter(

      ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
      locale: Localizations.localeOf(context),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
          text: value,
          style: TextStyle(
            fontWeight: style.fontWeight,
            fontSize: style.fontSize,
          )));
  painter.layout(maxWidth: maxWidth);

  ///文字的宽度:painter.width
  return painter.height;
}
