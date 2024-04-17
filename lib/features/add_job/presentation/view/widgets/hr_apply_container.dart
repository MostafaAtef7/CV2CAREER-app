import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';
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
            text: "Apply",
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Alert',
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              child: const Icon(
                                Icons.close,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                        const Divider(
                          color: unSelectedColor,
                          height: 15,
                        ),
                      ],
                    ),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Your CV will be sent once you click OK'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                            colors: [kSecondColor, kPrimaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            stops: [0.0, 0.9],
                          ),
                        ),
                        child: TextButton(
                          child: const Text('Apply',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 13)),
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Send CV to HR
                            // _______________________________*
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
