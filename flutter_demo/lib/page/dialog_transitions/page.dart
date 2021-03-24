

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/dialog_transitions/dialog_animation.dart';

class DialogAnimationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DialogAnimationState();

}

class _DialogAnimationState extends State<DialogAnimationPage> {

  @override
  Widget build(BuildContext context) {
    List<String> dataList = ["渐变效果", "缩放效果", "平移从左出现", "平移从右出现", "平移从上出现", "平移从下出现"];
    return Scaffold(
      appBar: AppBar(title: Text("Dialog展示动画"),),
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

extension Click on _DialogAnimationState {

  void listItemOnClick(int index){
    switch(index){
      case 0:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.fade);
        break;
      case 1:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.scale);
        break;
      case 2:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.inFromLeft);
        break;
      case 3:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.inFromRight);
        break;
      case 4:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.inFromTop);
        break;
      case 5:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.inFromBottom);
        break;
      case 3:
        showAnimationDialog(context: context, child: MyDialog(), transitionType: TransitionType.inFromRight);
        break;
    }
  }
}


class MyDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 300,
          height: 280,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                    "asset/images/hero_image_cover.jpg"
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "这个是 dialog title",
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
                child: Text("这个是 dialog 内容 ---------- test111", style: TextStyle(
                  fontSize: 16,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),),
              ),

            ],
          ),
        ),
      ),
    );
  }

}