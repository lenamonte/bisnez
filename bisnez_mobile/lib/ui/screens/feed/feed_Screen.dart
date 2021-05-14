import 'package:basic_login_page/bloc/feed/feed_bloc.dart';
import 'package:basic_login_page/ui/widgets/BottomBar.dart';
import 'package:basic_login_page/ui/widgets/appBarCustomizada.dart';
import 'package:basic_login_page/ui/widgets/circulos_feed_bar.dart';
import 'package:basic_login_page/ui/widgets/grid_post.dart';
import 'package:flutter/material.dart';
import 'package:basic_login_page/model/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import '../../../bloc/authentication/authentication_bloc.dart';

class FeedScreen extends StatelessWidget {
  final List posts = [
    {
      'authorName': "Pedro",
      'authorImageUrl': "movel1.jpeg",
      'date': '5:15',
      'imageUrl': 'movel2.jpg',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
    },
    {
      'authorName': "Maria",
      'authorImageUrl': "foto.jpeg",
      'date': '5:15',
      'imageUrl': 'movel2.jpg',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
    },
    {
      'authorName': "Pedro",
      'authorImageUrl': "reds.jpeg",
      'date': '5:15',
      'imageUrl': 'movel2.jpg',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEDF0F6),
        appBar: AppBarCustomizada(),
        body: GridPost(posts),
        bottomNavigationBar: BottomBar(
          position: 0,
        ));
  }
}

/*class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  AuthenticationBloc bloc;

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
                                    Navigator.pushNamed(context, '/post', arguments: post);
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

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<AuthenticationBloc>(context);

    void _logout() {
      final signOutEvent = AuthenticationLoggedOut();
      bloc.add(signOutEvent);
    }

    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
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
            ),
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(width: 10.0);
                }
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 60.0,
                  height: 60.0,
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
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        image: AssetImage(stories[index - 1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<FeedBloc, FeedState>(builder: (context, state) {
            if (state is FeedLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FeedLoaded) {
              return new Column(
                children: state.posts.map((post) => _buildPost(post)).toList(),
              );
            }
          }),
        ],
      ),
      bottomNavigationBar: BottomBar(position: 0,)
    );
  }
}
*/
