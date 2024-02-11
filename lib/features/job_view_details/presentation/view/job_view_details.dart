import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';

import 'widgets/job_view_details_body.dart';

class JobViewDetails extends StatelessWidget {
  const JobViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        iconButton: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: const JobViewDetailsBody(),
    ));
  }
}
