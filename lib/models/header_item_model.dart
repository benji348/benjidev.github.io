import 'package:benji_dev/components/controllers/custom_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HeaderItemModel {
  final GlobalKey key;
  final String? title;
  final bool isButton;
  final VoidCallback? onTap;
  bool isSelected;

  HeaderItemModel({
    this.onTap,
    this.isSelected = false,
    this.isButton = false,
    this.title,
    required this.key,
  });
}

final List<HeaderItemModel> headerItems = [
  HeaderItemModel(title: 'Home', key: GlobalKey(), isSelected: true),
  HeaderItemModel(title: 'About', key: GlobalKey()),
  HeaderItemModel(title: 'Services', key: GlobalKey()),
  HeaderItemModel(title: 'Portofolio', key: GlobalKey()),
  HeaderItemModel(title: 'Testimonials', key: GlobalKey()),
  HeaderItemModel(title: 'Contact', key: GlobalKey()),
  HeaderItemModel(
      key: GlobalKey(),
      title: 'Hire me',
      isButton: true,
      onTap: () => customDialog('Hiring me...', 'Employer or Company name',
          'Enter your message', FlutterIcons.smile_beam_faw5, 'Hire me'))
];
