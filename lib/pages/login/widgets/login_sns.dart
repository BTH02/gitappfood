import 'package:flutter/material.dart';

class LoginSns extends StatelessWidget {
  const LoginSns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {}, icon: Image.asset("images/facebook.png")),
          IconButton(
              onPressed: () {}, icon: Image.asset("images/google.png")),
          IconButton(
              onPressed: () {}, icon: Image.asset("images/twitter.png")),
        ],
      ),
    );
  }
}
