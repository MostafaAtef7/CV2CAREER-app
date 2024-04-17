import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/database.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/core/widgets/defaultbutton.dart';
import 'package:gp_app/features/add_job/presentation/view/widgets/text_field.dart';

class AddJobViewBody extends StatefulWidget {
  const AddJobViewBody({super.key});

  @override
  State<AddJobViewBody> createState() => _AddJobViewBodyState();
}

class _AddJobViewBodyState extends State<AddJobViewBody> {
  TextEditingController? companyName = TextEditingController();
  TextEditingController? salary = TextEditingController();
  TextEditingController? jobName = TextEditingController();
  TextEditingController? skills = TextEditingController();
  TextEditingController? type = TextEditingController();
  TextEditingController? description = TextEditingController();
  TextEditingController? requirement = TextEditingController();
  final Database _dataservises = Database();

  void sendData() async {
    if (companyName!.text.isNotEmpty &&
        salary!.text.isNotEmpty &&
        jobName!.text.isNotEmpty &&
        skills!.text.isNotEmpty &&
        type!.text.isNotEmpty &&
        description!.text.isNotEmpty &&
        requirement!.text.isNotEmpty) {
      _dataservises.addData(
          company: companyName!.text,
          education: "N/A",
          experience: "N/A",
          jobCategory: "N/A",
          jobDescription: description!.text,
          jobLinkHref: "N/A",
          jobRequirement: requirement!.text,
          jobResponsibilities: "N/A",
          jobTitle: jobName!.text,
          jobType: type!.text,
          postedAt: "N/A",
          salary: salary!.text,
          skills: skills!.text);
      companyName!.clear();
      salary!.clear();
      jobName!.clear();
      skills!.clear();
      type!.clear();
      description!.clear();
      requirement!.clear();

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: const EdgeInsets.all(13),
            height: 50,
            decoration: BoxDecoration(
              color: chatColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              " Please Fill All Fields !!",
              style: TextStyle(
                color: unSelectedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBar(
          paddingHorizontal: 10,
          paddingVertical: 10,
          widget: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 30,
            left: 30,
            top: 65,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 470,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AddTextfield(
                        controller: companyName,
                        title: "Company Name",
                        width: double.infinity,
                        maxline: 1,
                      ),
                      AddTextfield(
                        controller: jobName,
                        title: "Job Title",
                        width: double.infinity,
                        maxline: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddTextfield(
                            controller: type,
                            title: "Type",
                            width: 115,
                            maxline: 1,
                          ),
                          AddTextfield(
                            controller: salary,
                            title: "Salary",
                            width: 115,
                            maxline: 1,
                          )
                        ],
                      ),
                      AddTextfield(
                        controller: skills,
                        title: "Skills",
                        width: double.infinity,
                        maxline: 3,
                      ),
                      AddTextfield(
                        controller: description,
                        title: "Description",
                        width: double.infinity,
                        maxline: 3,
                      ),
                      AddTextfield(
                        controller: requirement,
                        title: "Requirement",
                        width: double.infinity,
                        maxline: 3,
                      ),
                    ],
                  ),
                ),
              ),
              DefaultButton(
                text: 'Add Job',
                onPressed: () async {
                  sendData();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
