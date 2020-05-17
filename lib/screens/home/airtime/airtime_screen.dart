import 'package:flutter/material.dart';
import 'package:payment_app/screens/home/airtime/airtime_form.dart';

class AirtimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buy Airtime')),
      backgroundColor: Colors.white,
      body: Center(child: AirtimeForm()),
    );
  }
}
