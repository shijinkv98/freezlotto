import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/home_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: HeadTextColor,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 26,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 16,letterSpacing: 0.8);
final TextStyle style3 = TextStyle(color: white,fontWeight: FontWeight.w500,fontFamily: SEMI_BOLD_FONT,fontSize: 16,letterSpacing: 0.8);
final TextStyle style4 = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 21,letterSpacing: 0.8);
final TextStyle style6 = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 18,letterSpacing: 0.8);
final TextStyle style5 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle dropdown = TextStyle(color: dropdowntextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
String _TransID;
class PaymentDetailsScreen extends StatefulWidget{


  @override
  _PaymentDetailsScreenState createState() => new _PaymentDetailsScreenState();

  }
class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  // File advertisement;

  final GlobalKey<FormState> _transIdKey = GlobalKey();

  _PaymentDetailsScreenState();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).getHomeData(context);
    return getAppBar(context, " Switch to Admin App",getBody());
  }
  Widget getBody(){
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height-120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => ModalProgressHUD(
          inAsyncCall: homeBloc.isLoading,
                child: getContent(homeBloc))),

          ],
        ),
      ),
    );
}

  Widget getContent(HomeBloc homeBloc){
    return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 30,right: 30,top: 120),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-240,
          color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Lets go through payment',style: style,),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(homeBloc.conten1,style: style2,),
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
                        child: Text('${'PAY RS.'}${homeBloc.paid_amount}',style: style4,),

                      ),
                      Divider(color: white,height: 1,),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 20,left: 10,right: 10),
                        child: Text(homeBloc.conten2,style: style6,textAlign: TextAlign.center,),
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
                child: getTransIdField(),
              ),
              InkWell(
                onTap: (){
                  if (_transIdKey.currentState.validate()) {
                    _transIdKey.currentState.save();
                    if(_validateFields()) {
                      homeBloc.submitTransaction(context, homeBloc.advertisment_id, _TransID);
                      // nextPagePushReplacement(context, UploadSuccess());
                    }
                  }
                },
                child: Container(
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
              ),
              Center(child:  Text(homeBloc.conten3,style: style2,textAlign: TextAlign.center,) ,),
              SizedBox(height: 20,)
            ],
          ),
        ),
    );
  }

  Widget getTransIdField(){
    return Form(
        key: _transIdKey,
        child:  TextFormField(
      obscureText: false,
      onSaved: (value) {
        _TransID = value;
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
        hintStyle: style5,
        border: InputBorder.none,
        enabled: true,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    ));
  }

  // void submitTapped(HomeBloc homeBloc) {
  //   if (_transIdKey.currentState.validate()) {
  //     _transIdKey.currentState.save();
  //     if(_validateFields()) {
  //       homeBloc.submitTransaction(context, homeBloc.advertisment_id, _TransID);
  //       // nextPagePushReplacement(context, UploadSuccess());
  //     }
  //     }
  //
  //
  // }

}
  bool _validateFields() {
    return true;
  }
