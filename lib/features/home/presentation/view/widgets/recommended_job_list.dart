import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/features/home/presentation/view/widgets/recommended_%20job_container.dart';

import '../../../../../core/utils/classes/app_routers.dart';

class RecommendedJobList extends StatelessWidget {
  const RecommendedJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.jobDescription);
              },
              child: const RecommendedJobContainer());
        },
        childCount: 10,
      ),
    );
  }
}
