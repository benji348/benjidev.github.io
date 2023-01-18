import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DesighProcessModel {
  final String title;
  final IconData icon;
  final String subtitle;

  DesighProcessModel(
      {required this.icon, required this.subtitle, required this.title});
}

//Data of design
List<DesighProcessModel> designs = [
  DesighProcessModel(
      icon: Icons.mobile_friendly_rounded,
      subtitle:
          'Developping full applictions on Android & Ios, I build cross plat-form applicaions for my clients with Flutter & Dart',
      title: 'Develop'),
  DesighProcessModel(
      icon: Icons.code,
      subtitle:
          'Software Developer with 3 years of experience in developing full cross-platform applications using Flutter and Dart.Currently learning Python in the final year of a Master\'s degree in Computer Science and Technology.',
      title: 'Experience'),
  DesighProcessModel(
      icon: Icons.design_services,
      subtitle:
          'Strong background in UI design and experience with Dart and Flutter framework. Creating some awesome UI design for mobile apps and some Websites, developing fully fonctional apps and websites ',
      title: 'UI Design'),
  DesighProcessModel(
      icon: Feather.hard_drive,
      subtitle:
          'Having some knowledge for these programming languages:Java, Kotlin and Dart, Currently learning Python in the final year of a Master\'s degree',
      title: 'Back end'),
];

String intro =
    "I am a software developer with over 3 years of experience, proficient in a variety of programming languages and technologies. As a developer, I have delivered high-quality code on time and within budget, and excel at problem-solving and collaborating with cross-functional teams. I am highly organized, detail-oriented, and have strong communication, content writter, and time management skills. I am constantly seeking to learn and grow as a developer.";
