import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/onboarding_model.dart';

const Color kPrimaryColor = Color(0xff03D802);
// onboarding
final List<Onboarding> onboardingContentList = [
  Onboarding(
      image: 'assets/images/Resume.png',
      title: 'Welcome to \nCV2Career ! Let’s start',
      description: ''),
  Onboarding(
      image: 'assets/images/Organize_resume.png',
      title: 'ATS-Friendly Format',
      description:
          'Organize your CV by convert it from traditional cv to ats friendly format .'),
  Onboarding(
      image: 'assets/images/career_progress_ivdb.png',
      title: 'Job Recommendation',
      description:
          'Find your perfect job title based on your skills and experience .'),
  Onboarding(
      image: 'assets/images/Filter-bro.png',
      title: 'CV Filteration',
      description:
          'Help HR find suitable job applicant by filtering cvs and give score to each resume of Job applicant')
];
