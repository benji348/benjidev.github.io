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
          'Developping full applictions on Android & Ios, I built some applications for clients with Flutter & Dart',
      title: 'Develop'),
  DesighProcessModel(
      icon: Icons.code,
      subtitle:
          'I started programming in the year of  2019 with C language, yeah I know it\'s recent but I put all my energy, hard work and my determination',
      title: 'Experience'),
  DesighProcessModel(
      icon: Icons.design_services,
      subtitle:
          'Creating some awesome UI design for mobile apps and some Websites, developing fully fonctional apps and websites ',
      title: 'UI Design'),
  DesighProcessModel(
      icon: Feather.hard_drive,
      subtitle:
          'Having some knowledge for these programming languages:Java, Kotlin and Dart, some will be added in the due time',
      title: 'Back end'),
];
