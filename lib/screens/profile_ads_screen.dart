import 'package:chewie/chewie.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/profile_screen.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'package:like_button/like_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:video_player_360/video_player_360.dart';

final TextStyle style2 = TextStyle(color:textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize:14,letterSpacing: 0.8);
final TextStyle style3 = TextStyle(color:textColor,fontWeight: FontWeight.w800,fontFamily: MEDIUM_FONT,fontSize:18,letterSpacing: 0.8);

class ProfileAdsScreen extends StatefulWidget {

  @override
  _ProfileAdsScreenState createState() => new _ProfileAdsScreenState();
}

class _ProfileAdsScreenState extends State<ProfileAdsScreen> {
  var cus_id = "";
  String videoPath = " ";
  @override
  void initState() {
    Provider.of<GalleryBloc>(context, listen: false).getProfileAdsData(context);
    super.initState();
    getUserInfo();
    // Provider.of<GalleryBloc>(context, listen: false).getProfileAdsData(context);

  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
        body: Consumer<GalleryBloc>(
          builder: (context, galleryBloc, child) =>
              ModalProgressHUD(
                  inAsyncCall: galleryBloc.isLoading,
                  child: getContentAds(galleryBloc)),
        ));
  }

  Widget getContentAds(GalleryBloc galleryBloc){
    return getListAds(galleryBloc);
  }
  Widget getListAds(GalleryBloc galleryBloc) {
    return galleryBloc.advertisementList.length == 0
        ? Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            Text(
              'No item found',
              style: style3,
            ),
          ],
        ),
      ),
    )
        : Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          itemCount: galleryBloc.advertisementList.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            WebViewController _controller;

            // initializeVideoPlayer();
            // WebView.platform = SurfaceAndroidWebView();
            // videoPath = APIClient.Ad_Asset_Location + galleryBloc.advertisementList[index].advertisement;
            // videoPath= '${'https://freezelotto.alisonsdemo.online/videoplay/'}${galleryBloc.advertisementList[index].id}${'/'}${26}';
            return Column(
              children: [
                galleryBloc.advertisementList[index].fileType == "image"?
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top: 5),
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(31)),
                  ),
                  child: Card(
                    elevation: 5,
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31.0),
                    ),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(31)),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.fitHeight,
                        placeholder: 'assets/images/logo.png',
                        image:
                        '${APIClient.Ad_Asset_Location}${galleryBloc.advertisementList[index].advertisement}',
                      ),
                    ),
                  ),
                  height: 221,
                ):
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 5,
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31.0),
                    ),
                    child: Container(
                      height: 200,
                      // decoration: BoxDecoration(
                      //   color: Colors.grey,
                      //   borderRadius: BorderRadius.all(Radius.circular(15)),
                      // ),

                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(31.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: WebView(
                            javascriptMode: JavascriptMode.unrestricted,
                            onWebViewCreated:
                                (WebViewController webViewController) {
                              //_controller = webViewController;
                            },
                            initialUrl:'${'https://freezelotto.alisonsdemo.online/videoplay/'}${galleryBloc.advertisementList[index].id}${'/'}${cus_id}',
                          ),
                        ),
                      ),
                  ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 17,left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          return
                            showDialog(
                            context: context,
                            builder: (ctx) =>
                                AlertDialog(
                              backgroundColor: Colors.white,
                              content:  Builder(
                                builder: (context) {
                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  double height = MediaQuery.of(context).size.height/2;
                                  var width = MediaQuery.of(context).size.width;
                                  return Container(
                                    height: height,
                                    width: width - 60,
                                    child:
                                    galleryBloc.advertisementList[index].fileType == "image"?
                                    PhotoView(
                                      imageProvider: NetworkImage('${APIClient.Ad_Asset_Location}${galleryBloc.advertisementList[index].advertisement}'),
                                    )
                                    // FadeInImage.assetNetwork(
                                    //   fit: BoxFit.fitHeight,
                                    //   placeholder: 'assets/images/logo.png',
                                    //   image:
                                    //   '${APIClient.Ad_Asset_Location}${galleryBloc.advertisementList[index].advertisement}',
                                    // )
                                        :
                                    WebView(
                                      javascriptMode: JavascriptMode.unrestricted,
                                      onWebViewCreated:
                                          (WebViewController webViewController) {
                                        //_controller = webViewController;
                                      },
                                      initialUrl:'${'https://freezelotto.alisonsdemo.online/videoplay/'}${galleryBloc.advertisementList[index].id}${'/'}${cus_id}',
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(
                                    'assets/images/eye.png',
                                  ),width: 15,height: 14,color: profileiconColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Text(
                                    'View',
                                    style: style2,
                                  ),
                                )
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: (){
                          return
                            showDialog(
                            context: context,
                            builder: (ctx) =>
                                AlertDialog(
                              content:  Builder(
                                builder: (context) {
                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  double height = 150;
                                  var width = MediaQuery.of(context).size.width;
                                  return Container(
                                    height: height,
                                    width: width - 60,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Are you sure?",style: style3),
                                        SizedBox(height: 10),
                                        Text("You won't be able to revert this!",style: style2,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                galleryBloc.deleteAds(context, galleryBloc.advertisementList[index].id);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(right: 5,top: 15),
                                                decoration: iconGradient,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                  child: Text("Yes, Delete it",style: style,),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                Navigator.of(ctx).pop();                                  },
                                              child: Container(
                                                margin: EdgeInsets.only(left: 5,top: 15),
                                                decoration: redBox,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                  child: Text("Cancel",style: style,),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );



                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(
                                    'assets/images/close_circle.png',
                                  ),width: 15,height: 14,color: profileiconColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Text(
                                    'Cancel',
                                    style: style2,
                                  ),
                                )
                              ],
                            )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.1, 0.5, 0.9],
                              colors: [
                                Color(0xFF1FA2FF),
                                Color(0xFF12D8FA),
                                Color(0xFFA6FFE6),
                              ],
                            ),
                            color: white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 6),
                                child: Image(
                                  image: AssetImage(galleryBloc.advertisementList[index].status == '1' ?
                                      'assets/images/tick.png':'assets/images/close_round.png'
                                  ),width: 12,height: 14,color: white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:20,top: 4,bottom: 4),
                                child: Text(galleryBloc.advertisementList[index].status == '1'?
                                  'Active':'Inactive',
                                  style: style5,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
  void getUserInfo()async{
    cus_id = await Preferences.get(PrefKey.customerID);
  }

}

