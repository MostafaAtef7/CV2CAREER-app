import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/features/home/presentation/view/widgets/general_job_container.dart';

class GeneralJobList extends StatelessWidget {
  final List<JobsModel> jobs;
  const GeneralJobList({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: jobs.length,
        separatorBuilder: (ctx, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.jobDescription, extra: jobs[index]);
            },
            child: GeneralJobContainer(job: jobs[index]),
          );
        },
      ),
    );
  }
}
