import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_video.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);

class HomePageScreen extends StatefulWidget{

  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState();
  }
class _NewsFeedScreenState extends State<HomePageScreen>{

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:homePage(),


    );
  }
  Widget homePage(){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreenVideo()),
        );
        // getMiddleContainer();
      },
      child:
      Container(
        height: MediaQuery.of(context).size.height,

        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child:
              Container(
                margin: EdgeInsets.only(bottom: 65),
                height: MediaQuery.of(context).size.height/2.3,
                width: MediaQuery.of(context).size.width,
               child:Image.asset("assets/images/bg.png",fit: BoxFit.fill,),

              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 65),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:Container(margin:EdgeInsets.only(bottom:50,top: 40,left: 30,right: 30),
                     height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(31)),
                       image: DecorationImage(
                           image: AssetImage('assets/images/bg_dummy.png'),
                           fit: BoxFit.cover),
                     ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:Container(
                width: 72,
                height: 72,
                margin: EdgeInsets.only(right: 45,bottom: 80),
                child: FloatingActionButton(
                  onPressed: () {},
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('8',style: TextStyle(color:flottingTextColor,fontFamily: MEDIUM_FONT,fontWeight: FontWeight.w400,fontSize: 22),),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset('assets/images/Vector.png',width: 30,height: 20,),
                      ),
                    ],
                  ),
                  mini: false,
                  backgroundColor: flottingButtonColor,

                ),
              ) ,
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
      ),
    );
  }

  Widget getMiddleContainer(){
    return SingleChildScrollView(
      child: Container(

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
                      child: Container(margin:EdgeInsets.only(right: 35),height: 45,width:45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/play.png'),
                                fit: BoxFit.cover),

                          ))),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(margin:EdgeInsets.only(right: 35),height: 65,width:65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        color:flottingButtonColor,
                      ),

                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('8',style: TextStyle(color:flottingTextColor,fontFamily: MEDIUM_FONT,fontWeight: FontWeight.w400,fontSize: 22),),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Image.asset('assets/images/Vector.png',width: 30.83,height: 20.83,),
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
                    image: AssetImage('assets/images/rectangle_dotted.png',),
                    fit: BoxFit.cover),
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
                    image: AssetImage('assets/images/rectangle_dotted.png',),
                    fit: BoxFit.cover),
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
                          width:30,height: 30,child: Image.asset('assets/images/mark.png',color: iconColor,fit: BoxFit.fill,)),
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
                    image: AssetImage('assets/images/rectangle_dotted.png',),
                    fit: BoxFit.cover),
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
                          width:30,height: 30,child: Image.asset('assets/images/close.png',color: iconColor,fit: BoxFit.fill,)),
                      Container(
                          margin: EdgeInsets.only(left: 14),
                          width:MediaQuery.of(context).size.width-140,child: Text('Accounts that post sex and hate contents will be banned.',style: style2,)),
                    ],
                  ))),
            ),
            SizedBox(height: 24)


          ],
        ),
      ),
    );
  }



}