import 'package:flutter/material.dart';

import 'features/splash/presentation/view/splash_view.dart';
void main(){
  runApp(const GpApp());
}

class GpApp extends StatelessWidget {
  const GpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        ),
      home: const SplashView(),
    );
  }

}


