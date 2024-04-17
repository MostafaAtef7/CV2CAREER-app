import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/add_job/presentation/view/widgets/hr_apply_container.dart';
import 'package:gp_app/features/add_job/presentation/view/widgets/hr_job_des_container.dart';

class HrJobDes extends StatelessWidget {
  final String companyName;
  final String salary;
  final String jobName;
  final String skills;
  final String type;
  final String description;
  final String requirement;
  const HrJobDes(
      {super.key,
      required this.companyName,
      required this.salary,
      required this.jobName,
      required this.skills,
      required this.type,
      required this.description,
      required this.requirement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  HrApplyContainer(
                      companyName: companyName,
                      jobName: jobName,
                      salary: salary,
                      type: type),
                  HrJobDescriptionContainer(
                    skills: skills,
                    description: description,
                    requirement: requirement,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
