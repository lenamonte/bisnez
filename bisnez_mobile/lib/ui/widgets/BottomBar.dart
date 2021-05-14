import 'package:basic_login_page/repository/user_repository.dart';
import 'package:basic_login_page/ui/arguments/UserArgument.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int position;

  BottomBar({this.position});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 30.0,
                color: widget.position == 0 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: widget.position == 1 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.blue[700],
                  onPressed: () => print('Upload photo'),
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30.0,
                color: widget.position == 3 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30.0,
                color: widget.position == 4 ? Colors.black : Colors.grey,
              ),
              label: ""),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 4:
              Navigator.pushNamed(context, '/user',
                  arguments: UserArgument(true, _auth.getCurrentUser().id));
              break;
            default:
          }
        },
      ),
    );
  }
}
