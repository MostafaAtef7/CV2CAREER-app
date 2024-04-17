import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final String companyName;
  final String salary;
  final String jobName;
  final String location;
  final String type;
  final String description;
  final String requirement;
  final Timestamp timestamp;

  Data({
    required this.companyName,
    required this.salary,
    required this.jobName,
    required this.location,
    required this.type,
    required this.description,
    required this.requirement,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'salary': salary,
      'jobName': jobName,
      'location': location,
      'type': type,
      'description': description,
      'requirement': requirement,
      'timestamp': timestamp,
    };
  }
}
