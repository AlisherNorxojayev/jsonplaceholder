import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jsonplaceholder/models/posts.dart';
import 'package:jsonplaceholder/widget/userDetail.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(post.postBody),
          Text("User id: " + post.userId.toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => UserDetail(userIndex: post.userId)),
                  ),
                );
              },
              child: Text("User"))
        ],
      )),
    );
  }
}
