import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/utils/classes/assets.dart';

class TemplateViewBody extends StatefulWidget {
  const TemplateViewBody({super.key, required this.checkHR});
  final String checkHR;
  @override
  State<TemplateViewBody> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateViewBody> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Choose the template",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked1 = !isChecked1;
                  if (isChecked2 == true) {
                    isChecked2 = !isChecked2;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: isChecked1 ? kPrimaryColor : Colors.transparent,
                  style: BorderStyle.solid,
                  width: 2,
                )),
                child: Image.asset(
                  AssetsData.template1,
                  width: 200,
                  height: 220,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked2 = !isChecked2;
                  if (isChecked1 == true) {
                    isChecked1 = !isChecked1;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: isChecked2 ? kPrimaryColor : Colors.transparent,
                  style: BorderStyle.solid,
                  width: 2,
                )),
                child: Image.asset(
                  AssetsData.template2,
                  width: 200,
                  height: 250,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context)
                  .push(AppRouter.uploadCV, extra: widget.checkHR),
              child: Container(
                padding: EdgeInsets.only(left: 250),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
