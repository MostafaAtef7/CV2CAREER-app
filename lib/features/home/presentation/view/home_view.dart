import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/home/presentation/manager/home_cubit.dart';
import 'package:gp_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  List<JobsModel> jobs = [];
  @override
  void initState() {
    if (jobs.isEmpty) {
      getData();
    }

    super.initState();
  }

  Future<void> getData() async {
    await BlocProvider.of<HomeCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBar(
          paddingHorizontal: 20,
          paddingVertical: 10,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hi, ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "Inter",
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeLoading) {
              isLoading = true;
            } else if (state is HomeSuccess) {
              jobs = state.jobs;
              isLoading = false;
            } else if (state is HomeFailure) {
              isLoading = false;
            }
          },
          builder: (context, state) {
            print("${jobs.length}::::Length ===================");
            return isLoading
                ? Center(
                    child: LoadingAnimationWidget.waveDots(
                      size: 30,
                      color: kPrimaryColor,
                    ),
                  )
                : HomeViewBody(jobs: jobs);
          },
        )
      ],
    );
  }
}
