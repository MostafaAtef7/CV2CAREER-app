// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:gp_app/core/utils/classes/database.dart';
// import 'package:gp_app/core/utils/classes/jobs_model.dart';

// class Dataservises {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<List<Map<String, dynamic>>> getUserStream() {
//     final String currentUserID = _auth.currentUser!.uid;

//     return _firestore
//         .collection("Posts")
//         .doc(currentUserID)
//         .collection("Post")
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) {
//         final user = doc.data();

//         return user;
//       }).toList();
//     });
//   }

//   Future<void> addData(
//       {required String? jobLinkHref,
//       required String? jobTitle,
//       required String? jobType,
//       required String? company,
//       required String? postedAt,
//       required String? experience,
//       required String? salary,
//       required String? jobCategory,
//       required String? education,
//       required String? skills,
//       required String? jobDescription,
//       required String? jobResponsibilities,
//       required String? jobRequirement}) async {
//     final String currentUserID = _auth.currentUser!.uid;
//     final Timestamp timetemp = Timestamp.now();

//     JobsModel dataOfNewPost = JobsModel(
//       company: company,
//       education: education,
//       experience: experience,
//       jobCategory: jobCategory,
//       jobDescription: jobDescription,
//       jobLinkHref: jobLinkHref,
//       jobRequirement: jobRequirement,
//       jobResponsibilities: jobResponsibilities,
//       jobTitle: jobTitle,
//       jobType: jobType,
//       postedAt: postedAt,
//       salary: salary,
//       skills: skills,
//     );

//     await _firestore
//         .collection("Posts")
//         .doc(currentUserID)
//         .collection("Post")
//         .add(
//           dataOfNewPost.toJson(),
//         );

//     await Database().addJob(
//       company: company,
//       education: education,
//       experience: experience,
//       jobCategory: jobCategory,
//       jobDescription: jobDescription,
//       jobLinkHref: jobLinkHref,
//       jobRequirement: jobRequirement,
//       jobResponsibilities: jobResponsibilities,
//       jobTitle: jobTitle,
//       jobType: jobType,
//       postedAt: postedAt,
//       salary: salary,
//       skills: skills,
//     );
//   }
// }
