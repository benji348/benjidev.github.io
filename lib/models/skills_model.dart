import 'package:flutter/material.dart';

class SkillsModel {
  final String? skill;
  final int? percentage;
  final Color? col;

  SkillsModel({
    @required this.skill,
    @required this.percentage,
    @required this.col,
  });
}

List<SkillsModel> skills = [
  SkillsModel(skill: "Flutter & Dart", percentage: 75, col: Colors.blue),
  SkillsModel(skill: "Java & Kotlin", percentage: 39, col: Colors.white),
  SkillsModel(
      skill: "Python",
      percentage: 57,
      col: const Color.fromARGB(255, 74, 134, 5)),
  SkillsModel(
      skill: "Firebase/SQL",
      percentage: 48,
      col: const Color.fromARGB(255, 94, 94, 2)),
  SkillsModel(skill: "NodeJs", percentage: 55, col: Colors.green),
  SkillsModel(skill: "WordPress", percentage: 48, col: Colors.blueGrey),
];
