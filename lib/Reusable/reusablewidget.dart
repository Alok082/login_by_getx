import 'package:flutter/material.dart';

Image covidlogo(String imagename) {
  return Image.asset(imagename);
}

TextField reusabletextFormField(String text, IconData icon, bool ispasswordtype,
    TextEditingController controller) {
  return TextField(
      controller: controller,
      obscureText: ispasswordtype,
      enableSuggestions: !ispasswordtype,
      autocorrect: !ispasswordtype,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(113, 255, 255, 255),
        hintText: text,
        prefixIcon: Icon(icon, color: const Color.fromARGB(242, 255, 253, 253)),
        hintStyle: TextStyle(color: Color.fromARGB(242, 255, 253, 253)),
        border: OutlineInputBorder(
            gapPadding: Checkbox.width * 0.1,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
      keyboardType: ispasswordtype
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress);
}

ElevatedButton reusablebutton(String childtext, Function() buttonaction) {
  return ElevatedButton(
    onPressed: () {
      buttonaction();
    },
    child: Text(
      childtext,
      style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 44, 43, 43)),
    ),
    style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 241, 241, 241))),
  );
}
