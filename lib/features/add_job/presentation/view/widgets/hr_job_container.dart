import 'package:flutter/material.dart';
import 'package:gp_app/features/add_job/presentation/view/widgets/hr_job_des.dart';

class HrJobContainer extends StatelessWidget {
  final String companyName;
  final String salary;
  final String jobName;
  final String skills;
  final String type;
  final String description;
  final String requirement;
  const HrJobContainer(
      {super.key,
      required this.companyName,
      required this.salary,
      required this.jobName,
      required this.skills,
      required this.type,
      required this.description,
      required this.requirement});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HrJobDes(
              companyName: companyName,
              description: description,
              jobName: jobName,
              requirement: requirement,
              salary: salary,
              skills: skills,
              type: type,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 96,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      companyName ?? "N/A",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      jobName ?? "N/A",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/icons/dollar.png",
                                color: Colors.yellow, height: 15, width: 15),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                salary ?? "N/A",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                type ?? "N/A",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
