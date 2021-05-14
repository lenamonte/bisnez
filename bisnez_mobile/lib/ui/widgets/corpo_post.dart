import 'package:flutter/cupertino.dart';

class CorpoPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
/*@override
Widget _buildPost(post) {
  DateTime postDate = post['date'].toDate();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Container(
      width: double.infinity,
      //height: 560.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image(
                          height: 50.0,
                          width: 50.0,
                          image:
                              NetworkImage(post['authorImageUrl'].toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    post['authorName'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(postDate.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.more_horiz),
                    color: Colors.black,
                    onPressed: () => print('More'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    post['body'],
                    textAlign: TextAlign.justify,
                  ),
                ),
                InkWell(
                  onDoubleTap: () => print('Like post'),
                  onTap: () {
                    Navigator.pushNamed(context, '/post', arguments: post);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 5),
                          blurRadius: 13.0,
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(post['imageUrl'].toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                iconSize: 30.0,
                                onPressed: () => print('Like post'),
                              ),
                              Text(
                                '2,515',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0),
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.chat),
                                iconSize: 30.0,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/post',
                                      arguments: post);
                                },
                              ),
                              Text(
                                '350',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark_border),
                        iconSize: 30.0,
                        onPressed: () => print('Save post'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
*/
