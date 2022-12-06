import 'package:benji_dev/components/controllers/scroll.dart';
import 'package:benji_dev/models/header_item_model.dart';
import 'package:benji_dev/utils/screen_helper.dart';

import 'package:flutter/material.dart';

Widget mouseRegionHeaderItem(BuildContext context, int index) {
  return ScreenHelper.isMobile(context)
      ? MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ListTile(
            onTap: () => onTapNavItem(
                key: headerItems[index].key,
                navItemName: headerItems[index].title!),
            title: Text(headerItems[index].title!,
                style: const TextStyle(color: Colors.white)),
          ),
        )
      : MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            margin: const EdgeInsets.only(right: 30.0),
            child: GestureDetector(
              onTap: () => onTapNavItem(
                  key: headerItems[index].key,
                  navItemName: headerItems[index].title!),
              child: Text(
                headerItems[index].title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
}
