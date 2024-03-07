import 'package:flutter/material.dart';

import 'job_container.dart';

class GeneralJobList extends StatelessWidget {
  const GeneralJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (ctx, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {},
            child: const JobContainer(),
          );
        },
      ),
    );
  }
}
