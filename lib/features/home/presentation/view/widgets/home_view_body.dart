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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 33, 49, 34),
                        Color(0xFF3FC3AE)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 0.9],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const GeneralJobList(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Recommended Jobs",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          // SliverFillRemaining => make ListView built the remaining space in the screen not all items at once
          const SliverFillRemaining(
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
