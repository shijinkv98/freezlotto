import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/network/response/register_response.dart';
import 'package:freezlotto/screens/splash_screen_second.dart';
import 'package:freezlotto/utils/alert_utils.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


final TextStyle style = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.normal,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 12,letterSpacing: 0.8);
String _Name,_Phone,_Reference,_Code;

class RegisterScreen extends StatefulWidget{

  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
  }
class _RegisterScreenState extends State<RegisterScreen>{
  DateTime currentBackPressTime;
  final GlobalKey<FormState> _userNameKey = GlobalKey();
  final GlobalKey<FormState> _usermobileKey = GlobalKey();
  final GlobalKey<FormState> _userReferenceKey = GlobalKey();
  bool _isLoading = false;
  RegisterResponse _signupData = new RegisterResponse();
  String customerMobile="";
  String customerId="";
  String success="";
  @override
  void initState() {
    // _updateNotifier =
    //     Provider.of<LoginUpdateNotifier>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    // _updateNotifier.reset();
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
      WillPopScope(
          onWillPop: onWillPop,
          child: getFullView()),

    );
  }
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press Back Button again to exit');
      return Future.value(false);
    }
    return Future.value(true);
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
                    child: getphoneField()),
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
              // if (_userNameKey.currentState.validate()&&_usermobileKey.currentState.validate()){
              //   _userNameKey.currentState.save();
              //   _usermobileKey.currentState.save();
              //   _userReferenceKey.currentState.save();

                // print(_Reference);
                _signupTapped();
                // login(_Name,_Phone,_Reference);
              // }
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
            hintText: "Enter your Name",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        )
    );
  }


  Widget getphoneField(){

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
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          hintText: "Enter your Mobile number",
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
      key: _userReferenceKey,
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
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            hintText: "Enter your Reference number",
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

  _signupTapped() {
    if (_userNameKey.currentState.validate() &&
        _usermobileKey.currentState.validate()) {
      _userNameKey.currentState.save();
      _usermobileKey.currentState.save();
      _userReferenceKey.currentState.save();

      if(_validateFields()){
        AppUtils.isConnectedToInternet(context).then((isConnected) {
          if (isConnected) {
            setState(() => _isLoading = true);
            APIService().signUpUser(_Name,_Phone,_Reference,'91','91').then((response) {
              setState(() => _isLoading = false);
              if (response.statusCode == 200) {
                RegisterResponse _signupResponse = RegisterResponse.fromJson(response.data);
                customerMobile = _signupResponse.customerMobile;
                customerId =_signupResponse.customerId;
                // nextPagePushReplacement(context, SplashScreenSecond());
                Preferences.save(PrefKey.phone, customerMobile);
                Preferences.save(PrefKey.customerID, customerId);
                if (_signupResponse.success == "1") {

                  AlertUtils.showToast("Registration Successfull", context);
                  nextPagePushReplacement(context, SplashScreenSecond(customerMobile: customerMobile));
                   } else {
                  AlertUtils.showToast(_signupResponse.message, context);
                }
              } else {
                AlertUtils.showToast("Registration Failed", context);
              }

            });
          }
        });

      }
    }
  }
  bool _validateFields() {
    return true;
  }


}