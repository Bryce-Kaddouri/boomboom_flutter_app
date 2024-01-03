import 'package:boomboom_flutter_app/src/core/color_helper.dart';
import 'package:boomboom_flutter_app/src/feature/splash/presentation/widget/animated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> animation;
  late Animation<double> animation2;

  bool animation1IsCompleted = false;
  bool animation2IsCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animation1IsCompleted = true;
        });
        _controller2.forward();
      }
    });
    animation = Tween<double>(begin: 100, end: 1).animate(_controller);
    _controller.forward();
    _controller2 = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation2 = Tween<double>(begin: 0.15, end: 20).animate(_controller2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: // gradient color
          const Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          Visibility(
            visible: !animation1IsCompleted,
            child: Positioned(
              top: 0,
              left: -MediaQuery.of(context).size.width * 0.25,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.25,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: ColorHelper.heartColor,
                      blurRadius: 364,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: !animation1IsCompleted,
            child: Positioned(
              top: MediaQuery.of(context).size.height * 0.20,
              right: -MediaQuery.of(context).size.width * 0.25,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.25,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 174, 239, 1),
                      blurRadius: 294,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: !animation1IsCompleted,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: animation.value,
                    child: child,
                  ),
                  /* SvgPicture.asset(
                  'assets/svg/bombom_logo.svg',
                  allowDrawingOutsideViewBox: true,
                  height: MediaQuery.of(context).size.height * 2,
                  width: MediaQuery.of(context).size.height * 2,
                  fit: BoxFit.cover,
                ),*/
                );
              },
              child: SvgPicture.asset(
                'assets/svg/bombom_logo.svg',
                allowDrawingOutsideViewBox: true,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Visibility(
            visible: animation1IsCompleted,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Stack(children: [
                Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        'assets/svg/girl_splah.svg',
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        'Get ready for an incredible musical adventure!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 174, 239, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: AnimatedButtonWidget(),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      AnimatedBuilder(
                        animation: animation2,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, animation2.value),
                            child: child,
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/svg/bombom_logo.svg',
                          allowDrawingOutsideViewBox: true,
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      AnimatedBuilder(
                        animation: animation2,
                        builder: (context, child) {
                          return Stack(
                            children: [Text('BoomBoom')],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
