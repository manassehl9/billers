import 'package:flutter/material.dart';
import 'package:payment_app/screens/transactions/transactions.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      backgroundColor: Colors.white,
      body: Center(
        child: Transactions(),
      ),
    );
  }
}
