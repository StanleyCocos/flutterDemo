import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "HeroWidget",
      child: Column(
        children: [
          Image.asset(
            "asset/images/hero_image_cover.jpg",
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "这个是hero过渡动画",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text("这个是hero过渡动画 ---------- test111", style: TextStyle(
              fontSize: 16,
              color: Colors.greenAccent,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),),
          )
        ],
      ),
    );
  }
}
