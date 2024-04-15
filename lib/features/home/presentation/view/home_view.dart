import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
import 'package:gp_app/features/home/presentation/manager/home_cubit.dart';
import 'package:gp_app/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  List<JobsModel> jobs = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    await BlocProvider.of<HomeCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
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
        return isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : HomeViewBody(jobs: jobs);
      },
    );
  }
}
