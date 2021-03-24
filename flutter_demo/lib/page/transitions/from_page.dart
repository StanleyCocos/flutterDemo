import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/transitions/animation.dart';
import 'package:flutter_demo/page/transitions/hero_widget.dart';
import 'package:flutter_demo/page/transitions/to_page.dart';

import 'hero_to_page.dart';

class TransitionsFromPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransitionsFromState();
}

class _TransitionsFromState extends State<TransitionsFromPage> {
  List<String> dataList = [
    "缩放路由动画",
    "渐变透明路由动画",
    "旋转路由动画",
    "平移从上到下",
    "平移从右到左",
    "平移从左到右",
    "平移从下到上",
    "综合(缩放+透明+旋转)",
    "Hero动画"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("转场动画列表"),
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemBuilder: (context, index) => item(
          index: index,
          title: dataList[index],
          click: () => listItemOnClick(index),
        ),
        separatorBuilder: (context, index) => separator,
        itemCount: dataList.length,
      ),
    );
  }

  Widget item({int index, String title, Function click}) {
    if (index == dataList.length - 1){
      return GestureDetector(
        onTap: click,
        child: heroItem,
      );
    }
    return GestureDetector(
      onTap: click,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.centerLeft,
        color: Colors.white,
        padding: EdgeInsets.only(left: 30),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget get separator {
    return Divider(
      color: Colors.black,
      height: 0.5,
      thickness: 0.5,
      indent: 30,
      endIndent: 10,
    );
  }

  Widget get heroItem {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: HeroWidget(),
    );
  }
}

extension Click on _TransitionsFromState {
  void listItemOnClick(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, ScaleRouter(page: TransitionsToPage()));
        break;
      case 1:
        Navigator.push(context, FadeRouter(page: TransitionsToPage()));
        break;
      case 2:
        Navigator.push(context, RotateRouter(page: TransitionsToPage()));
        break;
      case 3:
        Navigator.push(context, Top2BottomRouter(page: TransitionsToPage()));
        break;
      case 4:
        Navigator.push(context, Left2RightRouter(page: TransitionsToPage()));
        break;
      case 5:
        Navigator.push(context, Right2LeftRouter(page: TransitionsToPage()));
        break;
      case 6:
        Navigator.push(context, Bottom2TopRouter(page: TransitionsToPage()));
        break;
      case 7:
        Navigator.push(
            context, ScaleFadeRotateRouter(page: TransitionsToPage()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HeroToPage()));
        break;
    }
  }
}
