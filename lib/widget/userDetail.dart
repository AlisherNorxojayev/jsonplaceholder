import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jsonplaceholder/models/user.dart';
import 'package:jsonplaceholder/services/dataUser.dart';

class UserDetail extends StatelessWidget {
  final int userIndex;
  const UserDetail({super.key, required this.userIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getDataUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              User user = User.FromJson(snapshot.data![userIndex-1]);
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  Text(user.email),
                  Text("User id: " + "${user.id}")
                ],
              ));
            } else if (snapshot.hasError) {
              return Text("Has Error");
            }
            return Text("UserDetail");
          },
        ));
  }
}
