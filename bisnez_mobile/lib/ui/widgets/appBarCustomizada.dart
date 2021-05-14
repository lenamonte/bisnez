import 'package:basic_login_page/ui/widgets/botao_config.dart';
import 'package:flutter/material.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {
  final String titulo;

  AppBarCustomizada({this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        title: SizedBox(
          child: Image.asset(
            'assets/bisnez.png',
            alignment: Alignment.topLeft,
            height: 80,
          ),
        ),
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
        actions: <Widget>[BotaoConfig()]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

/*ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Bisnez',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 16.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.exit_to_app),
                        iconSize: 30.0,
                        onPressed: () {
                          _logout();
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 30.0,
                        onPressed: () => print('Direct Messages'),
                      ),
                    )
                  ],
                )
              ],
            )*/
