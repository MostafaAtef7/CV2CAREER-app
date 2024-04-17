import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/features/home/presentation/view/widgets/recommended_%20job_container.dart';

class SeeAllGeneralJobList extends StatelessWidget {
  final List<JobsModel> jobs;
  const SeeAllGeneralJobList({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: jobs.length,
        separatorBuilder: (ctx, index) => const SizedBox(
          width: 15,
        ),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.jobDescription, extra: jobs[index]);
            },
            child: RecommendedJobContainer(job: jobs[index]),
          );
        },
      ),
    );
  }
}
