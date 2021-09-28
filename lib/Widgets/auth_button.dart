import 'package:flutter/material.dart';
class AuthButton extends StatelessWidget {

  AuthButton({
    required this.tap,
    required this.text,
  });
  Function tap;
  String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()  {
        tap();
      },
      height: 50.0,
      minWidth: 170.0,
      child: Text(text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold , )),
      color: Colors.blue.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}