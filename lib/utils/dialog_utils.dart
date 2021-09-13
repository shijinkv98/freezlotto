import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DialogUtils {
  static showNoNetworkDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           title: Text('No internet available'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: new Text('Close'), ),
            ],
          );
        });
  }
}
