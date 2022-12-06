import 'package:benji_dev/components/controllers/custom_dialog.dart';
import 'package:benji_dev/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselItemModel {
  final Widget text;
  final Widget image;
  CarouselItemModel({required this.image, required this.text});
}

List<CarouselItemModel> caroureslItems = List.generate(
  5,
  (index) => CarouselItemModel(
      text: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('BEN\nAMPOUALA',
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  height: 1.3)),
          const SizedBox(
            height: 15.0,
          ),
          Text('SOFTWARE DEVELOPER',
              style: GoogleFonts.oswald(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0)),
          const Divider(
            thickness: 3,
            color: kPrimaryColor,
            endIndent: 40,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Software Developer, based in China origin of Congo',
            style: TextStyle(color: kCaptionColor, fontSize: 18.0, height: 1.5),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Wrap(
            children: [
              const Text(
                'Need a full mobile application or maybe a Website? ',
                style: TextStyle(
                    color: kCaptionColor, fontSize: 18.0, height: 1.5),
              ),
              GestureDetector(
                onTap: () => customDialog('Link Me!', 'Subject', 'Type Message',
                    FlutterIcons.handshake_faw5, 'Link Me'),
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    'Got a Project? Link Me.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 18.0,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextButton(
                autofocus: true,
                onPressed: () => customDialog(
                    'Link Me!',
                    'Subject',
                    'Enter your message',
                    FlutterIcons.handshake_faw5,
                    'Link Me'),
                child: const Text(
                  'Let\'s get in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      image: Image.asset(
        'assets/ampouala.png',
        fit: BoxFit.fill,
      )),
);
