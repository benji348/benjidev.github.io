import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBuilt extends StatelessWidget {
  const TitleBuilt(this.id, {Key? key, required this.text}) : super(key: key);
  final String text;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Divider(
          thickness: 3,
          endIndent: ScreenHelper.isMobile(context)
              ? MediaQuery.of(context).size.width * .5
              : MediaQuery.of(context).size.width * .75,
          color: kPrimaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
