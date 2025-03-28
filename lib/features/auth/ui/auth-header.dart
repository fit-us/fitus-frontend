import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),

        Center(child: Image.asset("assets/fitus-logo.png")),
        SizedBox(height: 16),

        Center(child: Text(title, style: TextStyle(fontSize: 16))),
        SizedBox(height: 32),
      ],
    );
  }
}
