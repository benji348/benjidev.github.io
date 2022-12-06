import 'package:benji_dev/components/title_built.dart';
import 'package:benji_dev/models/feed_back.dart';
import 'package:benji_dev/screens/home/components/feedback_card.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  _TestimonialsState createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _testimonialsBuilt(context, 1000.0),
        tablet: _testimonialsBuilt(context, 760.0),
        mobile:
            _testimonialsBuilt(context, MediaQuery.of(context).size.width * .9),
      ),
    );
  }

  Widget _testimonialsBuilt(BuildContext context, double width) {
    return ResponsiveWrapper(
        defaultScale: false,
        maxWidth: width,
        minWidth: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleBuilt(4, text: 'Testimonials'),
            const SizedBox(
              height: 30,
            ),
            ScreenHelper.isMobile(context) &&
                    MediaQuery.of(context).size.width < 600
                ? CarouselSlider(
                    items: List.generate(
                        feedbacks.length,
                        (index) => FeedbackCard(
                              index: index,
                            )),
                    options:
                        CarouselOptions(autoPlay: true, viewportFraction: 1))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        feedbacks.length,
                        (index) => FeedbackCard(
                              index: index,
                            ))),
            const SizedBox(height: 100)
          ],
        ));
  }
}
