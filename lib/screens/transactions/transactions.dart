import 'package:flutter/material.dart';
import 'package:payment_app/screens/home/home_screen.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      children: <Widget>[
        UpcomingCard(
          title: 'MTN recharge',
          value: 280.0,
          color: Colors.purple,
        ),
        Divider(),
        UpcomingCard(
          title: 'Transfer',
          value: 260.0,
          color: Colors.blue,
        ),
        Divider(),
        UpcomingCard(
          title: 'DSTV subscription',
          value: 210.0,
          color: Colors.orange,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
        Divider(),
        UpcomingCard(
          title: 'Cred Card Text Two',
          value: 110.0,
          color: Colors.pink,
        ),
      ],
    );
  }
}
