import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezlotto/blocs/home_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/source_page.dart';
import 'package:freezlotto/screens/upload_advertisement.dart';
import 'package:freezlotto/screens/upload_successfull.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/media_source.dart';
import 'package:freezlotto/widget/video_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 20,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 20,letterSpacing: 0.8);

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File fileMedia;
  MediaSource source;

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).getHomeData(context);
    return getAppBar(context, "Upload Advertisement",getBody());
  }

    Widget getBody() {
      return Consumer<HomeBloc>(
          builder: (context, homeBloc, child) => ModalProgressHUD(
        inAsyncCall: homeBloc.isLoading,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: fileMedia == null
                      ? Icon(Icons.photo, size: 120)
                      : (source == MediaSource.image
                      ? Image.file(fileMedia)
                      : VideoWidget(fileMedia)),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => capture(MediaSource.image),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width/2.5,
                           decoration: iconGradient,
                            child: Center(child: Text('Select Image',style: style,)),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () => capture(MediaSource.video),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width/2.5,
                            decoration: iconGradient,
                            child: Center(child: Text('Select Video',style: style,)),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                       fileMedia == null ? Fluttertoast.showToast(
                           msg: "Please select atleast one file to upload",
                           toastLength: Toast.LENGTH_LONG,
                           gravity: ToastGravity.CENTER,
                           timeInSecForIosWeb: 2,
                           backgroundColor: Colors.red,
                           textColor: Colors.white,
                           fontSize: 16.0
                       ):
                          homeBloc.uploadAds(context, fileMedia, "free", "", 'category');


                        },

                      child: Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: iconGradient,
                        child: Center(child: Text('UPLOAD',style: style2,)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 40),

              ],
            ),
          ),
        ),
      ));
    }

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}
