import 'package:flutter/material.dart';
import 'package:payment_app/screens/home/internet/internet_form.dart';

class InternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buy Internet Subscription')),
      backgroundColor: Colors.white,
      body: Center(child: InternetForm()),
    );
  }
}
