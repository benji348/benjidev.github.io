import 'package:benji_dev/models/services_model.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: duration,
          padding: const EdgeInsets.all(kDefaultPadding * 1.5),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              if (!isHover)
                BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.1),
                ),
            ],
          ),
          child: Image.asset(
            services[widget.index].imagePath,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 10),
        FittedBox(
          child: Text(
            services[widget.index].title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
