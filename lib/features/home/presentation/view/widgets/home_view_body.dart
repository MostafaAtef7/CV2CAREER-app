import 'package:flutter/material.dart';
import 'general_job_list.dart';
import 'recommended_job_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 100,
              ),
              GeneralJobList(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Recommended Jobs",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
          // SliverFillRemaining => make ListView built the remaining space in the screen not all items at once
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: RecommendedJobList(),
            ),
          )
        ],
      ),
    );
  }
}
