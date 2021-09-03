import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';

import 'newsfeed_screen.dart';


final TextStyle couponDis = TextStyle(
    color: white,
    fontWeight: FontWeight.w800,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 30,
    letterSpacing: 0.8);
final TextStyle redText = TextStyle(
  color: red,
  fontWeight: FontWeight.w600,
  fontFamily: SEMI_BOLD_FONT,
  fontSize: 40,
  letterSpacing: 0.8,
  shadows: [
    Shadow(
      color: Colors.white,
      offset: Offset(_xOffset, _yOffset),
      blurRadius: _blurRadius,
    ),
  ],
);
var _xOffset = 0.0;
var _yOffset = 1.6;
var _blurRadius = 0.10;
class CouponScreen extends StatefulWidget{

  @override
  _CouponScreenState createState() => new _CouponScreenState();
  }
class _CouponScreenState extends State<CouponScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/images/close.png',height: 17,width: 17,),
            ),
          ),
        ],
      ),
      body:getBody() ,
      backgroundColor: white,
    );
  }
  Widget getBody(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
             getContent()
        ],

    );
}
  Widget getContent(){
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2.5,
      decoration: couponOuter,
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: couponInnerWhite,
        child: Container(
          margin: EdgeInsets.all(1),
          decoration: couponInner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DISCOUNT',
                style: couponDis,
              ),
              Text(
                'COUPON',
                style: couponDis,
              ),
              Text(
                '30% OFF',
                style: redText,
              ),
            ],
          ),
        ),
      ),
    );

  }
}