import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/screens/home_screen.dart';

class DynamicLinkService {
  Future<Uri> createDynamicLink(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://freezlotto.page.link',

      link: Uri.parse('https://freezlotto.page.link/?newsfeed/?id=$id'),
      androidParameters: AndroidParameters(
        packageName: 'com.freezlotto.application',
        minimumVersion: 1,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.freezlotto.application',
        minimumVersion: '1',
        appStoreId: '123456789',
      ),
    );
    var dynamicUrl = await parameters.buildUrl();

    return dynamicUrl;
  }
  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('id')) {
          String id = deepLink.queryParameters['id'];
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(tabnumber: 0)));
        }
      }

      FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(tabnumber: 1)));
      });

    } catch (e) {
      print(e.toString());
    }
  }
}