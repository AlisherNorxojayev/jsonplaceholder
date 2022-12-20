import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jsonplaceholder/models/posts.dart';
import 'package:jsonplaceholder/services/dataPost.dart';
import 'package:jsonplaceholder/widget/postDetail.dart';

class MyWidgte extends StatelessWidget {
  const MyWidgte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDataPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: ((context, index) {
                  Post post = Post.FromJson(snapshot.data![index]);
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PostDetail(post: post))));
                    },
                    title: Text(post.postTitle),
                  );
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 100);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          return Center(
            child: Text("Widget"),
          );
        },
      ),
    );
  }
}
