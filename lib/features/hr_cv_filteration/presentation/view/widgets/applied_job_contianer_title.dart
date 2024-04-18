import 'package:flutter/material.dart';
import 'package:gp_app/features/hr_cv_filteration/presentation/view/widgets/cv_filter_view.dart';

class AppliedJobContainerTitle extends StatelessWidget {
  const AppliedJobContainerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CvFilterView()));
      },
      child: Container(
        width: 350,
        height: 100,
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromARGB(238, 239, 241, 240),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Stack Developer",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Design, develop, and maintain websites and web applications using modern technologies such as HTML5, CSS3, JavaScript, React, Angular, Vue.js, Node.js, Express.js, MongoDB, and MySQL.",
                    style: TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
