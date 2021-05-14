import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/config');
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100))),
          alignment: Alignment.centerRight,
          height: 40,
          padding: EdgeInsets.only(right: 20, left: 20),
          child:
              Image(height: 25, image: AssetImage('assets/icons/config.png')),
        ));
  }
}
