import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:shimmer/shimmer.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async{
      String checkHR;
      if(FirebaseAuth.instance.currentUser == null) {
        GoRouter.of(context).pushReplacement(AppRouter.onboarding);
        }
          
          else{ 
      String email = FirebaseAuth.instance.currentUser!.email!;
            checkHR = await getCheckHR(email: email);
            
            GoRouter.of(context).pushReplacement(AppRouter.bottomBar,extra: checkHR);
            }
    });
  }

  Future<String> getCheckHR({required String email}) async{
          await BlocProvider.of<AuthCubit>(context).check(emailAddress: email);
          return BlocProvider.of<AuthCubit>(context).checkHR!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              AssetsData.splashImage,
              width: 200,
            ),
          ),
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(179, 255, 255, 255),
            highlightColor: const Color(0xff3FC3AE),
            child: const Text(
              "LOADING ....",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
