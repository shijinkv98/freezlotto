
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/main.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/register_screen.dart';
import 'package:freezlotto/screens/splash_screen_second.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String stringValue;
  @override
  void initState() {
    super.initState();
    getStringValuesSF();
    new Future.delayed(
        const Duration(seconds: 2),(){
          Preferences.get(PrefKey.phone).then((userPhone) {
            if(userPhone == null){
              nextPagePushReplacement(context, RegisterScreen());
            }
            else{
              nextPagePushReplacement(context, SplashScreenSecond());
            }
          });
    }

        // () =>{
        //   if(stringValue == null)
        //     {
        //       nextPagePushReplacement(context, SplashScreenSecond())
        //     }
        //   else{
        //     nextPagePushReplacement(context, RegisterScreen())
        //   }
        // });
        //     () => Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SplashScreenSecond()),
        // )
      // ApiCall().getUserToken().then((token) => {
      //   if (token != null &&
      //       token.trim().isNotEmpty)
      //     {
      //       debugPrint("token: "+token),
      //       Navigator.of(context).pushReplacementNamed('/homenew')}
      //   else
      //     {Navigator.of(context).pushReplacementNamed('/login')}
      // }),
      // () => Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => LoginScreen()),
      //     )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // use Scaffold also in order to provide material app widgets
      body:
      Container(
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
              Container(child: Padding(
                padding: const EdgeInsets.only(left: 33,right: 33,top: 20),
                child: Text('WATCH YOUR ADS, SCRATCH YOUR BOARD, WIN A PRIZE',
                  style: TextStyle(fontSize:20,color: primaryTextColor,fontFamily: REGULAR_FONT,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,
                ),
              ),)
            ],
          )),
    );
  }
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    stringValue = prefs.getString(PrefKey.phone.toString());
    return stringValue;
  }
}
