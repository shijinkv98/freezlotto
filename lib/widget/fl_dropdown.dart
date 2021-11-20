import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/widget/fl_text.dart';
final TextStyle style = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontFamily: SEMI_BOLD_FONT,
  fontSize: 18,
  letterSpacing: 0.8,
);
class FLDropdown extends StatelessWidget {
  FLDropdown(
      {this.hintText,
      this.subHint,
      this.items,
      this.onChanged,
      this.selectedValue,
      this.displayItem,
      this.searchFn});

  final String hintText;
  final String subHint;
  final String selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final Function displayItem;
  final Function searchFn;

  bool showSubHint = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return new DropdownButtonFormField<String>(
        iconSize: 30.0,
        isExpanded: true,
        hint: Container(
          child: new Row(
            children: [
              new FLText(
                text: hintText,
                color: Colors.white,
                overflow: TextOverflow.visible,
                // fontWeight: FontWeight.w700,
                // fontFamily: SEMI_BOLD_FONT,
                fontSize: 18,
                // letterSpacing: 0.8,
              ),
              subHint != null
                  ? FLText(
                      text: " $subHint",
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                // fontWeight: FontWeight.w700,
                // fontFamily: SEMI_BOLD_FONT,
                fontSize: 18,
                // letterSpacing: 0.8,
                    )
                  : Container()
            ],
          ),
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.0),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.transparent, width: 1.0))),
        items: items.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,

            child: new FLText(
              text: value.trim(),
              color: value == selectedValue?white:Colors.black,
              fontSize: 18,

              // letterSpacing: 0.8,
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            this.showSubHint = false;
          });
          onChanged(value);
        },
        value: selectedValue,
      );
    });
  }

  String _validateField(String text) {
    if (text == null) {
      return "Please select an item";
    } else {
      return null;
    }
  }
}
