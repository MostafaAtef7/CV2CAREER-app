import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/assets.dart';
import 'package:gp_app/features/tempales/presentation/view/template_view.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class GithubViewBody extends StatefulWidget {
  const GithubViewBody({super.key, required this.checkHR});
  final String checkHR;

  @override
  State<GithubViewBody> createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubViewBody> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.githublogo,
                width: 35,
              ),
              Image.asset(
                AssetsData.githubtitle,
                width: 80,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: unSelectedColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  const Text(
                    "Would you like to add the projects that are found on GitHub to your CV?",
                    style: TextStyle(
                        color: unSelectedColor, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 190),
                    child: MSHCheckbox(
                      size: 30,
                      value: isChecked,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: kPrimaryColor,
                      ),
                      style: MSHCheckboxStyle.stroke,
                      onChanged: (selected) {
                        setState(
                          () {
                            isChecked = selected;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            height: 257,
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            decoration: const BoxDecoration(
                color: unSelectedColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Including GitHub repositories in your CV highlights your coding skills and provides potential employers with tangible examples\n of your work and coding style. It reflects your engagement with the developer community and your commitment to continuous learning and improvement.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TemplateView(
                          checkHR: widget.checkHR,
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
