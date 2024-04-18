import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';

class Database {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<JobsModel>> fetchDataFromDatabase() async {
    try {
      final data = await database.child('jobs').get();
      List<JobsModel> jobs = [];
      if (data.exists) {
        Map<dynamic, dynamic> dataMap = data.value as Map<dynamic, dynamic>;
        // Loop through the map entries instead of treating it as a list
        for (var entry in dataMap.entries) {
          jobs.add(JobsModel.fromJson(entry.value as Map<dynamic, dynamic>));
        }
      }
      return jobs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> addJob(
      {required String? jobLinkHref,
      required String? jobTitle,
      required String? jobType,
      required String? company,
      required String? postedAt,
      required String? experience,
      required String? salary,
      required String? jobCategory,
      required String? education,
      required String? skills,
      required String? jobDescription,
      required String? jobResponsibilities,
      required String? jobRequirement}) async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    print("email ::: $id");
    final DatabaseReference addDatabase =
        FirebaseDatabase.instance.ref("jobs/$id");

    await addDatabase.set({
      "job_title": jobTitle,
      "job_requirement": jobRequirement,
      "job_description": jobDescription,
      "company": company,
      "job_type": jobType,
      "salary": salary,
      "skills": skills,
      "education": education,
      "experience": experience,
      "job_category": jobCategory,
      "job_link_href": jobLinkHref,
      "job_responsibilities": jobResponsibilities,
      "posted_at": postedAt,
    });
    print("job created successfully^^^^^^^^^^^^^^^^^^");
  }

  Stream<List<Map<String, dynamic>>> getUserStream() {
    final String currentUserID = _auth.currentUser!.uid;

    return _firestore
        .collection("Posts")
        .doc(currentUserID)
        .collection("Post")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void> addData(
      {required String? jobLinkHref,
      required String? jobTitle,
      required String? jobType,
      required String? company,
      required String? postedAt,
      required String? experience,
      required String? salary,
      required String? jobCategory,
      required String? education,
      required String? skills,
      required String? jobDescription,
      required String? jobResponsibilities,
      required String? jobRequirement}) async {
    final String currentUserID = _auth.currentUser!.uid;
    // final Timestamp timetemp = Timestamp.now();

    JobsModel dataOfNewPost = JobsModel(
      company: company,
      education: education,
      experience: experience,
      jobCategory: jobCategory,
      jobDescription: jobDescription,
      jobLinkHref: jobLinkHref,
      jobRequirement: jobRequirement,
      jobResponsibilities: jobResponsibilities,
      jobTitle: jobTitle,
      jobType: jobType,
      postedAt: postedAt,
      salary: salary,
      skills: skills,
    );

    await _firestore
        .collection("Posts")
        .doc(currentUserID)
        .collection("Post")
        .add(
          dataOfNewPost.toJson(),
        );

    await Database().addJob(
      company: company,
      education: education,
      experience: experience,
      jobCategory: jobCategory,
      jobDescription: jobDescription,
      jobLinkHref: jobLinkHref,
      jobRequirement: jobRequirement,
      jobResponsibilities: jobResponsibilities,
      jobTitle: jobTitle,
      jobType: jobType,
      postedAt: postedAt,
      salary: salary,
      skills: skills,
    );
  }
}
