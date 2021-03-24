import 'package:flutter/material.dart';

//缩放路由动画
class ScaleRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  ScaleRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.easeOut,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: duration),
          transitionsBuilder: (context, a1, a2, child) => ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(parent: a1, curve: curve)),
            child: child,
          ),
        );
}

//渐变透明路由动画
class FadeRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  FadeRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, a1, a2, child) => FadeTransition(
                  opacity: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}

//旋转路由动画
class RotateRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  RotateRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, a1, a2, child) => RotationTransition(
                  turns: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}

//上--->下
class Top2BottomRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  Top2BottomRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (ctx, a1, a2) {
              return page;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, -1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//左--->右
class Left2RightRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;
  List<int> mapper;

  Left2RightRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.easeOut,
  })  : assert(true),
        super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (ctx, a1, a2) {
              return page;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//下--->上
class Bottom2TopRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  Bottom2TopRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (ctx, a1, a2) {
              return page;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//右--->左
class Right2LeftRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  Right2LeftRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (ctx, a1, a2) {
              return page;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//缩放+透明+旋转路由动画
class ScaleFadeRotateRouter extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve curve;

  ScaleFadeRotateRouter({
    this.page,
    this.duration = 300,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (ctx, a1, a2) => page, //页面
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              //构建动画
              return RotationTransition(
                //旋转动画
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: a1,
                  curve: curve,
                )),
                child: ScaleTransition(
                  //缩放动画
                  scale: Tween(begin: 0.0, end: 1.0)
                      .animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: FadeTransition(
                    opacity: //透明度动画
                        Tween(begin: 0.5, end: 1.0)
                            .animate(CurvedAnimation(parent: a1, curve: curve)),
                    child: child,
                  ),
                ),
              );
            });
}

//无动画
class NoAnimRouter<T> extends PageRouteBuilder<T> {
  final Widget page;

  NoAnimRouter(this.page)
      : super(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration(milliseconds: 0),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
}
