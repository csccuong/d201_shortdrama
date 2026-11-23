import 'package:flutter/foundation.dart';
import '../../core/constants/app_constants.dart';
import 'ad_id_name.dart';

bool get _isIOS => defaultTargetPlatform == TargetPlatform.iOS;

Map<String, Map<String, String>> get myAdsId => {
      Environment.dev: _isIOS
          ? {
              MyAdIdName.appOpenResume:
                  'ca-app-pub-3940256099942544/5575463023',
              MyAdIdName.bannerSplash:
                  'ca-app-pub-3940256099942544/2934735716',
              MyAdIdName.interSplash:
                  'ca-app-pub-3940256099942544/4411468910',
              MyAdIdName.interSplashHigh:
                  'ca-app-pub-3940256099942544/4411468910',
              MyAdIdName.nativeLanguage:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeLanguageHigh:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeLanguageClick:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeLanguageClickHigh:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeOnboard1Ad:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeOnboardFull1Ad:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeOnboardFull2Ad:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeOnboard4Ad:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.interAll: 'ca-app-pub-3940256099942544/4411468910',
              MyAdIdName.rewardedAd:
                  'ca-app-pub-3940256099942544/1712485313',
              MyAdIdName.interOnboard:
                  'ca-app-pub-3940256099942544/4411468910',

              MyAdIdName.nativeFull:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeAll:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.nativeCollap:
                  'ca-app-pub-3940256099942544/3986624511',
              MyAdIdName.bannerAll:
                  'ca-app-pub-3940256099942544/2934735716',
              MyAdIdName.nativePip:
                  'ca-app-pub-3940256099942544/3986624511',
            }
          : {
              MyAdIdName.appOpenResume:
                  'ca-app-pub-3940256099942544/9257395921',
              MyAdIdName.bannerSplash:
                  'ca-app-pub-3940256099942544/6300978111',
              MyAdIdName.interSplash:
                  'ca-app-pub-3940256099942544/1033173712',
              MyAdIdName.interSplashHigh:
                  'ca-app-pub-3940256099942544/1033173712',
              MyAdIdName.nativeLanguage:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeLanguageHigh:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeLanguageClick:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeLanguageClickHigh:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeOnboard1Ad:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeOnboardFull1Ad:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeOnboardFull2Ad:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeOnboard4Ad:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.interAll: 'ca-app-pub-3940256099942544/1033173712',
              MyAdIdName.rewardedAd:
                  'ca-app-pub-3940256099942544/5224354917',
              MyAdIdName.interOnboard:
                  'ca-app-pub-3940256099942544/1033173712',
              MyAdIdName.nativeFull:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeAll:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.nativeCollap:
                  'ca-app-pub-3940256099942544/2247696110',
              MyAdIdName.bannerAll:
                  'ca-app-pub-3940256099942544/6300978111',
              MyAdIdName.nativePip:
                  'ca-app-pub-3940256099942544/2247696110',
            },
      // Replace with production AdMob unit IDs for DXX ShortDrama when releasing
      Environment.prod: _isIOS
          ? {}
          : {
              MyAdIdName.appOpenResume:
                  'ca-app-pub-9900730300733887/9524010419',
              MyAdIdName.bannerSplash:
                  'ca-app-pub-9900730300733887/5584765402',
              MyAdIdName.interSplashHigh:
                  'ca-app-pub-9900730300733887/5393193718',
              MyAdIdName.interSplash:
                  'ca-app-pub-9900730300733887/2788492939',
              MyAdIdName.nativeLanguageHigh:
                  'ca-app-pub-9900730300733887/8840437952',
              MyAdIdName.nativeLanguage:
                  'ca-app-pub-9900730300733887/5939988623',
              MyAdIdName.nativeLanguageClick:
                  'ca-app-pub-9900730300733887/8318739950',
              MyAdIdName.nativeLanguageClickHigh:
                  'ca-app-pub-9900730300733887/5503828173',
              MyAdIdName.nativeOnboard1Ad:
                  'ca-app-pub-9900730300733887/1178616531',
              MyAdIdName.nativeOnboardFull1Ad:
                  'ca-app-pub-9900730300733887/9792884982',
              MyAdIdName.nativeOnboardFull2Ad:
                  'ca-app-pub-9900730300733887/5769879494',
              MyAdIdName.nativeOnboard4Ad:
                  'ca-app-pub-9900730300733887/7527356289',
              MyAdIdName.interOnboard:
                  'ca-app-pub-9900730300733887/6333694118',
              MyAdIdName.nativeAll:
                  'ca-app-pub-9900730300733887/6480325937',
              MyAdIdName.nativeCollap:
                  'ca-app-pub-9900730300733887/5020612442',
              MyAdIdName.bannerAll:
                  'ca-app-pub-9900730300733887/4734718165',
              MyAdIdName.nativePip: 'ca-app-pub-9900730300733887/6480325937',
              MyAdIdName.interAll: 'ca-app-pub-9900730300733887/7302453017',
              MyAdIdName.rewardedAd: 'ca-app-pub-9900730300733887/4901192946',
              MyAdIdName.nativeFull:
                  'ca-app-pub-9900730300733887/6480325937',
            },
    };
