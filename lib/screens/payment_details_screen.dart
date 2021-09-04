import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: HeadTextColor,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 26,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 16,letterSpacing: 0.8);
final TextStyle style3 = TextStyle(color: white,fontWeight: FontWeight.w500,fontFamily: SEMI_BOLD_FONT,fontSize: 16,letterSpacing: 0.8);
final TextStyle style4 = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 21,letterSpacing: 0.8);
final TextStyle style6 = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 18,letterSpacing: 0.8);
final TextStyle style5 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle dropdown = TextStyle(color: dropdowntextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
String _Name;
class PaymentDetailsScreen extends StatefulWidget{

  @override
  _PaymentDetailsScreenState createState() => new _PaymentDetailsScreenState();
  }
class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {

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
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 30,right: 30,top: 120),
        width: MediaQuery.of(context).size.width,
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Lets go through payment',style: style,),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ',style: style2,),
            ),
            Container(
                margin: EdgeInsets.only(top: 60,left: 7,right: 7),

                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/submitbg.png'),
                      fit: BoxFit.cover),
                ),
                child:Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15,top: 25),
                      child: Text('PAY RS.25000',style: style4,),
                    ),
                    Divider(color: white,height: 1,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 20),
                      child: Text('Pay money via GPAY, PHONEPE, PAYTM to 6238000694',style: style6,textAlign: TextAlign.center,),
                    )
                  ],
                ))
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26,bottom: 6),
              child: Text('Transaction ID',style: style5,),
            ),
            Container(
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_3.png'),
                    fit: BoxFit.cover),
              ),
              child: nameField,
            ),
            Container(
              margin: EdgeInsets.only(top: 50,left: 44,right: 44,bottom: 26),
              height: 43,
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/submitbg.png'),
                      fit: BoxFit.cover),
                ),
              child:Center(child: Text('SUBMIT',style: style3,))
            ),
            Center(child:  Text('We will check your status.. you can check your status in your profile, kindly wait.',style: style2,textAlign: TextAlign.center,) ,),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
  final nameField = TextFormField(
    obscureText: false,
    onSaved: (value) {
      _Name = value;
    },
    style: style5,
    validator: (value) {
      if (value.trim().isEmpty) {
        return 'This field is required';
        // } else if (!RegExp(
        //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        //     .hasMatch(value)) {
        //   return 'Invalid email';
      } else {
        return null;
      }
    },
    maxLines:2,
    minLines: 1,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,

    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      hintText: "ID 4578996",
      border: InputBorder.none,
      enabled: false,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
  );
}
