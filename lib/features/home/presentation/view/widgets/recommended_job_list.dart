import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/features/home/presentation/view/widgets/job_container.dart';

import '../../../../../core/utils/classes/app_routers.dart';

class RecommendedJobList extends StatelessWidget {
  const RecommendedJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (ctx, index) => const SizedBox(
              height: 10,
            ),
        itemBuilder: (ctx, index) {
          return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.jobDescription);
              },
              child: const JobContainer());
        });
  }
}
