import 'package:flutter/material.dart';
import 'package:payment_app/screens/home/send_money/send_money_form.dart';

class SendMoneyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      backgroundColor: Colors.white,
      body: Center(child: SendMoneyForm()),
    );
  }
}
