import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/upload_advertisement.dart';
import 'package:freezlotto/screens/upload_page.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 20,letterSpacing: 0.8);
String _Link;
class SwitchToAdminScreen extends StatefulWidget{

  @override
  _SwitchToAdminScreenState createState() => new _SwitchToAdminScreenState();
  }
class _SwitchToAdminScreenState extends State<SwitchToAdminScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return getAppBar(context, " Switch to Admin App",getBody());
  }
  Widget getBody(){
    return SingleChildScrollView(
      child: Container(
        child: Center(child: getContentVideo()),
      ),
    );
}

  Widget getContentVideo(){
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30,top: 100,bottom: 20),
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/switchbg.png'),
            fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 32,left: 27,right: 27),
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/switchicon.png'),
                    fit: BoxFit.fill),
              ),
          ),
          InkWell(
            onTap: (){
              // nextPagePush(context, UploadAdvertisement());
              nextPagePush(context, UploadPage());
            },
            child: Container(
              margin: EdgeInsets.only(top: 34,left: 27,right: 27),
              width: MediaQuery.of(context).size.width,
              height: 57,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/switchdotted.png'),
                    fit: BoxFit.fill),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Free',style: style,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Icon(Icons.arrow_forward_ios,color: white,size: 15,),
                  )
                ],
              ),
            ),
          ) ,
          Container(
            margin: EdgeInsets.only(top: 13,left: 27,right: 27),
            width: MediaQuery.of(context).size.width,
            height: 57,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/switchdotted.png'),
                  fit: BoxFit.fill),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text('Paid',style: style,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Icon(Icons.arrow_forward_ios,color: white,size: 15,),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13,left: 27,right: 27,bottom: 45),
            width: MediaQuery.of(context).size.width,
            height: 57,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/switchdotted.png'),
                  fit: BoxFit.fill),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text('Discount Coupon',style: style,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Icon(Icons.arrow_forward_ios,color: white,size: 15,),
                ),

              ],
            ),
          ),

        ],
      ),

    );
  }


}
