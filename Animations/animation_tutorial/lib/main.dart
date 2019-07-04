import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addStatusListener((state) => {
            if (state == AnimationStatus.completed)
              {animationController.reverse()}
            else
              if (state == AnimationStatus.dismissed)
                {animationController.forward()}
          })
      ..addStatusListener((state) => print('$state'));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) =>
      GrowTransition(animation: animation, child: LogoWidget());

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: this.animation,
        builder: (context, child) => Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
        child: child,
      ),
    );
  }
}
