
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/network/response/newsfeed_upload_response.dart';
import 'package:freezlotto/screens/gallery_screen.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/utils/alert_utils.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:provider/provider.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color:textColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style3 = TextStyle(color:textColor,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 19,letterSpacing: 0.8);

class UploadNewsFeeds extends StatefulWidget{

  @override
  _UploadNewsFeedsState createState() => new _UploadNewsFeedsState();
  }
class _UploadNewsFeedsState extends State<UploadNewsFeeds> {
  final GlobalKey<FormState> _linkKey = GlobalKey();
  bool isLoading = false;
  String _Link;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return getTabController(getHOMEpage(), 1,3,MediaQuery.of(context).padding.top,MediaQuery.of(context).size.width);
  }

  Widget getHOMEpage() {
    return WillPopScope(
      onWillPop: () {
        nextPagePush(context, HomeScreen(tabnumber: 1));
      },
      // async =>
      //     showDialog(
      //     context: context,
      //     builder: (context) =>
      //         AlertDialog(title: Text('Are you sure you want to quit?'), actions: <Widget>[
      //           RaisedButton(
      //               child: Text('OK'),
      //               onPressed: () => Navigator.of(context).pop(true)),
      //           RaisedButton(
      //               child: Text('CANCEL'),
      //               onPressed: () => Navigator.of(context).pop(false)),
      //         ])
      // ),
      child: TabBarView(
        children: [
          HomePageScreen(),
          getMiddleContainer(),
          GalleryScreen(),
        ],
      ),
    );
  }
  Widget getLinkForm() {
    return Form(
      key: _linkKey,
      child: TextFormField(
        obscureText: false,
        onSaved: (value) {
          _Link = value;
        },
        style: style2,
        validator: (value) {
          if (value.trim().isEmpty) {
            return 'This field is required';

          } else {
            return null;
          }
        },
        maxLines: 2,
        minLines: 1,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          hintText: "Youtube link Paste here",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget getMiddleContainer() {
    return SingleChildScrollView(
        child: Consumer<NewsFeedBloc>(
          builder: (context, newsfeedBloc, child) =>
              Container(
                // height: MediaQuery.of(context).size.height-100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Image.asset(
                            'assets/images/switchupload.png', width: 216,
                            height: 216,),
                          Text('Upload Newsfeed Youtube video', style: style3,),
                          Container(
                            margin: EdgeInsets.only(
                                left: 30, right: 30, top: 19),
                            height: 46,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/rectangle_3.png'),
                                  fit: BoxFit.cover),
                            ),
                            child: getLinkForm(),
                          ),
                          InkWell(
                            onTap: () {
                              uploadButtonTapped(context,newsfeedBloc);
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 43,
                              margin: EdgeInsets.only(
                                  left: 74, right: 74, top: 24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/rectangle_10.png'),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(child: Text(
                                'SUBMIT', style: style,)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    getTermsBox('assets/images/thumb.png', rules_one),
                    getTermsBox('assets/images/notess.png', rules_two),
                    getTermsBox('assets/images/close_round.png', rules_two),
                    SizedBox(height: 24)


                  ],
                ),
              ),
        )

    );
  }

  bool _validateFields() {
    return true;
  }
  Widget getTermsBox(String image,String content){
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 67,
      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFB1B1B1),
        image: DecorationImage(
            image: AssetImage('assets/images/dotted.png',),
            fit: BoxFit.fill),
      ),
      child: Center(
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width - 61.5,
            height: 65.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: white,

            ),
            child:
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 26),
                    width: 30, height: 30, child: Image.asset(
                  image, color: iconColor,
                  fit: BoxFit.fill,)),
                Container(
                    margin: EdgeInsets.only(left: 14),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 140, child: Text(
                  content,
                  style: style2,)),
              ],
            )),
      ),
    );
  }

  uploadButtonTapped(BuildContext context,NewsFeedBloc newsFeedBloc) {
    if (_linkKey.currentState.validate()) {
      _linkKey.currentState.save();

      if (_validateFields()) {
        newsFeedBloc.uploadLink(context, _Link);
      }
    }
  }
}