import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:gp_app/core/utils/classes/database.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> fetchData() async {
    emit(HomeLoading());
    try {
      List<JobsModel> jobs = await Database().fetchDataFromDatabase();
      emit(HomeSuccess(jobs: jobs));
    } catch (e) {
      emit(HomeFailure(errorMessage: 'No user found for that email.'));
    }
  }
}
