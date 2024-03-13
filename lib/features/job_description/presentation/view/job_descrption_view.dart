import 'package:flutter/material.dart';
import 'package:gp_app/features/job_description/presentation/view/widgets/job_descrption_view_body.dart';

class JobDescriptionView extends StatelessWidget {
  const JobDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: JobDescriptionViewBody(),
    );
  }
}
