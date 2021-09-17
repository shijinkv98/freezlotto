import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/payment_details_screen.dart';
import 'package:freezlotto/screens/payment_screen.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: BoldTextColor2,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 30,letterSpacing: 0.8);
final TextStyle style4 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
class UploadSuccess extends StatefulWidget{
 String type;
  @override
  _UploadSuccessState createState() => new _UploadSuccessState(type:this.type);
  UploadSuccess({this.type});
  }
class _UploadSuccessState extends State<UploadSuccess> {
  String type;
  _UploadSuccessState({this.type});
  @override
  void initState() {
    super.initState();
    new     Future.delayed(
        const Duration(seconds: 2),
            () => type=="free"?nextPagePushReplacement(context, HomeScreen()):nextPagePushReplacement(context, PaymentDetailsScreen()));
      // ApiCall().getUserToken().then((token) => {
      //   if (token != null &&
      //       token.trim().isNotEmpty)
      //     {
      //       debugPrint("token: "+token),
      //       Navigator.of(context).pushReplacementNamed('/homenew')}
      //   else
      //     {Navigator.of(context).pushReplacementNamed('/login')}
      // }),
      // () => Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => LoginScreen()),
      //     )
    // );
  }



  @override
  Widget build(BuildContext context) {
    return getAppBar(context, " Switch to Admin App",getBody());
  }
  Widget getBody(){
    return Center(
      child: getContent(),
    );
}

  Widget getContent(){
    return InkWell(
      // onTap: (){
      //   nextPagePush(context, )
      // },
      child: Container(
        margin: EdgeInsets.only(left: 30,right: 30),
        width: MediaQuery.of(context).size.width,
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              width: 136,
              height: 136,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/success_circle.png'),
                    fit: BoxFit.fill),
              ),
              child:Padding(
                padding: const EdgeInsets.all(35.0),
                child: Image.asset('assets/images/success.png',width: 39,height: 48,),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Congratulation !',style: style,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20 ),
              child: Text('Your Advertisement uploaded successfully, ',style: style4,textAlign: TextAlign.center,),
            ),

          ],
        ),
      ),
    );
  }

}
