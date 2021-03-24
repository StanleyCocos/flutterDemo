import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransitionsToPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransitionsToState();
}

class _TransitionsToState extends State<TransitionsToPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("转场动画"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
      ),
    );
  }
}
