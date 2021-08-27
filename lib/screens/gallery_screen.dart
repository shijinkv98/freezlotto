import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_video.dart';
import 'package:freezlotto/screens/upload_news_feeds.dart';

final TextStyle style = TextStyle(
    color: white,
    fontWeight: FontWeight.w700,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 18,
    letterSpacing: 0.8);
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getFullView(),
    );
  }

  Widget getFullView() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 108,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(
                image: AssetImage('assets/images/rectangle_10.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 27, right: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Account Money', style: style2),
                    Text('Rs. 25000', style: style)
                  ],
                ),
              ),
              Divider(height: 1, color: white),
              Padding(
                padding: const EdgeInsets.only(left: 27, right: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Account Prize', style: style2),
                    Container(
                       width: 135,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down_sharp,color: white,),
                        iconSize: 24,
                        elevation: 5,
                        // style: style,
                        isDense: true,
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Laptop', 'Television', 'Smartphone', 'WashinMachine','Furniture','Refrigerator','Sports Cycle','Air Conditioner']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        getMiddleContainer(),
        Container(
          height: 49,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 55, right: 55, top: 73),
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
    );
  }

  Widget getMiddleContainer() {
    double width = MediaQuery.of(context).size.width - 15;
    double height = 240;
    double aspect = (width / 2) / height;
    return Container(
      margin: EdgeInsets.only(left: 33, right: 33, top: 33),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 1.0,
              mainAxisSpacing: 9,
              crossAxisSpacing: 9),
          semanticChildCount: 3,
          itemCount: 9,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, index) {
            return _itemsBuilder();
          }),
    );
  }

  Widget _itemsBuilder() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: new DecorationImage(
            image: new AssetImage("assets/images/rectangle_18.png"),
            fit: BoxFit.fill,
          )),
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: new DecorationImage(
              image: new AssetImage("assets/images/rectangle_21.png"),
              fit: BoxFit.fill,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DISCOUNT',
              style: couponDis,
            ),
            Text(
              'COUPON',
              style: couponDis,
            ),
            Text(
              '30% OFF',
              style: redText,
            ),
          ],
        ),
      ),
    );
  }
}
