import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_by_getx/variables.dart';

import '../Reusable/reusablewidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailidcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GetStorage box = GetStorage();

  void initState() {
    super.initState();
    List<dynamic>? storedData = box.read('userdata');

    // Check if there is data in the storage
    if (storedData != null) {
      // Convert the dynamic list to a list of Users
      userList = storedData.map((dynamic json) {
        return Users(
          username: json['username'],
          useremail: json['useremail'],
          userpassword: json['userpassword'],
        );
      }).toList();
    }
  }

  // login function
  void login(String username, String password) {
    bool check = userList.any((user) => user.username == username);
    if (check == true) {
      Get.offNamed('/Homescreen');
    } else {
      Get.defaultDialog(
        title: "Message",
        middleText: "Please Sign Up first",
        actions: [
          ElevatedButton(
            onPressed: () {
              // Handle button click
              Get.offNamed("/Signupscreen"); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            12, MediaQuery.sizeOf(context).height * 0.06, 12, 12),
        height: 700,
        padding: EdgeInsets.fromLTRB(
            12, MediaQuery.sizeOf(context).height * 0.02, 12, 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 245, 97, 86),
              Color.fromARGB(255, 105, 187, 255),
              Color.fromARGB(255, 42, 145, 228),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 255, 76, 76), // Shadow color
              blurRadius: 9.0, // Spread of the shadow
              offset: Offset(0, 0), // Offset in x and y direction
            ),
          ],
          borderRadius:
              BorderRadius.circular(10.0), // Optional: Set border radius
        ),
        // color: Colors.black,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                "Login Page",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 241, 255, 222),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.email,
                ),
              ),
            ),
            // Expanded(flex: 5, child: covidlogo('asset/covidimage.png')),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter email",
                    Icons.email_outlined, false, emailidcontroller)),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter Password",
                    Icons.lock_outline, true, passwordController)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Forgot Password? ",
              style: TextStyle(color: Color.fromARGB(255, 79, 77, 77)),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: 38,
                width: double.infinity,
                child: reusablebutton("Login", () {
                  login(emailidcontroller.text, passwordController.text);
                  print("log in button pressed ");
                })),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have a account? ",
                  style: TextStyle(color: Color.fromARGB(255, 79, 77, 77)),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/Signupscreen"),
                  child: const Text(
                    "Sign Up ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            12, MediaQuery.sizeOf(context).height * 0.06, 12, 12),
        height: 700,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 245, 97, 86),
              Color.fromARGB(255, 105, 187, 255),
              Color.fromARGB(255, 42, 145, 228),
            ],
          ),
          // color: Color.fromARGB(255, 162, 235, 181), // Container color
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 255, 76, 76), // Shadow color
              blurRadius: 9.0, // Spread of the shadow
              offset: Offset(0, 0), // Offset in x and y direction
            ),
          ],
          borderRadius:
              BorderRadius.circular(10.0), // Optional: Set border radius
        ),
        // color: Colors.black,
        child: Column(
          children: <Widget>[
            // Expanded(flex: 2, child: covidlogo('asset/covidimage.png')),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter name",
                    Icons.person_2_outlined, false, namecontroller)),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
              height: 52,
              child: reusabletextFormField(
                  "Enter email", Icons.email_outlined, false, emailcontroller),
            ),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter Password",
                    Icons.lock_outline, true, passwordcontroller)),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: 38,
                width: double.infinity,
                child: reusablebutton("Sign Up", () {
                  addUser(namecontroller.text, emailcontroller.text,
                      passwordcontroller.text);
                  print("sign up button pressed");
                })),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void addUser(String name, String email, String password) {
    Users newUser =
        Users(username: name, useremail: email, userpassword: password);

    // Check if userList is empty
    if (userList.isEmpty) {
      userList = [newUser];
    } else {
      userList.add(newUser);
    }

    box.write('userdata', userList.map((user) => user.toJson()).toList());
    Get.offNamed('/Homescreen');
  }
}
