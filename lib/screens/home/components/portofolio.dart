import 'package:benji_dev/components/title_built.dart';
import 'package:benji_dev/models/portofolio_model.dart';
import 'package:benji_dev/screens/home/components/portofolio_card.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Portofolio extends StatelessWidget {
  const Portofolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ScreenHelper(
          desktop: _portofolioBuilt(context, 1000.0),
          tablet: _portofolioBuilt(context, 760.0),
          mobile: _portofolioBuilt(
              context, MediaQuery.of(context).size.width * 0.9),
        ));
  }

  Widget _portofolioBuilt(BuildContext context, double width) {
    return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleBuilt(3, text: 'Portofolio'),
            ScreenHelper.isMobile(context) &&
                    MediaQuery.of(context).size.width < 600
                ? CarouselSlider(
                    items: List.generate(
                        portodata.length,
                        (index) => PortofolioCard(
                              index: index,
                              press: () {},
                            )),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      // scrollPhysics: NeverScrollableScrollPhysics(),
                      // height: MediaQuery.of(context).size.height*
                    ))
                : Wrap(
                    spacing: kDefaultPadding,
                    runSpacing: kDefaultPadding * 2,
                    children: List.generate(portodata.length,
                        (index) => PortofolioCard(index: index, press: () {}))),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
