import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/pin/pin.dart';
import 'package:payment_app/user_repository.dart';

class RegisterPinScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterPinScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Pin')),
      body: Center(
        child: BlocProvider<RegisterPinBloc>(
          create: (context) => RegisterPinBloc(),
          child: RegisterPin(
            userRepository: _userRepository,
          ),
        ),
      ),
    );
  }
}
