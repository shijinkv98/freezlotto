import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/coupon_page.dart';
import 'package:freezlotto/screens/home_screen_video.dart';
import 'package:freezlotto/screens/settings_screen.dart';
import 'package:freezlotto/screens/upload_news_feeds.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/widget/fl_Dropdown.dart';

final TextStyle style = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontFamily: SEMI_BOLD_FONT,
  fontSize: 18,
  letterSpacing: 0.8,
);
final TextStyle dropdown = TextStyle(
  color: dropdowntextColor,
  fontWeight: FontWeight.w400,
  fontFamily: SEMI_BOLD_FONT,
  fontSize: 14,
  letterSpacing: 0.8,
);
final TextStyle couponDis = TextStyle(
    color: white,
    fontWeight: FontWeight.w800,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);
final TextStyle redText = TextStyle(
  color: red,
  fontWeight: FontWeight.w600,
  fontFamily: SEMI_BOLD_FONT,
  fontSize: 18,
  letterSpacing: 0.8,
  shadows: [
    Shadow(
      color: Colors.white,
      offset: Offset(_xOffset, _yOffset),
      blurRadius: _blurRadius,
    ),
  ],
);
final TextStyle style2 = TextStyle(
    color: white,
    fontWeight: FontWeight.w400,
    fontFamily: MEDIUM_FONT,
    fontSize: 18,
    letterSpacing: 0.8);
final TextStyle style3 = TextStyle(
    color: white,
    fontWeight: FontWeight.w600,
    fontFamily: MEDIUM_FONT,
    fontSize: 16,
    letterSpacing: 0.8);
var _opacity = 1.0;
var _xOffset = 0.0;
var _yOffset = 1.6;
var _blurRadius = 0.10;

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => new _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String dropdownValue = 'Laptop';
  String _dropList;

  @override
  void initState() {
    Provider.of<GalleryBloc>(context, listen: false).getGalleryData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext mainContext) {

    return Scaffold(
      floatingActionButton: Container(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          onPressed: () {
            nextPagePush(context, SettingsScreen());
            },
          child: Container(
            height: 72,
            width: 72,
            decoration: bggradient,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                      color: flottingTextColor,
                      fontFamily: MEDIUM_FONT,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/settings_white.png',
                    width: 21,
                    height: 21,
                  ),
                ),
              ],
            ),
          ),
          mini: false,
          // backgroundColor: ,
        ),
      ),
      body: getFullView(),
    );
  }

  Widget getFullView() {
    return  Consumer<GalleryBloc>(
      builder: (context, galleryBloc, child) => ModalProgressHUD(
        inAsyncCall: galleryBloc.isLoading,
        child:SingleChildScrollView(
      child:
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_10.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 27, right: 27, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text('Account Money', style: style2)),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text('${'Rs.'}${galleryBloc.accountMoney}', style: style))
                      ],
                    ),
                  ),
                  Divider(height: 1, color: white),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 27, right: 27, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text('Account Prize', style: style2)),
                        SizedBox(
                          width:20,
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 30),
                          width: MediaQuery.of(context).size.width/3.5,
                          child: Theme(
                            data: new ThemeData(
                              canvasColor: Colors.white,
                              primaryColor: Colors.black,
                              accentColor: Colors.white,
                            ),
                            child:FLDropdown(
                              items: galleryBloc.prizeList
                                  .map((e) => e.priceName)
                                  .toList(),
                              hintText:'Select',
                              selectedValue: _dropList != null
                                  ? galleryBloc.prizeList
                                  .where((e) =>e.id == galleryBloc.prizeList[0].id).first.priceName
                                  : null,
                              onChanged: (selected) {
                                _dropList = galleryBloc.prizeList.where((e)=>e.priceName == selected).first.id;
                              },
                            ),

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            getMiddleContainer(galleryBloc),
            Container(
              height: 49,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 55, right: 55, top: 50, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_10.png'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: Text(
                "ACTIVITY LOG",
                style: style3,
              )),
            )
          ],
        ),
        ),
      ),
    );
  }

  Widget getMiddleContainer(GalleryBloc galleryBloc) {
    double width = MediaQuery.of(context).size.width - 15;
    double height = 240;
    double aspect = (width / 2) / height;
    return Container(
      margin: EdgeInsets.only(left: 33, right: 33, top: 33),
      child:
      GridView.builder(
          itemCount: galleryBloc.coupens.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 110,
              childAspectRatio: 0.8,
              mainAxisSpacing: 9,
              crossAxisSpacing: 9),
          semanticChildCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return   InkWell(
              onTap: (){
                nextPagePush(context, CouponScreen());
              },
              child: Container(
                margin: EdgeInsets.all(0.3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:FadeInImage.assetNetwork(
                  fit: BoxFit.fitHeight,
                  placeholder: 'assets/images/logo.png',
                  image:
                  '${APIClient.Coupon_Asset_Location}${galleryBloc.coupens[index].coupenImage}',
                ),
              ),
            );
          }),
    );
  }

}
