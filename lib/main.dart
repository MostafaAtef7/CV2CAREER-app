import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';

void main(){
  runApp(const GpApp());
}

class GpApp extends StatelessWidget {
  const GpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          ),
      ),
    );
  }

}


