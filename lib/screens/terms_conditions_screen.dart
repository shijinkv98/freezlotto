import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/payment_details_screen.dart';
import 'package:provider/provider.dart';

import 'newsfeed_screen.dart';

final TextStyle style = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: BoldTextColor2,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 19,letterSpacing: 0.8);
class TermsConditionsScreen extends StatefulWidget{

  @override
  _TermsConditionsScreenState createState() => new _TermsConditionsScreenState();
  }
class _TermsConditionsScreenState extends State<TermsConditionsScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<GalleryBloc>(context, listen: false).getTermsData(context);

    return getAppBar(context, "Terms and Conditions",getBody());
  }
  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 40,right: 30,bottom: 19),
            child: Text('Terms and Conditions',style: style2,),
          ),
          getTerms(terms_one),
          getTerms(terms_two),
          getTerms(terms_three),
          getTerms(terms_four),
          getTerms(terms_five),
          getTerms(terms_six),
          getTerms(terms_seven),
          getTerms(terms_eight),
          getTerms(terms_nine),
          getTerms(terms_ten),
          getTerms(terms_eleven),
          getTerms(terms_twelve),
          getTerms(terms_thirteen),
          getTerms(terms_fourteen),
          getTerms(terms_fivteen),
          getTerms(terms_sixteen),
          getTerms(terms_seventeen),
        ],
      ),
    );
}



  Widget getTerms(String text){
    return Padding(
      padding: const EdgeInsets.only(left: 38,top:2,right: 30 ),
      child: Text(text,style: style,),
    );
  }

}
