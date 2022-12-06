import 'package:benji_dev/models/feed_back.dart';
import 'package:benji_dev/utils/constants.dart';
import 'package:benji_dev/utils/screen_helper.dart';
import 'package:flutter/material.dart';

class FeedbackCard extends StatefulWidget {
  const FeedbackCard({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  _FeedbackCardState createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  Duration duration = const Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      margin: ScreenHelper.isMobile(context) || ScreenHelper.isDesktop(context)
          ? const EdgeInsets.only(top: kDefaultPadding * 2)
          : const EdgeInsets.only(
              top: kDefaultPadding * 3,
            ),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: ScreenHelper.isMobile(context) ? 350 : 300,
      width: ScreenHelper.isMobile(context) ? double.infinity : 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [if (isHover) kDefaultCardShadow],
      ),
      child: Column(
        children: [
          Transform.translate(
              offset: const Offset(0, -30),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  feedbacks[widget.index!].userPic,
                ),
                radius: 30,
              )),
          Text(
            feedbacks[widget.index!].review,
            style: const TextStyle(
              color: kCaptionColor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          Text(
            feedbacks[widget.index!].name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
