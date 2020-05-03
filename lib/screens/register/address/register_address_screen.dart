import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/address/bloc/bloc.dart';
import 'package:payment_app/screens/register/address/register_address.dart';

class RegisterAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Address')),
      body: Center(
        child: BlocProvider<RegisterAddressBloc>(
          create: (context) => RegisterAddressBloc(),
          child: RegisterAddress(),
        ),
      ),
    );
  }
}
