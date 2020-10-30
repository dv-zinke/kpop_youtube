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

    print(_bannerAd);
    print("ㅇㅇ");
  }

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: ApiKey.bannerId,
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) if (disposed)
            _bannerAd.dispose();
          else
            _bannerAd.show(
                anchorOffset: 60,
                anchorType: AnchorType.bottom);
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

  void displayBanner() async {
    disposed = false;
    if (_bannerAd == null) _bannerAd = createBannerAd();
    _bannerAd.load();
  }

  void hideBanner() async {
    await _bannerAd?.dispose();
    disposed = true;
    _bannerAd = null;
  }
}
