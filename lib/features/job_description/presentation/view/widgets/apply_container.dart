import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/widgets/defaultbutton.dart';
import 'package:gp_app/features/job_description/presentation/view/widgets/text_component.dart';

class ApplyContainer extends StatelessWidget {
  const ApplyContainer({super.key});

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
          const TextComponent(txt: "Name Job", fontW: FontWeight.w600),
          const SizedBox(height: 10),
          const Row(
            children: [
              TextComponent(txt: "Location", fontW: FontWeight.w300),
              SizedBox(
                child: Text(
                  " - ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              TextComponent(txt: "Type", fontW: FontWeight.w300),
            ],
          ),
          const SizedBox(height: 7),
          const Row(
            children: [
              TextComponent(txt: "Deadline", fontW: FontWeight.w300),
              SizedBox(
                child: Text(
                  " - ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              TextComponent(txt: "Salary", fontW: FontWeight.w300),
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
