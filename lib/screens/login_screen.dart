import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/api_params.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/network/ApiCall.dart';
import 'package:freezlotto/network/response/loginresponse.dart';
import 'package:freezlotto/notifier/loginnotifier.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:provider/provider.dart';

String _Name,_Phone,_Reference,_Code;
final TextStyle style = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.normal,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 12,letterSpacing: 0.8);

class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => new _LoginScreenState();
  }
class _LoginScreenState extends State<LoginScreen>{

  final GlobalKey<FormState> _userNameKey = GlobalKey();
  final GlobalKey<FormState> _usermobileKey = GlobalKey();

  LoginUpdateNotifier _updateNotifier;
  @override
  void initState() {
    _updateNotifier =
        Provider.of<LoginUpdateNotifier>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    _updateNotifier.reset();
    super.dispose();
  }


  // @override
  // void initState(){
  //   super.initState();
  // }


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
            child: getNameField(),
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
                    child: getphoneFiled()),
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
                    child: getReferenceField()),
                SizedBox(
                  width: 36,
                  height: 46,
                  child: Center(
                    child:
                    Stack(
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
          InkWell(
            onTap: (){
              // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),
              //           );
              if (_userNameKey.currentState.validate()&&_usermobileKey.currentState.validate()){
                _userNameKey.currentState.save();
                _usermobileKey.currentState.save();
                
                // print(_Reference);
                
                login(_Name,_Phone,_Reference);
              }
            },
            child: Container(
              height: 43,
              margin: EdgeInsets.only(left: 45,right:45,top: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_10.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('SUBMIT',style:TextStyle(fontSize: 15,color:white,fontWeight:FontWeight.w500,fontFamily: REGULAR_FONT,letterSpacing: 1.5),)),
            ),
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

  Widget getNameField(){
    return Form(
        key: _userNameKey,
        child: TextFormField(
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
        )
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


  Widget getphoneFiled(){

    return Form(

      key: _usermobileKey,
      child:  TextFormField(
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
      ),

    );

  }

  Widget getReferenceField(){

    return Form(
        child: TextFormField(
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
        )
    );

  }

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


  Future<void> login(String username,String mobile,String refnumber)
  async {
    _updateNotifier.isProgressShown = true;
   Map body = {
     USER_NAME : username,
     USER_PHONE : mobile,
     REF_NUM : refnumber ?? ''
   };
    ApiCall()
        .execute<LoginResponse, Null>(LOGIN_URL, body).then((LoginResponse result) {
      _updateNotifier.isProgressShown = false;
      // if(result.success==null)
      // {
      //   if(result.error!=null)
      //     ApiCall().showToast(result.error);
      // }
      ApiCall().showToast(result.message!=null?result.message:"");
      if(result.success=="1")
      {
        print(result);
         ApiCall().saveUserToken(result.customerId.toString());
         ApiCall().saveLoginResponse(result.toJson().toString());
         ApiCall().saveUserMobile(result.customerMobile);
        nextPagePush(context, HomeScreen());
      }

    });

  }


}