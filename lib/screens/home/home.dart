import 'package:benji_dev/components/controllers/mouse_region_header_item.dart';
import 'package:benji_dev/components/flutter_ads.dart/flutter_ads.dart';
import 'package:benji_dev/models/header_item_model.dart';

import 'package:benji_dev/screens/home/components/carousel.dart';
import 'package:benji_dev/screens/home/components/cv_section.dart';
import 'package:benji_dev/screens/home/components/footer.dart';
import 'package:benji_dev/screens/home/components/header.dart';
import 'package:benji_dev/screens/home/components/portofolio.dart';
import 'package:benji_dev/screens/home/components/services.dart';
import 'package:benji_dev/screens/home/components/testimonials.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  BannerAd? banner;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final adsState = Provider.of<FlutterAds>(context);
    adsState.initialize.then((value) {
      setState(() {
        banner = BannerAd(
            size: AdSize.fluid,
            adUnitId: adsState.bannerId,
            listener: adsState.adListener,
            request: const AdRequest())
          ..load();
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return headerItems[index].isButton
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                                color: kDangerColor,
                                borderRadius: BorderRadius.circular(8.0)),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: TextButton(
                              onPressed: headerItems[index].onTap,
                              child: Text(
                                headerItems[index].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : mouseRegionHeaderItem(context, index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: headerItems.length),
          ),
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () {
            Scrollable.ensureVisible(headerItems[0].key.currentContext!,
                duration: const Duration(microseconds: 600));
          },
          child: const Icon(Icons.arrow_upward),
        ),
      ),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    key: headerItems[0].key,
                    child: Carousel(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  VisibilityDetector(
                    key: const Key("About"),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 10) {
                        _controller.forward();
                      }
                    },
                    child: CvSection(
                      key: headerItems[1].key,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    key: headerItems[2].key,
                    child: const Services(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    key: headerItems[3].key,
                    child: const Portofolio(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    key: headerItems[4].key,
                    child: const Testimonials(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Footer(
                    key: headerItems[5].key,
                  ),
                  if (banner == null)
                    const SizedBox(
                      height: 50,
                    )
                  else
                    SizedBox(height: 50, child: AdWidget(ad: banner!))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
