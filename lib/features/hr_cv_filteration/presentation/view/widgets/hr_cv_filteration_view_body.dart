import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/hr_cv_filteration/presentation/view/widgets/applied_job_contianer_title.dart';

class HrCvFilterationViewBody extends StatefulWidget {
  const HrCvFilterationViewBody({super.key});

  @override
  State<HrCvFilterationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<HrCvFilterationViewBody> {
  // final Chatservices _chatservisrs = Chatservices();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomAppBar(
          paddingHorizontal: 20,
          paddingVertical: 30,
          widget: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: "Inter",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 18,
            left: 18,
            top: 65,
          ),
          child: AppliedJobContainerTitle(),
        ),
      ],
    );
  }
}
