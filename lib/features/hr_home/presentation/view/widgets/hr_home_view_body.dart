import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:gp_app/core/utils/classes/database.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/add_job/presentation/view/widgets/hr_job_container.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HrHomeViewBody extends StatefulWidget {
  const HrHomeViewBody({super.key});

  @override
  State<HrHomeViewBody> createState() => _HrHomeViewBodyState();
}

class _HrHomeViewBodyState extends State<HrHomeViewBody> {
  late String userName = " ";
  final Database _dataservises = Database();

  @override
  void initState() {
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
          padding: const EdgeInsets.only(
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
            body: Column(
              children: [
                StreamBuilder(
                  stream: _dataservises.getUserStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Error+++++++++++++++++");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: [
                          const SizedBox(height: 220),
                          Center(
                            child: LoadingAnimationWidget.waveDots(
                              size: 30,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        padding: const EdgeInsets.only(top: 90),
                        child: Center(
                          child: Image.asset(
                            AssetsData.addNewJob,
                            height: 230,
                            width: 230,
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) {
                            return Column(
                              children: snapshot.data!
                                  .map<Widget>(
                                    (userData) => HrJobContainer(
                                      companyName: userData["company"],
                                      description: userData["job_description"],
                                      jobName: userData["job_title"],
                                      requirement: userData["job_requirement"],
                                      salary: userData["salary"],
                                      skills: userData["skills"],
                                      type: userData["job_type"],
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
