import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/dialog_transitions/page.dart';
import 'package:flutter_demo/page/transitions/from_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  // final List<String> dataList = ["页面转场动画", "", "", ""];

  @override
  Widget build(BuildContext context) {
    List<String> dataList = ["页面转场动画", "Dialog弹出动画",];
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemBuilder: (context, index) => item(
          index: index,
          title: dataList[index],
          click: ()=> listItemOnClick(index),
        ),
        separatorBuilder: (context, index) => separator,
        itemCount: dataList.length,
      ),
    );
  }

  Widget item({int index, String title, Function click}) {
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
}


extension Click on _HomeState {

  void listItemOnClick(int index){
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TransitionsFromPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DialogAnimationPage()));
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
}