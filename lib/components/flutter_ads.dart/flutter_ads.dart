import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class FlutterAds {
  Future<InitializationStatus> initialize;
  FlutterAds(this.initialize);

  String get bannerId => Platform.isAndroid
      ? 'ca-app-pub-7459600930028673/6178556696'
      : 'ca-app-pub-3940256099942544/2934735716';

  BannerAdListener get adListener => _adListener;

  final BannerAdListener _adListener =
      BannerAdListener(onAdLoaded: (ad) => print('Ad laoded: ${ad.adUnitId}'));
}
