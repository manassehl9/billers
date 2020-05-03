import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/basics/bloc/register_basic_bloc.dart';
import 'package:payment_app/screens/register/basics/register_basic.dart';

class RegisterBasicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Baisc')),
      body: Center(
        child: BlocProvider<RegisterBasicBloc>(
          create: (context) => RegisterBasicBloc(),
          child: RegisterBasic(),
        ),
      ),
    );
  }
}
