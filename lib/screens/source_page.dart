import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/widget/camera_button_widget.dart';
import 'package:freezlotto/widget/gallery_button_widget.dart';
class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      // appBar: AppBar(
      //   title: Text('Select Source'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            margin: EdgeInsets.only(left: 30,right:30),
            height: 250,
          decoration: iconGradient,
            child: ListView(
              shrinkWrap: true,
              children: [
                CameraButtonWidget(),
                GalleryButtonWidget(),
              ],
            ),
          ),

        ]

      ),
    );
  }
}