import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';

String _Name,_Phone,_Reference,_Code;
final TextStyle style = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.normal,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 12,letterSpacing: 0.8);

class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => new _LoginScreenState();
  }
class _LoginScreenState extends State<LoginScreen>{

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      body:
      getFullView(),

    );
  }

  Widget getFullView() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTopContainer(),
            getMiddleContainer(),
            getBottomContainer(),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }

  Widget getTopContainer(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top:72),
        height:172,
        width: 172,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_icon.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
  Widget getMiddleContainer(){
    return Container(
      margin: EdgeInsets.only(left:30 ,top: 20,right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lets get started',style: TextStyle(color: HeadTextColor,fontWeight: FontWeight.w600,fontFamily: FONT_BOLD,fontSize: 20),),
          Text('Create an account to better manage people in your team.',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 16,letterSpacing: 0.8)),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('Name',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8)),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),
            child: nameField,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Mobile number',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8)),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:35,child: countryCodeField),
                SizedBox(height:25,width: 1,child: VerticalDivider(width: 1,color:Colors.black.withOpacity(0.3))),
                SizedBox(width:MediaQuery.of(context).size.width-100,
                    child: phoneField),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Reference number',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8)),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:35,child: countryCodeField),
                SizedBox(height:25,width: 1,child: VerticalDivider(width: 1,color:Colors.black.withOpacity(0.3))),
                SizedBox(width:MediaQuery.of(context).size.width-132,
                    child: referenceField),
                SizedBox(
                  width: 36,
                  height: 46,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(height: 35,width: 35,
                          child: Center(child: Image.asset('assets/images/gradient_circle.png',fit: BoxFit.fill,)),),
                        SizedBox(height: 35,width: 35,
                          child: Center(child: Image.asset('assets/images/i_icon.png',fit: BoxFit.fill,)),),


                      ], //<Widget>[]
                    ), //Stack
                  ), //Center
                ),
              ],
            ),
          ),
          Container(
            height: 43,
            margin: EdgeInsets.only(left: 45,right:45,top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_10.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(child: Text('SUBMIT',style:TextStyle(fontSize: 15,color:white,fontWeight:FontWeight.w500,fontFamily: REGULAR_FONT,letterSpacing: 1.5),)),
          )
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
                    width:MediaQuery.of(context).size.width-78,
                    child: Text('Referral code is given to the person who has referred the prize money winner - 10%  of the winning amount can be claimed using the referral code which can  be input by editing the required details.',
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
                    child: Text('The referral code can be applied only once - system to validate. ',
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
                    child: Text('The referral code in case not applicable can be skipped by inputting the required name and verified registered number.',
                      style: style2,))
              ],
            ),
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
    style: style,
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
      hintText: "Sarath V",
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
  ); 
  final phoneField = TextFormField(
    obscureText: false,
    onSaved: (value) {
      _Phone = value;
    },
    style: style,
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
    maxLines: 1,
    minLines: 1,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      hintText: "987456321",
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      
    ),
  );
  final countryCodeField = TextFormField(
    obscureText: false,
    onSaved: (value) {
      _Code = value;
    },
    style: style,
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
    maxLines: 1,
    minLines: 1,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      hintText: "91",
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,

    ),
  );
  final referenceField = TextFormField(
    obscureText: false,
    onSaved: (value) {
      _Reference = value;
    },
    style: style,
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
    maxLines: 1,
    minLines: 1,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      hintText: "987456321",
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      // suffixIcon: Image.asset('assets/images/gradient_circle')
    ),
  );


}