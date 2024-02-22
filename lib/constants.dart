import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/assets.dart';

import 'features/onboarding/data/models/onboarding_model.dart';

const Color kPrimaryColor = Color(0XFF3FC3AE);

final List<OnboardingModel> onboardingContentList = [
  OnboardingModel(
      image: AssetsData.onboardingImage1,
      title: 'Welcome to \nCV2Career ! Let’s start',
      description: ''),
  OnboardingModel(
      image: AssetsData.onboardingImage2,
      title: 'ATS-Friendly Format',
      description:
          'Organize your CV by convert it from traditional cv to ats friendly format .'),
  OnboardingModel(
      image: AssetsData.onboardingImage3,
      title: 'Job Recommendation',
      description:
          'Find your perfect job title based on your skills and experience .'),
  OnboardingModel(
      image: AssetsData.onboardingImage4,
      title: 'CV Filteration',
      description:
          'Help HR find suitable job applicant by filtering cvs and give score to each resume of Job applicant')
];
