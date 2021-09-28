
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/main.dart';
import 'package:freezlotto/network/ApiCall.dart';
import 'package:freezlotto/network/response/register_response.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/register_screen.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenSecond extends StatefulWidget {
  String customerMobile = " ";
  @override
  _SplashScreenSecondState createState() => new _SplashScreenSecondState(customerMobile : this.customerMobile);
  SplashScreenSecond({this.customerMobile});
}
class _SplashScreenSecondState extends State<SplashScreenSecond> {
  String userPhone = "";
  String customerMobile = " ";
  String _phone = " ";
_SplashScreenSecondState({this.customerMobile});
  @override
  void initState() {
    getUserInfo();
    super.initState();
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
                          MaterialPageRoute(builder: (context) => HomeScreen(tabnumber: 0,)),
                        );

                      },
                      child:
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 46,
                        width: 266,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/rectangle_10.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Center(child: Text(customerMobile,style:TextStyle(fontSize: 15,color:white,fontWeight:FontWeight.w500,fontFamily: REGULAR_FONT,letterSpacing: 1.5),)),
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
  var phone = "";
void getUserInfo()async{
  phone = await Preferences.get(PrefKey.phone);

}

}
