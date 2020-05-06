import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/address/bloc/bloc.dart';
import 'package:payment_app/screens/register/address/register_address.dart';
import 'package:payment_app/user_repository.dart';

class RegisterAddressScreen extends StatelessWidget {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;

  RegisterAddressScreen(
      {Key key,
      @required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName,
      @required this.dateOfBirth,
      @required this.gender})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Address')),
      body: Center(
        child: BlocProvider<RegisterAddressBloc>(
          create: (context) => RegisterAddressBloc(),
          child: RegisterAddress(
            userRepository: _userRepository,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            gender: gender
          ),
        ),
      ),
    );
  }
}
