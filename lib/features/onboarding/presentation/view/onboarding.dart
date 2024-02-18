import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:gp_app/features/onboarding/presentation/view/widgets/dot_indicator.dart';
import 'package:gp_app/features/onboarding/presentation/view/widgets/onboard_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static String id = 'onboadingPage';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingContentList.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    // if (index == 3) {
                    //   isLastPage = true;
                    // }
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboardingContentList[index].image,
                  title: onboardingContentList[index].title,
                  description: onboardingContentList[index].description,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  ...List.generate(
                      onboardingContentList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            if (pageIndex == 3) {
                              GoRouter.of(context).push(AppRouter.login);
                            } else {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
