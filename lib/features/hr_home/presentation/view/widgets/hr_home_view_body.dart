import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HrHomeViewBody extends StatefulWidget {
  const HrHomeViewBody({super.key});

  @override
  State<HrHomeViewBody> createState() => _HrHomeViewBodyState();
}

class _HrHomeViewBodyState extends State<HrHomeViewBody> {
  late String userName = " ";

  void retrieveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = sharedPreferences.getString('userName')!;
    setState(() {});
  }

  @override
  void initState() {
    retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBar(
          paddingHorizontal: 20,
          paddingVertical: 10,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi, $userName",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "Inter",
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              right: 18,
              left: 18,
              top: 100,
            ),
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                elevation: 0,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.addJob);
                },
              ),
            )),
      ],
    );
  }
}
