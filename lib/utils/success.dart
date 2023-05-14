import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String message;
  const SuccessScreen({required this.title, required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Icon(Icons.done),
          Text(message),
        ],
      ),
    );
  }
}
