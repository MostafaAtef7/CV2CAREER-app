import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';

import 'apply_container.dart';
import 'job_description_container.dart';

class JobDescriptionViewBody extends StatelessWidget {
  const JobDescriptionViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomAppBar(
          widget: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                ApplyContainer(),
                JobDescriptionContainer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
