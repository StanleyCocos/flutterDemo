import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_widget.dart';

class HeroToPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeroToState();
}

class _HeroToState extends State<HeroToPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation,
      extendBodyBehindAppBar: true,
      body: HeroWidget(),
    );
  }

  Widget get navigation {
    return PreferredSize(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 84,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.close, size: 30),
            ),
          ),
        ],
      ),
      preferredSize: Size(double.infinity, 84),
    );
  }
}
