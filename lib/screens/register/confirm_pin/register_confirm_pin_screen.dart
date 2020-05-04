import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/confirm_pin/confirm_pin.dart';
import 'package:payment_app/user_repository.dart';

class RegisterConfirmPinScreen extends StatelessWidget {
    final UserRepository _userRepository;

  RegisterConfirmPinScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Pin')),
      body: Center(
        child: BlocProvider<RegisterConfirmPinBloc>(
          create: (context) => RegisterConfirmPinBloc(),
          child: RegisterConfirmPin(userRepository: _userRepository),
        ),
      ),
    );
  }
}
