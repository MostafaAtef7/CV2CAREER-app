import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';

import 'above_container.dart';
import 'custom_text_span.dart';

class JobViewDetailsBody extends StatelessWidget {
  const JobViewDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          const Column(
            children: [
              AboveContainer(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextSpan(
                          title: "Job Title: ",
                          subtitle: "Data Science\n",
                        ),
                        CustomTextSpan(
                          title: "Company: ",
                          subtitle: "Microsoft\n",
                        ),
                        CustomTextSpan(
                            title: "Job Description: ",
                            subtitle:
                                "\n\nAMERIA Investment Consulting Company is seeking a Chief Financial Officer. This position manages the company's fiscal and administrative functions, provides highly responsible and technically complex staff assistance to the Executive Director. The work performed and investment management, as well as management, supervisory, and administrative skills.\n"),
                        CustomTextSpan(
                            title: "Job Requirement:",
                            subtitle:
                                "\n\nin development of proper documentation and internal system. \n- Directs and oversees the annual budgeting process, including.\n"),
                        CustomTextSpan(
                            title: "Required:",
                            subtitle:
                                ''' \n\n-Bachelor's Degree; Master's is preferred\n'''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  size: 40,
                                ),
                                CustomTextSpan(
                                  title: "Location\n",
                                  subtitle: "England\n",
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.money,
                                  size: 40,
                                ),
                                CustomTextSpan(
                                  title: "Salary\n",
                                  subtitle: r"5000$" "\n",
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 40,
                                ),
                                CustomTextSpan(
                                  title: "Deadline\n",
                                  subtitle: "30/3/2024\n",
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: (){},
                  text: "Apply",
                  width: 100,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
