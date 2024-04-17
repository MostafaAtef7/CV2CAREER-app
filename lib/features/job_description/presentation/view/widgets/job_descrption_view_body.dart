import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';

import 'apply_container.dart';
import 'job_description_container.dart';

class JobDescriptionViewBody extends StatelessWidget {
  final JobsModel job;
  const JobDescriptionViewBody({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBar(
          paddingHorizontal: 20,
          paddingVertical: 10,
          widget: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 20,
              ),
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ApplyContainer(job: job),
                JobDescriptionContainer(job: job),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
