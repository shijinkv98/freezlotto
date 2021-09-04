import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/payment_details_screen.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: BoldTextColor2,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 19,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 14,letterSpacing: 0.8);
class AboutUscreen extends StatefulWidget{

  @override
  _AboutUscreenState createState() => new _AboutUscreenState();
  }
class _AboutUscreenState extends State<AboutUscreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return getAppBar(context, "About us",getBody());
  }
  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getContent(),
        ],
      ),
    );
}

  Widget getContent(){
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30,top: 34),
      width: MediaQuery.of(context).size.width,
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('About us',style: style,),
          Container(
              margin: EdgeInsets.only(top: 18,bottom: 19),
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage('assets/images/aboutbg.png'),
                    fit: BoxFit.fill),
              ),

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Text(aboutdescription_one,style: style2,),
          ),
          Center(
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              height: 169,
              width: 169,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(aboutdescription_two,style: style2,),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }


}
