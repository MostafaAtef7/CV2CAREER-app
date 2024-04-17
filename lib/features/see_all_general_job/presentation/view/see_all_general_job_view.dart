import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';

import 'widgets/see_all_general_job_view_body.dart';

class SeeAllGeneralJobView extends StatelessWidget {
  const SeeAllGeneralJobView({super.key, required this.jobs});
  final List<JobsModel> jobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeeAllGeneralJobViewBody(jobs: jobs),
    );
  }
}
