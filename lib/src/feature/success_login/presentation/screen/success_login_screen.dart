import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessLoginScreen extends StatefulWidget {
  const SuccessLoginScreen({super.key});

  @override
  State<SuccessLoginScreen> createState() => _SuccessLoginScreenState();
}

class _SuccessLoginScreenState extends State<SuccessLoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0.7, end: 0.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, animation.value * MediaQuery.of(context).size.height),
              child: child,
            );
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/bombom_logo.svg',
                  allowDrawingOutsideViewBox: true,
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                Container(
                  color: Colors.transparent,
                  width: 170,
                  child: Text(
                    'BoomBoom',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 174, 239, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
