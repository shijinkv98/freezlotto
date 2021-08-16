
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/main.dart';
import 'package:freezlotto/screens/login_screen.dart';

class SplashScreenSecond extends StatefulWidget {
  @override
  _SplashScreenSecondState createState() => new _SplashScreenSecondState();
}

class _SplashScreenSecondState extends State<SplashScreenSecond> {
  @override
  void initState() {
    super.initState();
    // new Future.delayed(
    //   const Duration(seconds: 3),
    //   () =>
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => LoginScreen()),
    //       )
    //       // ApiCall().getUserToken().then((token) => {
    //       //   if (token != null &&
    //       //       token.trim().isNotEmpty)
    //       //     {
    //       //       debugPrint("token: "+token),
    //       //       Navigator.of(context).pushReplacementNamed('/homenew')}
    //       //   else
    //       //     {Navigator.of(context).pushReplacementNamed('/login')}
    //       // }),
    //   // () => Navigator.push(
    //   //       context,
    //   //       MaterialPageRoute(builder: (context) => LoginScreen()),
    //   //     )
    // );
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
              Container(child: Center(
                child: Column(
                  children: [
                    Text('FREEZLOTTO',
                      style: TextStyle(fontSize:30,color: primaryTextColor,fontFamily: EXTRA_BOLD_FONT,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );

                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 46,
                        width: 266,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/rectangle_10.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Center(child: Text('9457845785',style:TextStyle(fontSize: 15,color:white,fontWeight:FontWeight.w500,fontFamily: REGULAR_FONT,letterSpacing: 1.5),)),
                      ),
                    )

                  ],
                ),

              ),
              ),


            ],
          )),
    );
  }
}
