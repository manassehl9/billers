import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/pin/pin.dart';

class RegisterPinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Pin')),
      body: Center(
        child: BlocProvider<RegisterPinBloc>(
          create: (context) => RegisterPinBloc(),
          child: RegisterPin(),
        ),
      ),
    );
  }
}
