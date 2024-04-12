import 'package:flutter/material.dart';
import 'widgets/add_job_view_body.dart';

class AddJobView extends StatelessWidget {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AddJobViewBody(),
      ),
    );
  }
}
