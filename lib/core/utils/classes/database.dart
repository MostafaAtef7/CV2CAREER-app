import 'package:firebase_database/firebase_database.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';

class Database {
  final DatabaseReference database = FirebaseDatabase.instance.ref();

  Future<List<JobsModel>> fetchDataFromDatabase() async {
    try {
      final data = await database.child('jobs').get();
      List<JobsModel> jobs = [];
      if (data.exists) {
        List<dynamic> finalData = data.value as List<dynamic>;
        for (var item in finalData) {
          jobs.add(JobsModel.fromJson(item as Map<dynamic, dynamic>));
        }
      }
      return jobs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
