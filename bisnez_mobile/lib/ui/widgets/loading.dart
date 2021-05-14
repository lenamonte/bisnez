import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = SpinKitThreeBounce(
  color: Colors.cyan,
  size: 30.0,
);

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  height: 300.0,
                  width: 300.0,
                  child: Image.asset('assets/bisnez.png'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                spinkit,
                SizedBox(
                  height: 80.0,
                ),
                Text(
                  "Carregando...",
                  style: TextStyle(fontSize: 35, color: Colors.cyan[700])
                )
              ],
            ),
        )
      )
    );
  }
}