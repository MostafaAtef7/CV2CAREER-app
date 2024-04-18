import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/defaultbutton.dart';
import 'package:gp_app/features/job_description/presentation/view/widgets/text_component.dart';

class HrApplyContainer extends StatelessWidget {
  final String companyName;
  final String salary;
  final String jobName;
  final String type;
  const HrApplyContainer(
      {super.key,
      required this.companyName,
      required this.salary,
      required this.jobName,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 25, left: 25),
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0.9,
                blurRadius: 4)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextComponent(txt: jobName ?? "N/A", fontW: FontWeight.w600),
          const SizedBox(height: 10),
          Row(
            children: [
              const TextComponent(txt: "Type", fontW: FontWeight.w300),
              const SizedBox(
                child: Text(
                  " - ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              TextComponent(txt: type ?? "N/A", fontW: FontWeight.w300),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const TextComponent(txt: "Salary", fontW: FontWeight.w300),
              const SizedBox(
                child: Text(
                  " - ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                width: 200,
                child:
                    TextComponent(txt: salary ?? "N?A", fontW: FontWeight.w300),
              )
            ],
          ),
          DefaultButton(
            text: "Delete Job",
            onPressed: () {
              String id = FirebaseAuth.instance.currentUser!.uid;
              // realTime
              DatabaseReference ref = FirebaseDatabase.instance.ref("jobs/$id");
              ref.remove();
              // firestore
              Future<void> deleteSubcollections(String documentPath) async {
                final QuerySnapshot querySnapshot = await FirebaseFirestore
                    .instance
                    .collection(
                        documentPath) // Reference the subcollection directly
                    .get();

                final List<Future<void>> futures = [];

                for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
                  futures.add(doc.reference.delete());
                }

                await Future.wait(futures);
              }

              Future<void> deleteDocumentAndSubcollections(
                  String documentPath) async {
                // Delete documents in subcollections
                await deleteSubcollections(documentPath);

                // Delete the parent document
                await FirebaseFirestore.instance.doc(documentPath).delete();
              }

              deleteDocumentAndSubcollections("Posts/$id/Post");

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
