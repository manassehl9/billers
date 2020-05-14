import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/name/bloc/register_name_bloc.dart';
import 'package:payment_app/screens/register/name/name.dart';
import 'package:payment_app/resources/user_repository.dart';

class RegisterNameScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterNameScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      backgroundColor: Colors.white,
      body: Center(
        child: BlocProvider<RegisterNameBloc>(
          create: (context) => RegisterNameBloc(),
          child: RegisterName(
            userRepository: _userRepository,
          ),
        ),
      ),
    );
  }
}
