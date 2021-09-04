import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/payment_details_screen.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: HeadTextColor,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 26,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 16,letterSpacing: 0.8);
final TextStyle style3 = TextStyle(color: white,fontWeight: FontWeight.w500,fontFamily: SEMI_BOLD_FONT,fontSize: 16,letterSpacing: 0.8);
final TextStyle style4 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style5 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle dropdown = TextStyle(color: dropdowntextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
String _Name;
class PaymentScreen extends StatefulWidget{

  @override
  _PaymentScreenState createState() => new _PaymentScreenState();
  }
class _PaymentScreenState extends State<PaymentScreen> {
  String dropdownValue = 'Choose one';
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
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(top: 44,bottom: 6),
            child: Text('Duration',style: style5,),
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
          Padding(
            padding: const EdgeInsets.only(top: 28,bottom: 6),
            child: Text('Category',style: style5,),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: getDropDown(),
            ),
          ),
         InkWell(
            onTap:(){
              nextPagePush(context, PaymentDetailsScreen());
            },
            child: Container(
              margin: EdgeInsets.only(top: 50,left: 44,right: 44,bottom: 64),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getBubble(),
              Container(
                margin: EdgeInsets.only(left: 9,bottom: 15),
                  width:MediaQuery.of(context).size.width-77,
                  child: Text('Premium will cost Rs. 1000 and it will show 7 days, in daily 1 time',style: style2,textAlign: TextAlign.justify,)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getBubble(),
              Container(
                  margin: EdgeInsets.only(left: 9),
                  width:MediaQuery.of(context).size.width-77,
                  child: Text('Non Premium will cost Rs. 500 and will play 1 time for a day',style: style2,textAlign: TextAlign.justify,)),
            ],
          ),
          SizedBox(height: 20,),
        ],
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
      hintText: "30 Seconds",
      border: InputBorder.none,
      enabled: false,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
  );
  Widget getDropDown(){
    return DropdownButton<String>(
      // value: dropdownValue,
      // style: style,

      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.grey,
      ),
      iconSize: 24,
      elevation: 0,
      style: dropdown,
      dropdownColor: white,
      isExpanded: true,
      hint: Text(
        dropdownValue,
        style: style5,
        textAlign: TextAlign.justify,
      ),
      // style: style,
      isDense: false,
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Choose one',
        'Premium',
        'Non Premium',

      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value),
              Divider(color:dropdowndividerColor,height: 1,)
            ],
          ),
        );
      }).toList(),
    );
  }
}
