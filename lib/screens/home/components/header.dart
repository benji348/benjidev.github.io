import 'package:benji_dev/components/controllers/mouse_region_header_item.dart';

import 'package:benji_dev/models/header_item_model.dart';

import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/globals.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Scrollable.ensureVisible(headerItems[0].key.currentContext!);
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "benjiDev",
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: '.',
              style: GoogleFonts.oswald(
                  color: kPrimaryColor,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold))
        ])),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: true,
      child: Row(
        children:
            // Row(children: buildNavItems(headerItems)
            List.generate(
                headerItems.length,
                (index) => headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextButton(
                              onPressed: headerItems[index].onTap,
                              child: Text(
                                headerItems[index].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      )
                    : mouseRegionHeaderItem(context, index)),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: builHeader(),
      ),
      mobile: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: mobileHeader(),
      ),
      tablet: builHeader(),
    );
  }

  //mobile header
  Widget mobileHeader() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderLogo(),
          GestureDetector(
            onTap: () {
              Globals.scaffoldKey.currentState!.openEndDrawer();
            },
            child: const Icon(
              FlutterIcons.menu_fea,
              color: Colors.white,
              size: 28.0,
            ),
          )
        ],
      ),
    ));
  }

//Desktop and Tablet header
  Widget builHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [HeaderLogo(), HeaderRow()],
      ),
    );
  }
}
