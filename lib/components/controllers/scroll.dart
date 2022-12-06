import 'package:benji_dev/models/header_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

onTapNavItem({required GlobalKey key, required String navItemName}) {
  for (int index = 0; index < headerItems.length; index++) {
    if (navItemName == headerItems[index].title) {
      Scrollable.ensureVisible(key.currentContext!);

      headerItems[index].isSelected = true;
      Get.back();
    } else {
      headerItems[index].isSelected = false;
    }
  }
}
