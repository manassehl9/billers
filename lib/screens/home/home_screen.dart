import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/authentication_bloc/authentication_bloc.dart';
import 'package:payment_app/screens/home/airtime/airtime_screen.dart';
import 'package:payment_app/screens/home/internet/internet_screen.dart';
import 'package:payment_app/screens/home/send_money/send_money_screen.dart';
import 'package:payment_app/screens/home/tv/tv_screen.dart';
import 'package:payment_app/screens/settings/settings_screen.dart';
import 'package:payment_app/screens/transactions/transactions_screen.dart';
import 'package:payment_app/utils/appTheme.dart';

class HomeScreen extends StatefulWidget {
  final uid;

  HomeScreen({Key key, @required this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = AppTheme.getTheme().primaryColor;

    return Scaffold(
      // backgroundColor: AppTheme.getTheme().primaryColorLight,
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(widget.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: primaryColor)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.power_settings_new),
                            color: Colors.white,
                            iconSize: 30.0,
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                LoggedOut(),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: CustomShapeClipper(),
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(color: primaryColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Welcome,',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "${snapshot.data['last_name']} ${snapshot.data['first_name']} ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                )
                              ],
                            ),
                            Material(
                              elevation: 1.0,
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.pink.withOpacity(0.8),
                              child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 30.0),
                                child: Text(
                                  'Transactions',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 120.0, right: 25.0, left: 25.0),
                        child: Container(
                          width: double.infinity,
                          height: 370.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0.0, 3.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 40.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.purple.withOpacity(0.1),
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons.send),
                                            color: Colors.purple,
                                            iconSize: 30.0,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SendMoneyScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('Send',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.blue.withOpacity(0.1),
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons.credit_card),
                                            color: Colors.blue,
                                            iconSize: 30.0,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AirtimeScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('Airtime',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.orange.withOpacity(0.1),
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons
                                                .signal_cellular_connected_no_internet_4_bar),
                                            color: Colors.orange,
                                            iconSize: 30.0,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InternetScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('Internet',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.pink.withOpacity(0.1),
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons.tv),
                                            color: Colors.pink,
                                            iconSize: 30.0,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TvScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('TV',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.purpleAccent
                                              .withOpacity(0.1),
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons.lightbulb_outline),
                                            color: Colors.purpleAccent,
                                            iconSize: 30.0,
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('Light',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.deepPurple
                                              .withOpacity(0.1),
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons.attach_money),
                                            color: Colors.deepPurple,
                                            iconSize: 30.0,
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('Loan',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Divider(),
                              SizedBox(height: 15.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Click the button to change your settings',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 40.0),
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.settings),
                                        color: Colors.blueAccent,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingsScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Transactions',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransactionsScreen(),
                              ),
                            );
                          },
                          child: Text('View All',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35.0),
                    child: Container(
                      height: 200.0,
                      child: ListView(
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            //  color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('# $value',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10.0),
              Text('12 Nov 2019, 10:15',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
