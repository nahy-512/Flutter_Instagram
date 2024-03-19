import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instagram/src/bindings/init_binding.dart';
import 'package:instagram/src/screens/login/login2_screen.dart';
import 'package:instagram/src/screens/login/login_screen.dart';

import 'src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,//디버그 배너 해제
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black, backgroundColor: Colors.white)),
      home: const LoginScreen2(),
      initialBinding: InitBinding(), //초기 바인딩
    );
  }
}