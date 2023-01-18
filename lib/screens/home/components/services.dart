import 'package:benji_dev/components/title_built.dart';
import 'package:benji_dev/models/services_model.dart';
import 'package:benji_dev/screens/home/components/service_card.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _servicesBuilt(context, 1000.0),
        tablet: _servicesBuilt(context, 760.0),
        mobile: _servicesBuilt(context, MediaQuery.of(context).size.width * .9),
      ),
    );
  }

  Widget _servicesBuilt(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBuilt(2, text: 'Services'),
          LayoutBuilder(
            builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                itemCount: services.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 250.0),
                itemBuilder: (context, index) {
                  return ServiceCard(index: index);
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
