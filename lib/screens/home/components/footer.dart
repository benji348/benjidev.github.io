// ignore_for_file: sized_box_for_whitespace

import 'package:benji_dev/components/title_built.dart';
import 'package:benji_dev/models/footer_item.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: Icons.location_on_outlined,
    title: "ADDRESS",
    text1: "Wuhan City 430000",
    text2: "Building 28 4th floor in JXUT",
  ),
  FooterItem(
    iconPath: FlutterIcons.phone_android_mdi,
    title: "PHONE",
    text1: "+86 13125216235",
    text2: "",
  ),
  FooterItem(
    iconPath: Feather.mail,
    title: "EMAIL",
    text1: "benjaminampouala@gmail.com",
    text2: "",
  ),
  FooterItem(
    iconPath: Icons.network_wifi,
    title: "Social Network",
    text1: "",
    text2: "",
  )
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(1000.0, context),
      tablet: _buildUi(760.0, context),
      mobile: _buildUi(MediaQuery.of(context).size.width * .9, context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleBuilt(5, text: 'Contact mE'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          height: 150.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (footerItem.title == 'Social Network')
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          footerItem.iconPath,
                                          color: kPrimaryColor,
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(footerItem.title!,
                                            style: GoogleFonts.oswald(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        footerIcon(() async {
                                          try {
                                            launch(
                                                'weixin://dl/chat?Ben-Ampouala',
                                                forceWebView: false,
                                                enableJavaScript: true);
                                          } catch (e) {
                                            debugPrint(e.toString());
                                          }
                                        }, FlutterIcons.wechat_ant,
                                            Colors.green),
                                        footerIcon(() async {
                                          try {
                                            launch(
                                                'http://wa.me/+8613125216235',
                                                enableJavaScript: true,
                                                forceWebView: false);
                                          } catch (e) {
                                            debugPrint(e.toString());
                                          }
                                        }, FlutterIcons.whatsapp_faw,
                                            const Color(0xFF39F500)),
                                        footerIcon(() async {
                                          try {
                                            launch('http://m.me/ben.ampouala',
                                                forceWebView: false,
                                                enableJavaScript: true);
                                          } catch (e) {
                                            debugPrint(e.toString());
                                          }
                                        },
                                            FlutterIcons
                                                .facebook_messenger_faw5d,
                                            Colors.blue),
                                        footerIcon(
                                          () async {
                                            try {
                                              launch(
                                                  'https://www.instagram.com/benji_pif/',
                                                  enableJavaScript: true,
                                                  forceWebView: false);
                                            } catch (e) {
                                              debugPrint(e.toString());
                                            }
                                          },
                                          FlutterIcons.instagram_ant,
                                          const Color(0xFFF7682A),
                                        ),
                                        footerIcon(() async {
                                          try {
                                            launch(
                                                'https://www.linkedin.com/in/benjamin-ampouala-83a153201/',
                                                forceWebView: false,
                                                enableJavaScript: true);
                                          } catch (e) {
                                            debugPrint(e.toString());
                                          }
                                        }, FlutterIcons.linkedin_faw,
                                            Colors.blue)
                                      ],
                                    ),
                                  ],
                                ),
                              if (footerItem.title != 'Social Network')
                                FittedBox(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        footerItem.iconPath,
                                        color: kPrimaryColor,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        footerItem.title!,
                                        style: GoogleFonts.oswald(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                '${footerItem.text1}',
                                style: const TextStyle(
                                    color: kCaptionColor, height: 1.8),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2021 Ben AMPOUALA. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          );
        },
      ),
    ),
  );
}

Widget footerIcon(onTap, iconData, color) {
  return InkWell(
    onTap: onTap,
    child: Icon(
      iconData,
      color: color,
    ),
  );
}
