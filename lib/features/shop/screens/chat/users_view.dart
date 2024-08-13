import 'package:cwt_ecommerce_ui_kit/features/personalization/models/user_model.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/controllers/dummy_data.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/chat/chat_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class UsersView extends StatefulWidget {
  UsersView({this.title = "الرسائل"});
  final String title;
  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  List<UserModel> users = [];

  Future<List<UserModel>> _getUsers() async {
    users = List.generate(10, (index) {
      return TDummyData.user;
    });

    print("the count is " + users.length.toString());

    return users;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(users[index].firstName),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].profilePicture +
                    users[index].toString() +
                    ".jpg"),
              ),
              subtitle: Text(users[index].email),
              onTap: () {
                Get.to(ChatView());
              },
            );
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DetailPage extends StatelessWidget {
  final UserModel user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
      ),
      body: Container(
        child: Center(
          child: Text(this.user.phoneNumber),
        ),
      ),
    );
  }
}
