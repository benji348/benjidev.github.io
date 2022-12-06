import 'package:flutter/material.dart';

class Feedback {
  final String name, review, userPic;
  final int? id;
  final Color? color;

  Feedback(
      {required this.name,
      required this.review,
      required this.userPic,
      this.id,
      this.color});
}

// List of feedbacks
List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    name: "Atalib Ag",
    review:
        'bendiDev did not create an application or a website for me but we are partenar of coding we have been creating apps and websites for our clients',
    userPic: "assets/keyboard.jpg",
    color: const Color(0xFFFFF3DD),
  ),
  Feedback(
    id: 2,
    name: "Novy Bafouka",
    review:
        'Thank you sir for the awesome UI made of my movie application, I will be back soon for more and recommand people to you!\n',
    userPic: "assets/futurism.jpg",
    color: const Color(0xFFD9FFFC),
  ),
  Feedback(
    id: 3,
    name: "Amour Bath",
    review:
        'Thank you to Mr. Ampouala for his awesome work for my real Estae website, for you who is reading this I guarantee you will not be desapointed',
    userPic: "assets/watchdogs.jpg",
    color: const Color(0xFFFFE0E0),
  ),
];

String review =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua enim ad minim veniam.';
