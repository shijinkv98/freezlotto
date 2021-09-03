import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: BoldTextColor2,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 19,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
String _Link;
class UploadAdvertisement extends StatefulWidget{

  @override
  _UploadAdvertisementState createState() => new _UploadAdvertisementState();
  }
class _UploadAdvertisementState extends State<UploadAdvertisement> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return getAppBar(context, " Switch to Admin App",getBody());
  }
  Widget getBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: getContentVideo(),
        ),
      ],
    );
}

  Widget getContentVideo(){
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30),
      width: MediaQuery.of(context).size.width,
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 32,left: 70,right: 70),
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/switchupload.png'),
                    fit: BoxFit.fill),
              ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15,left: 30,right: 30),
            width: MediaQuery.of(context).size.width,
            height: 105,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/uploadbg.png'),
                  fit: BoxFit.fill),
            ),
            child:Image.asset('assets/images/upload.png',width: 39,height: 48,)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 19),
            child: Text('Upload Advertisement',style: style,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:17 ),
            child: Text('Browse and choose the files you want to upload',style: style2,textAlign: TextAlign.center,),
          ),
          getBottomContainer()
        ],
      ),
    );
  }
  Widget getBottomContainer(){
    return Container(
      margin: EdgeInsets.only(left:30,right: 30 ),
      child: Container(
        child:
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 3,
                  height: 65,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rectangle_10.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15,top: 20),
                    width:MediaQuery.of(context).size.width-108,
                    child: Text('For complaints and other matters contact us through watsapp +91 8089883455 ',

                      style: style2,
                    ))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 3,
                  height: 35,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rectangle_10.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15,top: 20),
                    width:MediaQuery.of(context).size.width-78,
                    child: Text(' If the ad is canceled, the full amount will be refunded within 24 hours. Cannot be canceled after 10 pm. ',
                      style: style2,))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 3,
                  height: 35,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rectangle_10.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15,top: 20),
                    width:MediaQuery.of(context).size.width-78,
                    child: Text('Contact us via watsapp to advertise as a discount coupon +91 8089883455',
                      style: style2,))
              ],
            ),
          ],
        ),
      ),
    );
  }

}
