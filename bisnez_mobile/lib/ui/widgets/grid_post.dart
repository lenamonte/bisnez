import 'package:basic_login_page/repository/posts_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'elemento_grid_post.dart';
import 'package:basic_login_page/model/post.dart';

class GridPost extends StatelessWidget {
  final postados;

  GridPost(this.postados);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: postados.length,
      itemBuilder: (BuildContext context, int index) {
        final post = Post.fromJson(postados[index]);
        return ElementoGridPost(
          post: post,
        );
      },
    );
  }
}
