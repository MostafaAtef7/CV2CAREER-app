import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/features/home/presentation/view/widgets/recommended_%20job_container.dart';

class RecommendedJobList extends StatelessWidget {
  final List<JobsModel> jobs;
  const RecommendedJobList({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: jobs.length,
        separatorBuilder: (ctx, index) => const SizedBox(
          width: 15,
        ),
        itemBuilder: (ctx, index) {
          return jobs[index].jobTitle!.toLowerCase() == "full stack developer"
              ? RecommendedJobContainer(job: jobs[index])
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
