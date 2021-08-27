import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_red.dart';
import 'package:freezlotto/screens/newsfeed_screen.dart';

import 'gallery_screen.dart';
import 'home_page_screen.dart';
import 'home_screen_video.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);

class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() => new _HomeScreenState();
  }
class _HomeScreenState extends State<HomeScreen>{

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return getTabController(context,getHOMEpage(),0);
  }
  Widget getHOMEpage() {
    return TabBarView(
      children: [
        HomePageScreen(),
        NewsFeedScreen(),
        GalleryScreen(),
      ],
    );

  }

  Widget homePage(){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreenVideo()),
        );

      },
      child:
      Container(
         height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:Stack(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height-263,width: MediaQuery.of(context).size.width,
                      child: Center(child: Image.asset('assets/images/bg.png',fit: BoxFit.fill,)),),
                    Container(margin:EdgeInsets.only(bottom:50,top: 40),height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Align(
                              alignment:Alignment.topCenter,
                              child: Image.asset('assets/images/bg_dummy.png',fit: BoxFit.fill,)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child:Container(
                              width: 72,
                              height: 72,
                              margin: EdgeInsets.only(right: 45,bottom: 40),
                              child: FloatingActionButton(
                                onPressed: () {},
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('8',style: TextStyle(color:flottingTextColor,fontFamily: MEDIUM_FONT,fontWeight: FontWeight.w400,fontSize: 22),),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Image.asset('assets/images/Vector.png',width: 37,height: 25,),
                                    ),
                                  ],
                                ),
                                mini: false,
                                backgroundColor: flottingButtonColor,

                              ),
                            ) ,
                          )
                        ],
                      ),),


                  ], //<Widget>[]
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 73,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight:Radius.circular(16) ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/rectangle_33.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(child: Text('GIFT BOARD',style: style,)),
              ),
            )
          ],
        ),
      ),
    );
  }

}