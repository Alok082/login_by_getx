import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_by_getx/variables.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.offAllNamed('/');
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            Users user = userList[index];
            return Container(
              color: Color.fromARGB(255, 241, 164, 158),
              height: 90,
              width: double.infinity,
              child: Column(children: [
                Divider(height: 10, color: Colors.white),
                Text(
                  "Username : ${user.username ?? ''}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  "User Email: ${user.useremail ?? ''}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ]),

              // You can customize the content of each list item as needed
            );
          },
        ));
  }
}
