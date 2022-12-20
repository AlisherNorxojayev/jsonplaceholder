import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getDataUser() async {
  Uri urlUser = Uri(
    scheme: "https",
    host: "jsonplaceholder.typicode.com",
    path: "users",
  );

  http.Response postUser = await http.get(urlUser);

  List dataUser = jsonDecode(postUser.body);
  return dataUser;
}
