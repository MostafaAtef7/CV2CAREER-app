import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/cv_view/data/cv_data.dart';
import 'package:gp_app/features/hr_cv_filteration/presentation/view/widgets/cv_container.dart';

class CvFilterView extends StatefulWidget {
  const CvFilterView({super.key});

  @override
  State<CvFilterView> createState() => _CvFilterViewState();
}

class _CvFilterViewState extends State<CvFilterView> {
  List<String> names = [
    "Youssef Ibrahim",
    "Fatma Ahmed",
    "Mohamed Ali",
    "Mohamed Ahmed",
    "Ahmed Emam",
  ];
  List<double> percentage = [0.87, 0.70, 0.67, 0.65, 0.30];
  List<String> url = [
    "HRs/hr105@gmail.com/ParsedResume 1.pdf",
    "HRs/hr105@gmail.com/ParsedResume 4.pdf",
    "HRs/hr105@gmail.com/ParsedResume 3.pdf",
    "HRs/hr105@gmail.com/ParsedResume 5.pdf",
    "HRs/hr105@gmail.com/ParsedResume 2.pdf",
  ];
  List<String> emails = [
    "youssef.ibrahim@gmail.com",
    "fatmaahmed@gmail.com",
    "mohamedai@gmail.com",
    "mohamed.ahmed@gmail.com",
    "ahmed_em@gmail.com",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(
            paddingHorizontal: 20,
            paddingVertical: 30,
            widget: Text(
              "Full Stack Developer",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: "Inter",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 18,
              top: 65,
            ),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final file = await CvApi.loadFirebasePdf(url: url[index]);
                    GoRouter.of(context).push(AppRouter.viewCV, extra: file);
                  },
                  child: CVContainer(
                    txt: names[index],
                    per: percentage[index],
                    email: emails[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
