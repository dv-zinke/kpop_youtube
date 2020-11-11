import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/utils/ApiKey.dart';

class GoogleAdmob {
  static BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  bool disposed;

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'firebase', 'admob'],
    testDevices: <String>[],
  );

  init() async {
    FirebaseAdMob.instance.initialize(appId: ApiKey.appId);
    _interstitialAd = createInterstitialAd();
    _bannerAd = createBannerAd();

    _bannerAd..load()..show();
    print("A");
  }

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: ApiKey.bannerId,
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {

        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: ApiKey.interstitialID,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }

  showInterstitialAd() {
    _interstitialAd
      ..load()
      ..show();
  }

  displayBanner() {
    if (_bannerAd == null) _bannerAd = createBannerAd()..load();
    _bannerAd..show();
  }

  hideBanner()  {
    print(_bannerAd);
    if(_bannerAd != null) {
      print("Z");
      _bannerAd.dispose();
      _bannerAd = createBannerAd()..load();
    }
  }
}
