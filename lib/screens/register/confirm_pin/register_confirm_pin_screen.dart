import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/confirm_pin/confirm_pin.dart';

class RegisterConfirmPinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Pin')),
      body: Center(
        child: BlocProvider<RegisterConfirmPinBloc>(
          create: (context) => RegisterConfirmPinBloc(),
          child: RegisterConfirmPin(),
        ),
      ),
    );
  }
}
