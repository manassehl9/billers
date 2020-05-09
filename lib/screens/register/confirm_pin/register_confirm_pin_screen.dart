import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/confirm_pin/confirm_pin.dart';
import 'package:payment_app/resources/user_repository.dart';

class RegisterConfirmPinScreen extends StatelessWidget {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String streetAddress;
  final String city;
  final String state;
  final String pin;

  RegisterConfirmPinScreen(
      {Key key,
      @required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName,
      @required this.dateOfBirth,
      @required this.gender,
      @required this.streetAddress,
      @required this.city,
      @required this.state,
      @required this.pin})
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
          child: RegisterConfirmPin(
              userRepository: _userRepository,
              firstName: firstName,
              lastName: lastName,
              dateOfBirth: dateOfBirth,
              gender: gender,
              streetAddress: streetAddress,
              city: city,
              state: state,
              pin: pin),
        ),
      ),
    );
  }
}
