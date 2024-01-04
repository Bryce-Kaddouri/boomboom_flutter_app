import 'package:boomboom_flutter_app/src/feature/splash/presentation/screen/splash_screen.dart';
import 'package:boomboom_flutter_app/src/feature/success_login/presentation/screen/success_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // use fade in transition
      defaultTransition: Transition.fadeIn,

      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/success-login', page: () => SuccessLoginScreen()),
      ],
    );
  }
}
