// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:freezlotto/blocs/home_bloc.dart';

import 'notifier/loginnotifier.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    this.initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers:[
        ChangeNotifierProvider(create: (_) => HomeBloc()),
        ChangeNotifierProvider(create: (_) => NewsFeedBloc()),
        ChangeNotifierProvider(create: (_) => GalleryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home:SplashScreen(),
      ),


    );


  }


  Future<void> initDynamicLinks() async {
    print('Dynamic_Link_Open_1');
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;
          print('Dynamic_Link_Open_2');
          if (deepLink != null) {
            // ignore: unawaited_futures
            Navigator.pushNamed(context, deepLink.path);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      // izzgnore: unawaited_futures
      Navigator.pushNamed(context, deepLink.path);
    }
  }


}
