import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';

import 'home_screen_video.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);

class HomeScreenRed extends StatefulWidget{

  @override
  _HomeScreenRedState createState() => new _HomeScreenRedState();
  }
class _HomeScreenRedState extends State<HomeScreenRed>{

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new PreferredSize(
          child: new Container(
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).padding.top
            ),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight:Radius.circular(60) ),
                image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_33.png'),
                    fit: BoxFit.cover),
            ),

            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('FREEZLOTTO',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: SEMI_BOLD_FONT,letterSpacing: 2),),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TabBar(
                      unselectedLabelColor: white,
                      isScrollable: false,
                      labelColor: Colors.black,
                      labelStyle: style2,

                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white),
                      tabs: [

                        Tab(
                          child: Container(
                          height: 40,
                          decoration:BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(5)),

                    ),
                          child: Center(child: Text('Home',)),)),
                        Tab(child: Container(
                          height: 40,
                          decoration:BoxDecoration(
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.all(Radius.circular(5)),

                          ),child: Center(child: Text('Newsfeed',)),)),
                        Tab(child: Container(
                          height: 40,
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: white),
                          ),child: Center(child: Text('Gallery',)),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          preferredSize: new Size(
              MediaQuery.of(context).size.width,
              125.0
          ),
        ),
        floatingActionButton: Container(
          width: 72,
          height: 72,
          margin: EdgeInsets.only(right: 45,bottom: 15),
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
            backgroundColor: flottingRedTextColor,

          ),
        ),
        backgroundColor: white,
        bottomNavigationBar: Container(
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
        body:
        getFullView(),

      ),
    );
  }

  Widget getFullView() {
    return TabBarView(
      children: [
        homePage(),
        homePage(),
        homePage(),
        // newsfeedPage();
        // gallery();
      ],
    );

  }
  Widget homePage(){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreenVideo()),
        );

      },
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-263,
              child:Stack(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height-263,width: MediaQuery.of(context).size.width,
                    child: Center(child: Image.asset('assets/images/bg.png',fit: BoxFit.fill,)),),
                  Container(margin:EdgeInsets.only(bottom:50,top: 40),height: MediaQuery.of(context).size.height-263,width: MediaQuery.of(context).size.width,
                    child: Center(child: Image.asset('assets/images/bg_dummy.png',fit: BoxFit.fill,)),),


                ], //<Widget>[]
              ),
            )
          ],
        ),
      ),
    );
  }

}