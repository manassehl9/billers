import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/name/bloc/register_name_bloc.dart';
import 'package:payment_app/screens/register/name/name.dart';

class RegisterNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterNameBloc>(
          create: (context) => RegisterNameBloc(),
          child: RegisterName(),
        ),
      ),
    );
  }
}
