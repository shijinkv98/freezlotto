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
  }
