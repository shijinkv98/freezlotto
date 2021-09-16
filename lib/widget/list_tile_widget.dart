import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 20,letterSpacing: 0.8);

class ListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClicked;

  const ListTileWidget({
    @required this.text,
    @required this.icon,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        text,
        style: style,
      ),
      leading: Icon(icon, size: 28, color: white),
      onTap: onClicked,
    ),
  );
}