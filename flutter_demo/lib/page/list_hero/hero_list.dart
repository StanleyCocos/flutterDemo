import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_detail.dart';

class HeroListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HeroListState();
}

class HeroListState extends State<HeroListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表hero动画"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 2,
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    reverseTransitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition(
                        opacity: animation,
                        child: HeroDetailPage(),
                      );
                    },
                  ),
                );
              },
              child: Hero(
                tag: "tag_test_$index",
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red,
                  child: Image.network(
                    "https://cp4.100.com.tw/images/works/202105/17/api_1904410_1621246297_94TxU37oKL.jpg!c70x70-v4.webp",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
