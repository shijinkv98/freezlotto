import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';

import 'gallery_screen.dart';
import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color:textColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);

class HomeScreenVideo extends StatefulWidget{

  @override
  _HomeScreenVideoState createState() => new _HomeScreenVideoState();
  }
class _HomeScreenVideoState extends State<HomeScreenVideo>{

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
        getMiddleContainer(),
        NewsFeedScreen(),
        GalleryScreen(),
      ],
    );

  }

  Widget getMiddleContainer(){
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:  SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child:
                      Stack(
                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.only(left:30,right:30,top: 50),
                            width: MediaQuery.of(context).size.width,
                            height: 221,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(23))),
                            child: Image.asset('assets/images/probg.png',fit: BoxFit.fill,),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(margin:EdgeInsets.only(right: 0),height: 45,width:45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.all(Radius.circular(60)),
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/play.png'),
                                        fit: BoxFit.cover),

                                  ))),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(margin:EdgeInsets.only(right: 40),height: 70,width:70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                color:flottingButtonColor,
                              ),

                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('8',style: TextStyle(color:flottingTextColor,fontFamily: MEDIUM_FONT,fontWeight: FontWeight.w400,fontSize: 22),),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Image.asset('assets/images/Vector.png',width: 30.83,height: 18.83,),
                                  ),
                                ],
                              ),                  ),
                          ),


                        ], //<Widget>[]
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 83,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/rectangle_10.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Center(child: Text('Click here to Upload Advertisement',style: style,)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 67,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFB1B1B1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/dotted.png',),
                            fit: BoxFit.fill),
                      ),
                      child: Center(child: Container(
                          width: MediaQuery.of(context).size.width-61.5,
                          height: 65.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: white,

                          ),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 26),
                                  width:30,height: 30,child: Image.asset('assets/images/thumb.png',color: iconColor,fit: BoxFit.fill,)),
                              Container(
                                  margin: EdgeInsets.only(left: 14),
                                  width:MediaQuery.of(context).size.width-140,child: Text('Chance to won Rs 1,00,000 per week for top like "NEWSFEED" post.',style: style2,)),
                            ],
                          ))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 67,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFB1B1B1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/dotted.png',),
                            fit: BoxFit.fill),
                      ),
                      child: Center(child: Container(
                          width: MediaQuery.of(context).size.width-61.5,
                          height: 65.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: white,

                          ),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 26),
                                  width:30,height: 30,child: Image.asset('assets/images/notess.png',color: iconColor,fit: BoxFit.fill,)),
                              Container(
                                  margin: EdgeInsets.only(left: 14),
                                  width:MediaQuery.of(context).size.width-140,child: Text('Only funny and happy videos within 10 minutes will be considered.',style: style2,)),
                            ],
                          ))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 67,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFB1B1B1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/dotted.png',),
                            fit: BoxFit.fill),
                      ),
                      child: Center(child: Container(
                          width: MediaQuery.of(context).size.width-61.5,
                          height: 65.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: white,

                          ),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 26),
                                  width:30,height: 30,child: Image.asset('assets/images/close_round.png',color: iconColor,fit: BoxFit.fill,)),
                              Container(
                                  margin: EdgeInsets.only(left: 14),
                                  width:MediaQuery.of(context).size.width-140,child: Text('Accounts that post sex and hate contents will be banned.',style: style2,)),
                            ],
                          ))),
                    ),
                    SizedBox(
                      height: 100,

                    ),
                    // SizedBox(height: 24)


                  ],
                ),
              ),
            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 73,
              width: MediaQuery.of(context).size.width,
              decoration: buttongradient,
              child: Center(child: Text('GIFT BOARD',style: style,)),
            ),
          ),

        ],
      ),
    );
  }

}