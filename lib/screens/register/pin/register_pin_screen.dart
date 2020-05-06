import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/pin/pin.dart';
import 'package:payment_app/user_repository.dart';

class RegisterPinScreen extends StatelessWidget {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String streetAddress;
  final String city;
  final String state;

  RegisterPinScreen(
      {Key key,
      @required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName,
      @required this.dateOfBirth,
      @required this.gender,
      @required this.streetAddress,
      @required this.city,
      @required this.state})
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
              firstName: firstName,
              lastName: lastName,
              dateOfBirth: dateOfBirth,
              gender: gender,
              streetAddress: streetAddress,
              city: city,
              state: state
              ),
        ),
      ),
    );
  }
}
