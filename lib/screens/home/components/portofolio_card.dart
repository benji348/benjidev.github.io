import 'package:benji_dev/models/portofolio_model.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:flutter/material.dart';

class PortofolioCard extends StatefulWidget {
  // just press "Command + ."
  const PortofolioCard({
    Key? key,
    this.index,
    this.press,
  }) : super(key: key);

  final int? index;
  final VoidCallback? press;

  @override
  _PortofolioCardState createState() => _PortofolioCardState();
}

class _PortofolioCardState extends State<PortofolioCard> {
  bool isHover = false;

  // get kDefaultCardShadow => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 220,
      width: 490,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [if (isHover) kDefaultCardShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(portodata[widget.index!].image![0]!, fit: BoxFit.cover),
          Image.asset(portodata[widget.index!].image![1]!, fit: BoxFit.cover),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(portodata[widget.index!].category!.toUpperCase()),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    portodata[widget.index!].title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
