import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jsonplaceholder/models/posts.dart';

Future<List> getDataPost() async {
  // Uri urlUser = Uri.parse("https://jsonplaceholder.typicode.com/users");
  // Uri urlPost = Uri(
  //   scheme: "https",
  //   host: 'jsonplaceholder.typicode',
  //   path: '.com/posts',
  // );
  Uri urlPost = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  http.Response postUrl = await http.get(urlPost);

  List dataPost = jsonDecode(postUrl.body);

  // print(dataPost[0].runtimeType);

  return dataPost;
}
