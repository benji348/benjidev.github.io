import 'package:benji_dev/models/carousel_item_model.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Carousel extends StatelessWidget {
  Carousel({Key? key}) : super(key: key);
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double carouselConatinerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .9);
    return SizedBox(
      height: carouselConatinerHeight,
      width: double.infinity,
      // color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              items: List.generate(
                  1,
                  (index) => Builder(builder: (context) {
                        return Container(
                          constraints: BoxConstraints(
                              minHeight: carouselConatinerHeight),
                          child: ScreenHelper(
                            desktop: _buildDesktop(
                              context,
                              caroureslItems[index].text,
                              caroureslItems[index].image,
                            ),
                            tablet: _buidMidScreen(
                              context,
                              caroureslItems[index].text,
                              caroureslItems[index].image,
                            ),
                            mobile: _buidMobileScreen(
                              context,
                              caroureslItems[index].text,
                              caroureslItems[index].image,
                            ),
                          ),
                        );
                      })),
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: carouselConatinerHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Big Screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: false,
      child: Row(
        children: [Expanded(child: text), Expanded(child: image)],
      ),
    ),
  );
}

//mid screens
Widget _buidMidScreen(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 760.0,
      minWidth: 760.0,
      defaultScale: false,
      child: Row(
        children: [Expanded(child: text), Expanded(child: image)],
      ),
    ),
  );
}

//small screens
Widget _buidMobileScreen(BuildContext context, Widget text, Widget image) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .8),
      width: double.infinity,
      child: text);
}
