import 'package:benji_dev/components/title_built.dart';
import 'package:benji_dev/models/design_process_model.dart';
import 'package:benji_dev/screens/home/components/skills.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class CvSection extends StatelessWidget {
  const CvSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ScreenHelper(
          desktop: _buildUi(context, 1000.0),
          tablet: _buildUi(context, 700.0),
          mobile: _buildUi(context, MediaQuery.of(context).size.width * .9),
        ));
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBuilt(
            1,
            text: 'About mE',
          ),
          Text(
            intro,
            style: const TextStyle(color: kCaptionColor),
          ),
          const SizedBox(
            height: 40,
          ),
          LayoutBuilder(
            builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                  itemCount: designs.length,
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 20.0,
                      maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                              ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 2.0
                          : 250.0,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              designs[index].icon,
                              color: kPrimaryColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              designs[index].title,
                              style: GoogleFonts.oswald(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          designs[index].subtitle,
                          style: const TextStyle(
                              color: kCaptionColor,
                              fontSize: 15.0,
                              height: 1.0),
                        )
                      ],
                    );
                  });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('MADE BY A SINGLE CODEBASE\nBORN TO CODE ON FLUTTER',
                  style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      height: 1.8)),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () async {
                      try {
                        launch(
                            'https://drive.google.com/file/d/14IVzYGEpH6eaBY2QBuozqi5r-O0SICjW/view?usp=share_link',
                            forceWebView: true,
                            enableJavaScript: true);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    child: Text('Download CV',
                        style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                            height: 1.8)),
                  ),
                ),
              ),
            ],
          ),
          if (!ScreenHelper.isMobile(context) ||
              !ScreenHelper.isDesktop(context))
            const SizedBox(
              height: 100,
            ),
          const Skills(),
        ],
      ),
    );
  }
}
