import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 12,letterSpacing: 0.8);

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
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TabBar(
                      unselectedLabelColor: white,
                      isScrollable: false,


                      labelColor: Colors.black,
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
                          child: Center(child: Text('Home')),)),
                        Tab(child: Container(
                          height: 40,
                          decoration:BoxDecoration(
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.all(Radius.circular(5)),

                          ),child: Center(child: Text('Newsfeed')),)),
                        Tab(child: Container(
                          height: 40,
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: white),
                          ),child: Center(child: Text('Gallery')),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
          preferredSize: new Size(
              MediaQuery.of(context).size.width,
              150.0
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
        Icon(Icons.flight, size: 350),
        Icon(Icons.directions_transit, size: 350),
        Icon(Icons.directions_car, size: 350),
      ],
    );

  }
  Widget getMiddleContainer(){
    return Container(
      margin: EdgeInsets.only(left:30 ,top: 20,right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lets get started',style: TextStyle(color: HeadTextColor,fontWeight: FontWeight.w600,fontFamily: FONT_BOLD,fontSize: 20),),
          Text('Create an account to better manage people in your team.',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 16,letterSpacing: 0.8)),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('Name',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8)),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Mobile number',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8)),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:35,),
                SizedBox(height:25,width: 1,child: VerticalDivider(width: 1,color:Colors.black.withOpacity(0.3))),
                SizedBox(width:MediaQuery.of(context).size.width-100,
                   ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Reference number',style: TextStyle(color: SubHeadTextColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8)),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_3.png'),
                  fit: BoxFit.cover),
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:35,),
                SizedBox(height:25,width: 1,child: VerticalDivider(width: 1,color:Colors.black.withOpacity(0.3))),
                SizedBox(width:MediaQuery.of(context).size.width-132,
                   ),
                SizedBox(
                  width: 36,
                  height: 46,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(height: 35,width: 35,
                          child: Center(child: Image.asset('assets/images/gradient_circle.png',fit: BoxFit.fill,)),),
                        SizedBox(height: 35,width: 35,
                          child: Center(child: Image.asset('assets/images/i_icon.png',fit: BoxFit.fill,)),),


                      ], //<Widget>[]
                    ), //Stack
                  ), //Center
                ),
              ],
            ),
          ),
          Container(
            height: 43,
            margin: EdgeInsets.only(left: 45,right:45,top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_10.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(child: Text('SUBMIT',style:TextStyle(fontSize: 15,color:white,fontWeight:FontWeight.w500,fontFamily: REGULAR_FONT,letterSpacing: 1.5),)),
          )
        ],
      ),
    );
  }

}