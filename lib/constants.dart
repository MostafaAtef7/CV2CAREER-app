import 'package:flutter/material.dart';

import 'features/onboarding/data/models/onboarding_model.dart';

const Color kPrimaryColor = Color(0xff03D802);
final List<OnboardingModel> onboardingContentList = [
  OnboardingModel(
      image: 'assets/images/Resume.png',
      title: 'Welcome to \nCV2Career ! Let’s start',
      description: ''),
  OnboardingModel(
      image: 'assets/images/Organize_resume.png',
      title: 'ATS-Friendly Format',
      description:
          'Organize your CV by convert it from traditional cv to ats friendly format .'),
  OnboardingModel(
      image: 'assets/images/career_progress_ivdb.png',
      title: 'Job Recommendation',
      description:
          'Find your perfect job title based on your skills and experience .'),
  OnboardingModel(
      image: 'assets/images/Filter-bro.png',
      title: 'CV Filteration',
      description:
          'Help HR find suitable job applicant by filtering cvs and give score to each resume of Job applicant')
];
