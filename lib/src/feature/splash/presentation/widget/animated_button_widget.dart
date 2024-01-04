import 'package:boomboom_flutter_app/src/core/color_helper.dart';
import 'package:flutter/material.dart';

class AnimatedButtonWidget extends StatefulWidget {
  Function onTap;
  AnimatedButtonWidget({super.key, required this.onTap});

  @override
  State<AnimatedButtonWidget> createState() => _AnimatedButtonWidgetState();
}

class _AnimatedButtonWidgetState extends State<AnimatedButtonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500), lowerBound: 1, upperBound: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // overflow hidden
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(47, 33, 95, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorHelper.heartColor.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 64,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          print('tapped');
          widget.onTap();
        },
        onHover: (value) {
          if (value) {
            setState(() {
              isHover = true;
            });
            _controller.forward();
          } else {
            setState(() {
              isHover = false;
            });
            _controller.reverse();
          }
        },
        child: Stack(
          children: [
            Positioned(
              top: -90,
              left: 5,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _controller.value,
                    child: child,
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [ColorHelper.heartColor.withOpacity(1), ColorHelper.heartColor.withOpacity(0)])

                      /*boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 294,
                  ),
                ],*/
                      ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 5,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _controller.value,
                    child: child,
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color.fromRGBO(0, 174, 239, 1), Color.fromRGBO(0, 174, 239, 0)])),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
/*
              color: Color.fromRGBO(47, 33, 95, 1),
*/
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  Text('Login with Spotify', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
