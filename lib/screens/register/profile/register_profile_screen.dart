import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/profile/bloc/bloc.dart';
import 'package:payment_app/screens/register/profile/register_profile.dart';
import 'package:payment_app/user_repository.dart';

class RegisterProfileScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterProfileScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterProfileBloc>(
          create: (context) =>
              RegisterProfileBloc(userRepository: _userRepository),
          child: RegisterProfile(),
        ),
      ),
    );
  }
}
