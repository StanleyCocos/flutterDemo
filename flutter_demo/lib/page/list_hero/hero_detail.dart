import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HeroDetailState();
}

class HeroDetailState extends State<HeroDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情hero动画"),

      ),
      body: PageView.builder(itemCount: 10, itemBuilder: (BuildContext context, int index){
        return  Hero(
          tag: "tag_test_$index",
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
            child: Image.network(
              "https://cp4.100.com.tw/images/works/202105/17/api_1904410_1621246297_94TxU37oKL.jpg!c70x70-v4.webp",
              fit: BoxFit.contain,
            ),
            // margin: EdgeInsets.only(left: 10, top: 10, right: 10),
          ),
        );
      })
    );
  }
}
