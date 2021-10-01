import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:freezlotto/blocs/home_bloc.dart';



void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => new SplashScreen(),
          // Default home route
          '/helloworld': (BuildContext context) =>
          new HomeScreen(tabnumber: 1,),
          // home:SplashScreen(),
        }
      ),
    );
  }
}


