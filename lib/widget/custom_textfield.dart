import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final Function? onClick;
  TextInputType? inputType;
  // String _errorMessage(String str) {
  //   switch (hint) {
  //     case 'Enter your name':
  //       return 'Name is empty !';
  //     case 'Enter your email':
  //       return 'Email is empty !';
  //     case 'Enter your password':
  //       return 'Password is empty !';
  //   }
  // }

  CustomField({this.onClick, this.icon, required this.hint ,this.inputType});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        keyboardType: inputType,
        // validator: (value) {
        //   if (value.isEmpty) {
        //     return _errorMessage(hint);
        //     // ignore: missing_return
        //   }
        // },
        //onSaved: onClick,
        obscureText: hint == 'Enter your password' ? true : false,
        // cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            //  color: kMainColor,
          ),
          filled: true,
          //fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
