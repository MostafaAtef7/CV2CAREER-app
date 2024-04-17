import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/features/job_description/presentation/view/widgets/job_descrption_view_body.dart';

class JobDescriptionView extends StatelessWidget {
  final JobsModel job;
  const JobDescriptionView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JobDescriptionViewBody(job: job),
    );
  }
}
