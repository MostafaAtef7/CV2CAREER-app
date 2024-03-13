import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';

import 'job_container.dart';

class GeneralJobList extends StatelessWidget {
  const GeneralJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (ctx, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.jobDescription);
            },
            child: const JobContainer(),
          );
        },
      ),
    );
  }
}
