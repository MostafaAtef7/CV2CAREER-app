import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import '../../../../../core/utils/classes/app_routers.dart';
import 'general_job_list.dart';
import 'recommended_job_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.jobs});
  final List<JobsModel> jobs;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late String userName = " ";

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
            top: 65,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "General Jobs",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Inter",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.seeAllGeneralJob,
                              extra: widget.jobs);
                        },
                        child: const Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: "Inter",
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  GeneralJobList(jobs: widget.jobs),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Recommended Jobs",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              RecommendedJobList(jobs: widget.jobs),
            ],
          ),
          //  CustomScrollView(
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: ),
          //     // SliverFillRemaining => make ListView built the remaining space in the screen not all items at once

          //   ],
          // ),
        )
      ],
    );
  }
}
