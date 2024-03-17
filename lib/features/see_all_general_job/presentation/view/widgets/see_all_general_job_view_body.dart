import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';

import 'general_job_list.dart';

class SeeAllGeneralJobViewBody extends StatelessWidget {
  const SeeAllGeneralJobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomAppBar(
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
      const Padding(
        padding: EdgeInsets.only(top: 80, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "General Jobs",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Inter",
                ),
              ),
            ),
            SeeAllGeneralJobList(),
          ],
        ),
      ),
    ]);
  }
}
