import 'package:flutter/material.dart';
import 'package:gp_app/features/home/presentation/view/widgets/job_container.dart';

class RecommendedJobList extends StatelessWidget {
  const RecommendedJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 15,
                  ),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                    onTap: () {
                      
                    },
                    child: const JobContainer());
              });
        } 
        }
