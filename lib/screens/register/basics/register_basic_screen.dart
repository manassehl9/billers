import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/basics/bloc/register_basic_bloc.dart';
import 'package:payment_app/screens/register/basics/register_basic.dart';
import 'package:payment_app/user_repository.dart';

class RegisterBasicScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterBasicScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Baisc')),
      body: Center(
        child: BlocProvider<RegisterBasicBloc>(
          create: (context) => RegisterBasicBloc(),
          child: RegisterBasic(userRepository: _userRepository,),
        ),
      ),
    );
  }
}
